 /*
  * Infragistics WebMisc CSOM Script: ig_webpanel.js
  * Version 6.3.20063.28
  * Copyright(c) 2001-2006 Infragistics, Inc. All Rights Reserved.
  */


function ig_CreateWebPanel(id,props){
	if(!ig_WebControl.prototype.isPrototypeOf(ig_WebPanel.prototype))
	{
		ig_WebPanel.prototype = new ig_WebControl();
		ig_WebPanel.prototype.constructor = ig_WebPanel;
		ig_WebPanel.prototype.base=ig_WebControl.prototype;

		ig_WebPanel.prototype.fireServerEvent	=function(eventName,data){	__doPostBack(this._uniqueID,eventName+":"+data);}
		ig_WebPanel.prototype.fireEvent			=function(clientEvent,evt)
												{
													if(clientEvent==null||this._isInitializing)return false;
													clientEvent._event.reset();
													clientEvent._event.event=evt;
													clientEvent._event.needPostBack=clientEvent._autoPostBack;
													ig_fireEvent(this,clientEvent._handler,clientEvent._event);
													if(!clientEvent._event.cancel&&clientEvent._event.needPostBack&&!clientEvent._event.cancelPostBack){this.fireServerEvent(clientEvent._eventName,clientEvent._getData())};
													return clientEvent._event.cancel;
												}
		ig_WebPanel.prototype.notifyExpandComplete=function(evt){return this.onExpanded(evt);}
		ig_WebPanel.prototype.getHeader			=function(){return this._header;}
		ig_WebPanel.prototype.onExpanding		=function(e){return this.fireEvent(this._clientSideEvents._expandedStateChanging,e);}
		ig_WebPanel.prototype.onExpanded		=function(e){this._header._element.className=this.getExpanded()?this._header._expandedClass:this._header._collapsedClass; return this.fireEvent(this._clientSideEvents._expandedStateChanged,e);}
		ig_WebPanel.prototype.updateState		=function(propName,value){ig_ClientState.setPropertyValue(this.getViewState(),propName,value);this.updatePostField();}
		ig_WebPanel.prototype.updatePostField	=function(){this._hiddenField.value=ig_ClientState.getText(this.getStateBag());}
		ig_WebPanel.prototype.getStateBag		=function(){if(this._stateBag==null)this._stateBag=ig_ClientState.createRootNode();return this._stateBag;}
		ig_WebPanel.prototype.getViewState		=function(){if(this._viewState==null)this._viewState=ig_ClientState.addNode(this.getStateBag(),"WebPanel");return this._viewState;}
		ig_WebPanel.prototype.getEnabled		=function(){return !(this._element.disabled);}
		ig_WebPanel.prototype.setEnabled		=function(enable){this._element.disabled=!enable;this.updateState("Enabled",enable);}
		ig_WebPanel.prototype.getExpandEffect	=function(){return this._expandEffect}
		ig_WebPanel.prototype.setExpandEffect	=function(effect){this._expandEffect=effect;this.updateState("ExpandEffect",effect);}		
		                                         /* SJZ 2/26/07 - If we do the check on display, then we'll never be able to interrupt a collapse
		                                          * b/c the display doesn't get set to "none" until the collapse is done*/
		ig_WebPanel.prototype.getExpandOnClick	=function() {return this._expandOnClick;}
		ig_WebPanel.prototype.getExpanded		=function(){return this._expanded;}//this._contentPanelElement.style.display!="none";}
		ig_WebPanel.prototype.setExpanded		=function(expand,evt)
												{   
													var useEffect=this._expandEffect==1 && this._expandEffectSupported&&!this._isInitializing;
													var useEffectInit = this._expandEffect==1 && this._expandEffectSupported&&this._isInitializing;													
													if(this.getExpanded()==expand && !this._isInitializing)return;
													
													/* SJZ 2/26/07 - BR20574 - This is the scenario when the webpanel is in the middle of an expand
												     * or a collapse, and it gets interrupted to do the opposite (if expanding then collapsing). What would
												     * happen, is the panel would loose track of how far it was, and it would miscalculate the height of the
												     * content area. To fix this, we need to call endSlide on the current expand/collapse and then continue
												     * doing the new command */
												    if(this._expandEffectGenerator != null && this._expandEffectGenerator._shrinkProcess != null)
												        igpnl_endSlide(this.getExpanded(), this._expandEffectGenerator);
													
													/* SJZ 2/20/07 BR20170 - Need to update the state before the onExpanding is called so that
													 * the state gets stored, before WARP panel stores the info to be sent to the server */
													this.updateState("Expanded",expand?"true":"false");
													if(this.onExpanding(evt))
													{
													    this.updateState("Expanded",!expand?"true":"false");
													    return;	
												    }
												    /* SJZ 2/26/07 - use the global member instead of using the display of the content area, b/c 
												     * it won't always be accurate if in the middle of a collapse */
												    this._expanded = expand;
													this.switchExpansionIndicator(expand);
													
													if(this._clientSideEvents._expandedStateChanging._autoPostBack && expand)
														return;
													if(!useEffect && !useEffectInit)/* The code below is only used when effects are turned off */
													{
														if(expand)
														{
															/* SJZ 10/9/06 - We should always return the height to what it was originaly*/
															if(this._preCollapseHeight!=null)
																this._element.style.height=this._preCollapseHeight;
														}
														else
														{
															this._preCollapseWidth=this._element.offsetWidth;
															if(this._element.style.height!=null)
															{
																/* SJZ 10/9/06 - We should always return the height to what it was originaly*/
																this._preCollapseHeight= this._element.style.height; //parseInt(this._element.style.height?this._element.style.height:this._element.offsetHeight);
																this._element.style.height=this._headerElement.offsetHeight;
															}
														}
													}
													var row=this._contentPanelElement.parentNode;
													if(expand)
														this.adjustSizes(true);
													else 
													{
														/* SJZ 11/20/06 - The _originalHeight variable is used to calculate how much the WebPanel should expand to, when 
														 * expanding with an expandEffect. We should update this value every time we collapse. B/c the webpanel might have
														 * content that allows it to expand or shrink the size of the webpanel. For example a webtree*/
														this._originalHeight = this._contentPanelElement.offsetHeight;
	    												
	    												/* SJZ 2/26/07 In XHTML the border is counted into the height, which can lead to the height of
	    												 * the content area growing every time it expands */
		    											this._adjustOriginalHeight();
													}
																									
													if(useEffect )
													{
														if(this._expandEffectGenerator==null)this._expandEffectGenerator=new igpnl_ExpandEffectGenerator(this);
														this._expandEffectGenerator.expand(expand,evt);
													}
													else if(useEffectInit)
													{
														if(!expand)
														{															
															if(this._expandEffectGenerator==null)
																this._expandEffectGenerator=new igpnl_ExpandEffectGenerator(this);
														
															/* SJZ 11/21/06 BR17445 - This code is executed whenever the panel starts out
															 * collaped, but should have an expand effect. In this case, we need to do some 
															 * initializing so that all the correct properties are set when they expand. 
															 * However, one thing that needed to be set, but wasn't was the originalPosition,
															 * so that all inner contents get hidden */
															 /* SJZ 3/29/07 BR20982 - was setting the _originaPos property on the wrong object */
															this._expandEffectGenerator._originalPos = this._expandEffectGenerator._contentArea.style.position;
															
															/* D.M. BR26504 9/20/2007 - Setting the relative position on the DIV rather than the TD here so Firefox will recognize it. */
															this._expandEffectGenerator._contentArea.childNodes[0].style.position="relative";																	
															this._expandEffectGenerator._panel._originalContentAreaHeight = (this._expandEffectGenerator._panel._originalContentAreaHeight==null ? this._expandEffectGenerator._contentArea.style.height : this._expandEffectGenerator._panel._originalContentAreaHeight);
															
															/* D.M. 11/14/2007 BR27974 - If for some reason the panel is not visible at this point it becomes impossible to determine the
															 * offset height in FX because the offset parent is null.  So if FX is detected we climb the element tree until we find a usable
															 * offset parent. */
															if(this._expandEffectGenerator._contentArea.offsetParent != null && !ig_csom.IsFireFox)
															{
															this._expandEffectGenerator._panel._originalContentAreaParentHeight = (this._expandEffectGenerator._panel._originalContentAreaParentHeight==null ? this._expandEffectGenerator._contentArea.offsetParent.style.height : this._expandEffectGenerator._panel._originalContentAreaParentHeight);		
															}
															else
															{
																
																var currentNode = this._expandEffectGenerator._contentArea;
																while(currentNode.offsetParent == null)
																	currentNode = currentNode.parentNode;
																
																if(currentNode != null)
																{
																	this._expandEffectGenerator._panel._originalContentAreaParentHeight = (this._expandEffectGenerator._panel._originalContentAreaParentHeight==null ? currentNode.offsetParent.style.height : this._expandEffectGenerator._panel._originalContentAreaParentHeight);
																}		
															}
															this._expandEffectGenerator._panel._originalContentAreaParentHeight = (this._expandEffectGenerator._panel._originalContentAreaParentHeight==null ? this._expandEffectGenerator._contentArea.offsetParent.style.height : this._expandEffectGenerator._panel._originalContentAreaParentHeight);		
															if(this._expandEffectGenerator._panel._contentHeight==null || (!expand && this._expandEffectGenerator._panel._contentHeight!=this._expandEffectGenerator._contentArea.offsetHeight))this._expandEffectGenerator._panel._contentHeight=this._expandEffectGenerator._contentArea.offsetHeight;
															igpnl_endSlide(false,this._expandEffectGenerator);
															
															if(ig_csom.IsIE)
															{
																this._expandEffectGenerator._contentArea.firstChild.style.overflowY="hidden";
																/* SJZ 3/29/07 - Found this issue while fixing BR20982 - what happens is, b/c the content area is already hidden, 
																 * the default value of the contentarea shows up up as "hidden", which is incorrect */
																this._expandEffectGenerator._originalOverflow = "";
														    }
															else
																this._expandEffectGenerator._contentArea.firstChild.style.overflow="hidden";																													
														}
													}
													else
													{
														if(!expand)	this.adjustSizes(false);
														this.onExpanded(evt);
													}
												}
												
	    ig_WebPanel.prototype._getCurrentStyle=function(elem)
	                                            {
	                                                var style = elem.currentStyle;
                                                    if(style == null)
                                                    {
                                                        var w = document.defaultView;	
                                                        if(w == null)
	                                                        w = window;
                                                        if(w.getComputedStyle)
	                                                        style = w.getComputedStyle(elem, '');
                                                    }
                                                    return style;
	                                            }
	    ig_WebPanel.prototype._adjustOriginalHeight=function()
	                                            {
	                                                /* SJZ 2/26/06 - The border information of the panel area is stored using CSS. So in order
	                                                 * to get the value, we need to check the currentStyle (IE) or computedStyle(firefox). */
	                                                var cs = this._getCurrentStyle(this._contentPanelElement);
													if(cs != null && this._isXHTML)														
													{
													    var borderTop = parseInt(cs.borderTopWidth);
													    var borderBottom = parseInt(cs.borderBottomWidth);
													    if(borderTop != null && borderTop.toString() != "NaN")
													        this._originalHeight -= borderTop;
													    if(borderBottom != null&& borderBottom.toString() != "NaN")
													        this._originalHeight -= borderBottom;
													}
	                                            }
		ig_WebPanel.prototype.switchExpansionIndicator=function(expand)
												{
													var img=this._header._imageElement;
													var imgSrc=(expand?img.getAttribute("expandedUrl"):(img.getAttribute("collapsedUrl")?img.getAttribute("collapsedUrl"):img.getAttribute("expandedUrl")));
													if(imgSrc){
													    img.src=imgSrc;
													    var alt=(expand?img.getAttribute("igAltX"):img.getAttribute("igAltC"));
													    if(alt){
													        img.setAttribute("alt",alt);
													        var lb=ig.getElementById(this._clientID+"_lbl");
													        if(lb) lb.innerHTML=alt;
													    }
													}
												}							
		ig_WebPanel.prototype.adjustSizes		=function(expand)
												{
													var row=this._contentPanelElement.parentNode;
													if(!expand)
													{
														var headerHeight = this._headerElement.offsetHeight;
														this._contentPanelElement.style.display=row.style.display="none";
														if(this._element.offsetWidth<this._preCollapseWidth)this._element.style.width=this._preCollapseWidth;
														this._element.style.height=headerHeight + "px";
													}else{	
														this._contentPanelElement.style.display=row.style.display="";
													}
												}
		ig_WebPanel.prototype.getVisible		=function(){return this._element.style.display!="none";}
		ig_WebPanel.prototype.setVisible		=function(show){ this._element.style.display=(show?"":"none");this.updateState("Visible",show);}
		ig_WebPanel.prototype.init				=function(id,props)
												{
													var o; 
													if(ig_all)
														o = ig_all[id]; 
													
													if(o)
													{
														if(o._expandEffectGenerator)
															clearTimeout(o._expandEffectGenerator._shrinkProcess)
														//return;
													}
													this.base.init.apply(this,[id]);
													this._isInitializing=true;
													this.Type="WebPanel";
													if(props!=null&&props.length){
														this._expandEffectSupported	= !((navigator.userAgent.toLowerCase().indexOf("win98")!=-1) || (navigator.userAgent.toLowerCase().indexOf("windows 98")!=-1));
														this._uniqueID				=props[0];
														this._clientID				=props[1];
														this._expanded				=props[2];
														this._enabled				=props[3];
														this._expandEffect			=props[4];
														this._element				=ig.getElementById(this._clientID);
														this._contentPanelElement	=ig.getElementById(id+"_content");														
														this._headerElement			=ig.getElementById(id+"_header");
														/* SJZ 11/20/06 - Added to address bug where if height of panel is not set, it should 
														 * be a resizable panel. Meaning, its content would determine its size. And if the content resizes
														 * so should the WebPanel. These 2 variables give me a reference to see what their orignal height/width were */		
														this._serverHeight			=props[8];
														this._serverWidth			=props[9];
														this._expandOnClick			=props[10];
														
														/* SJZ 2/27/07 - Need to take in account the case in which the height is specified via
														 * a stylesheet and not on the control level */		
														var tempStyle = this._getCurrentStyle(this._element);
														if(tempStyle != null)
														    this._serverHeight = tempStyle.height;
														 if(this._serverHeight == "auto" || this._serverHeight == "0px")
														    this._serverHeight = "";
														    
														this._isXHTML               =(document.documentElement != null && document.documentElement.clientHeight != 0);								
														/* SJZ 10/13/06 - When the content area is empty, the Server renders out a non breaking space 
														 * between the contentpanel div and the td that encapsulates it. In XHTML that &nbps causes the
														 * panel's height to grow about 15px or so, which shouldn't happen */
														if(this._isXHTML)
														{
															if(this._contentPanelElement.childNodes.length == 2)
																this._contentPanelElement.removeChild(this._contentPanelElement.childNodes[1]);
														}
														
														/* SJZ 11/21/06 BR16135 - If there is no Height set on the WebPanel, it should resize with its contents.
														 * (i.e. a tree expands past the height of the panel, the panel's height should grow. Normally we set a height
														 * of a 100% on the div inside the contentarea. However, in firefox, with a non XHTML doctype, if the div has
														 * a height set on it, this won't happen. So lets remove the height, so that it acts correctly */
														if(!ig_shared.IsIE && this._serverHeight == "")
															this._contentPanelElement.childNodes[0].style.height = "";
														this._originalHeight = this._contentPanelElement.offsetHeight;
														/* SJZ 2/26/07 In XHTML the border is counted into the height, which can lead to the height of
	    												 * the content area growing every time it expands */
														this._adjustOriginalHeight();
														    
														this._clientSideEvents		=new igpnl_ClientSideEvents(this,props[5]);
														this._panelClass			=props[6];
														this._header				=new ig_PanelHeader(this,this._headerElement,props[7]);
														
														/* SJZ 2/26/07 - In IE when the dotype is XHTML, the height of the webpanel grows 
														 * by the size of the header. In order to adjust for this. This can only be done, if there is a
														 * height set on the panel on the serverSide. Otherwise, we would lock the height and it wouldn't grow with it's content*/
														if(ig_shared.IsIE && this._isXHTML && this._serverHeight != "" && this._serverHeight.indexOf("%") == -1)
														{
														    /* DM 3/27/07 In IE if the height of the panel is set to something really small 
														     * a negative value can result which causes an exception.*/														     														
														    if(this._originalHeight > this._header._element.offsetHeight)
														    {
														        this._originalHeight -= this._header._element.offsetHeight;
														        this._element.style.height = this._originalHeight + "px";
														    }
														}
														
														this._hiddenField			=ig.getElementById(this._uniqueID+"_hidden");
														if(this._hiddenField==null)
															this._hiddenField=(typeof(document.getElementsByName)!="undefined"?(document.getElementsByName(this._uniqueID+"_hidden"))[0]:null);
																																										
														if(!this._expanded)this.setExpanded(this._expanded);
														if(!this._enabled)this.setEnabled(this._enabled);
																												
													}
													
													this._isInitializing=false;
												}//init()
	}
	return new ig_WebPanel(id, props);
}
function ig_WebPanel(id,props){
	if(arguments.length>0)this.init(id,props);
}
function igpnl_getPanelById(id){
	return ig_getWebControlById(id);
}
igpnl_ClientSideEvents.prototype.constructor=igpnl_ClientSideEvents;
igpnl_ClientSideEvents.prototype.init=function(panel,props){
	this._panel=panel;
	this._expandedStateChanging=new igpnl_ClientSideEvent(this._panel,props[0],"ExpandedStateChanging");
	this._expandedStateChanging._getData=function(){return !this._panel.getExpanded();}
	this._expandedStateChanged=new igpnl_ClientSideEvent(this._panel,props[1],"ExpandedStateChanged");
	this._expandedStateChanged._getData=function(){return this._panel.getExpanded();}
}
function igpnl_ClientSideEvent(panel,props,name){
	this._panel=panel;
	this._handler=props[0];
	this._autoPostBack=props[1];
	this._eventName=name;
	this._event=new ig_EventObject();
}
function igpnl_ClientSideEvents(panel,props){
	if(arguments.length<2)return;
	this.init(panel,props);
}
ig_PanelHeader.prototype.constructor=ig_PanelHeader;
ig_PanelHeader.prototype.onMouseOver			=function(evt){if(!this.getEnabled()|| this._header._hoverClass.length == 0)return; this._header._element.className+=" "+this._header._hoverClass;}
ig_PanelHeader.prototype.onMouseOut				=function(evt)
												{
													if(!this.getEnabled())
														return;
													this._header._element.className = "";
													if(this._header._panel.getExpanded())
													{
														if(this._header._expandedClass.length>0 && this._header._element.className !=this._header._expandedClass )
															this._header._element.className=this._header._expandedClass;
													}
													else
													{
														if(this._header._collapsedClass.length>0 && this._header._element.className!=this._header._collapsedClass)
															this._header._element.className=this._header._collapsedClass;
													}
												}
// A.T. Single click expansion
ig_PanelHeader.prototype.onButtonClick =		 function(evt) { var panel = igpnl_getCallBackObject(evt); if (panel != null && panel.getEnabled()) { panel.setExpanded(!panel.getExpanded(), evt); if (panel.getExpandOnClick()) ig_cancelEvent(evt); } }
ig_PanelHeader.prototype.onHeaderDoubleClick	=function(evt){var panel=igpnl_getCallBackObject(evt);if(panel!=null&&panel.getEnabled()){panel.setExpanded(!panel.getExpanded(),evt);}}
ig_PanelHeader.prototype.setVisible				=function(show){this._element.style.display=(show?"":"none");}
ig_PanelHeader.prototype.getVisible				=function(){return this._element.style.display!="none";}
function igpnl_getCallBackObject(evt)
{
	var element=ig.getSourceElement(evt);
	if(!element.__isEventReady){
		while(element!=null && !element.__isEventReady && element.tagName!="BODY")element=element.parentNode;
	}
	return (element!=null?element.__callBackObject:null);
}
function igpnl_addCallBackHandler(objectToCallBack,element,eventName,functionHandler)
{
	element.__callBackObject=objectToCallBack;
	element.__isEventReady=true;
	ig.addEventListener(element,eventName,functionHandler,false);
}
function ig_PanelHeader(panel,element,props)
{
	this._panel				=panel;
	this._element			=element;
	this._imageElement		=ig.getElementById(this._element.id+"_img");
	this._expandedClass		=props[0];
	this._collapsedClass	=props[1];
	this._hoverClass		=props[2];
	
	ig.createHoverBehavior(this._panel,this._element,this.onMouseOver,this.onMouseOut);
	igpnl_addCallBackHandler(this._panel,this._imageElement,"click",this.onButtonClick);
	igpnl_addCallBackHandler(this._panel, this._element, "dblclick", this.onHeaderDoubleClick);

	// A.T. Single click expansion
	if (panel.getExpandOnClick())
	{
		igpnl_addCallBackHandler(this._panel, this._element, "click", this.onHeaderDoubleClick);
	}
}
function igpnl_onSubmit(){
	if(ig_all&&ig_all.length){
		for(var control in ig_all)
		{
			if(control.Type=="WebPanel" && typeof control.updatePostField=="Function")
			{
				control.updatePostField();
			}
		}
	}
}
function igpnl_slide(expand,evt){
	this._event=evt;
	if(this._shrinkProcess)igpnl_endSlide(!expand,this);
	
	this._panel._originalContentAreaHeight = (this._panel._originalContentAreaHeight==null ? this._contentArea.style.height : this._panel._originalContentAreaHeight);
	
	this._panel._originalContentAreaParentHeight = (this._panel._originalContentAreaParentHeight==null ? this._contentArea.offsetParent.style.height : this._panel._originalContentAreaParentHeight);		
	
	if(this._panel._contentHeight==null || (!expand && this._panel._contentHeight!=this._contentArea.offsetHeight))this._panel._contentHeight=this._contentArea.offsetHeight;
	
	this._alphaConstant=100/parseInt(this._panel._contentHeight);
	
	myid=this._panel._id;
	var originalFilterString=this._contentArea.currentStyle?this._contentArea.currentStyle.filter:this._contentArea.style.filter;
	if(expand)
	{
	    /* SJZ 2/27/07 - Should restore the header height, when we're done */
	    if(this._originalHeaderHeight != null)
	        this._panel._header._element.style.height = this._originalHeaderHeight;
		
		if(this._contentArea.filters)
			if(!this._contentArea.filters["alpha"]){
				this._contentArea.style.filter=originalFilterString+" alpha(opacity=1)";
			}else{
				this._contentArea.filters["alpha"].enabled=true;
			}
		this._contentArea.style.height=1;
 		this._opacity=1;
		this._shrinkProcess=setInterval("igpnl_slideDown('"+myid+"')",10);
	}
	else
	{
		this._originalPos = this._contentArea.style.position;
		/* D.M. BR26504 9/20/2007 - Setting the relative position on the DIV rather than the TD here so Firefox will recognize it. */
		this._contentArea.childNodes[0].style.position="relative";
		if(ig_csom.IsIE)
		{
			if(!document.documentElement || document.documentElement.clientHeight == 0 )
			{
			    /* SJZ 2/27/07 - Should restore the header height, when we're done */
			    this._originalHeaderHeight = this._panel._header._element.style.height;
				this._panel._header._element.style.height=this._panel._header._element.offsetHeight;
			}
			
			this._contentArea.firstChild.style.overflowY="hidden";
		}
		else{
			this._contentArea.firstChild.style.overflow="hidden";
		}	
		if(this._contentArea.filters)
			if(!this._contentArea.filters["alpha"]){
				this._contentArea.style.filter=originalFilterString+" alpha(opacity=100)";
			}else{
				this._contentArea.filters["alpha"].enabled=true;
			}
		/*SJZ 3/22/07 - BR21410 - in HTML, when you set the height of contentArea, to be a height, and the height of 
		 * the panel's element isn't set, it causes the offsetheight of the contentarea to be twice it's normal height, 
		 * which can lead to the header growing in size, and the panel's height doubling while it's collapsing.
		 *this._contentArea.style.height=this._panel._contentHeight;*/
		this._panel._element.style.height = this._contentArea.offsetHeight +"px";
		this._contentArea.style.height = this._contentArea.offsetHeight +"px";
		
		/* SJZ 11/21/06 BR16135 - If there is no Height set on the WebPanel, it should resize with its contents.
		 * (i.e. a tree expands past the height of the panel, the panel's height should grow. Normally we set a height
		 * of a 100% on the div inside the contentarea. However, in firefox, with a non XHTML doctype, if the div has
		 * a height set on it, this won't happen. So we remove the height and this fixes that problem. However, when doing
		 * the expandEffects, a height is needed on that div. So during the expansion or collapse of the div, we put the original
		 * height of the div back on (which is always 100%). We then remove it in igpnl_endSlide*/
		if(!ig_shared.IsIE && this._panel._serverHeight=="")
			this._contentArea.childNodes[0].style.height = "100%";
			
 		this._opacity=100;
 		this._shrinkProcess=setInterval("igpnl_slideUp('"+myid+"')",10);
		
	}
}
function igpnl_slideDown(id)
{
	var expandEffect=igpnl_getPanelById(id)._expandEffectGenerator;
	if(expandEffect == null)
		return; 
	var curHeight=parseInt(expandEffect._contentArea.style.height);
	
	var heightToCheck = parseInt(expandEffect._panel._contentHeight);
	if(expandEffect._panel._originalHeight == 0 && heightToCheck != 0)
	{
		if(parseInt(expandEffect._contentArea.childNodes[0].scrollHeight) > heightToCheck)
			heightToCheck = parseInt(expandEffect._contentArea.childNodes[0].scrollHeight);
	}
	else if(expandEffect._panel._originalHeight == 0 && heightToCheck == 0 && parseInt(expandEffect._panel._element.style.height) == 0)
	{	
	    /* D.M. BR27974 11/15/2007 - Need to hide the element here to try to alleviate the flickering
	     * problem that appears in firefox.  This change should not affect IE.   
	     */
	    expandEffect._panel._element.style.visibility = "hidden";
		expandEffect._panel._element.style.height = "";
		heightToCheck = expandEffect._panel._element.offsetHeight;
		expandEffect._panel._element.style.height = "0px";
		expandEffect._panel._element.style.visibility = "visible";
		expandEffect._panel._originalHeight = heightToCheck;
		expandEffect._alphaConstant = 100/parseInt(heightToCheck);
	}
	else
		heightToCheck = expandEffect._panel._originalHeight;
	if((parseInt(heightToCheck)-curHeight)<11){
		igpnl_endSlide(true,expandEffect);
		return;
	}
	expandEffect._contentArea.style.height=(parseInt(expandEffect._contentArea.style.height)+10 +"px");
	expandEffect._panel._element.style.height=(parseInt(expandEffect._panel._element.style.height)+10+"px");
	expandEffect._opacity=expandEffect._opacity+(10*expandEffect._alphaConstant);
	expandEffect._contentArea.style.opacity = expandEffect._opacity/10/10; 
	if(expandEffect._contentArea.filters&&expandEffect._contentArea.filters["alpha"])expandEffect._contentArea.filters["alpha"].opacity=expandEffect._opacity;
}
function igpnl_slideUp(id){
	var expandEffect=igpnl_getPanelById(id)._expandEffectGenerator;
	if(expandEffect == null)
		return; 
	var curHeight=parseInt(expandEffect._contentArea.style.height);
	if(curHeight<11){
		igpnl_endSlide(false,expandEffect);
		return;
	}
	/* SJZ 2/26/07 - When setting the height, we need to set the panel's height before the content area, otherwise
     * in Firefox, we'll see a jumping behavior with the header */
	if(expandEffect._panel._element.offsetHeight > 10)
		expandEffect._panel._element.style.height=(parseInt(expandEffect._panel._element.offsetHeight)-10+"px");
	expandEffect._contentArea.style.height=(parseInt(expandEffect._contentArea.style.height)-10 +"px");
	
	expandEffect._opacity=expandEffect._opacity-(10*expandEffect._alphaConstant);
	expandEffect._contentArea.style.opacity = expandEffect._opacity/10/10; 
	if(expandEffect._contentArea.filters&&expandEffect._contentArea.filters["alpha"])expandEffect._contentArea.filters["alpha"].opacity=expandEffect._opacity;
	
}
function igpnl_endSlide(expanding,expandEffect){
	if(expanding)
	{	    
		/* D.M. BR26504 9/20/2007 - Since the DIV doesn't have an original position we no longer need to reset it. */
		expandEffect._contentArea.childNodes[0].style.position = "";
			
		expandEffect._contentArea.style.opacity = 1; 
		clearInterval(expandEffect._shrinkProcess);
		if(expandEffect._contentArea.filters&&expandEffect._contentArea.filters["alpha"])
		{
			expandEffect._contentArea.filters["alpha"].opacity=100;
			expandEffect._contentArea.filters["alpha"].enabled=false;
		}
		expandEffect._shrinkProcess=null;
		
		if(expandEffect._panel._originalHeight == 0)
			expandEffect._contentArea.style.height = expandEffect._panel._originalContentAreaHeight;
		else
		{
		    /* SJZ 2/27/06 - the panel's contentArea height should always be 100% when done
		     * There is no need to try to remember the height, it shouldn't be restored to a pixel height
		     * expandEffect._panel._originalHeight + "px";*/
			expandEffect._contentArea.style.height= "100%"; 
		}
		expandEffect._panel._element.style.height = expandEffect._panel._originalContentAreaParentHeight;
		
		expandEffect._panel._originalContentAreaHeight = null; 
		expandEffect._panel._originalContentAreaParentHeight  = null;
		if(ig_csom.IsIE)expandEffect._contentArea.firstChild.style.overflowY=expandEffect._originalOverflow;		
		else  expandEffect._contentArea.firstChild.style.overflow=expandEffect._originalOverflow;
		expandEffect._panel.adjustSizes(true);		
		expandEffect._panel.notifyExpandComplete(expandEffect._event);
		/* SJZ 11/20/06 - Added to address bug where if height of panel is not set, it should 
		 * be a resizable panel. Meaning, its content would determine its size. And if the content resizes
		 * so should the WebPanel. So here we do a check to see if the height on the server was "Not Set"*/		
		if(expandEffect._panel._serverHeight == 0)
		{
			expandEffect._contentArea.style.height = "";
			expandEffect._panel._element.style.height = "";
		}
		/* SJZ 11/21/06 BR16135 - If there is no Height set on the WebPanel, it should resize with its contents.
		 * (i.e. a tree expands past the height of the panel, the panel's height should grow. Normally we set a height
		 * of a 100% on the div inside the contentarea. However, in firefox, with a non XHTML doctype, if the div has
		 * a height set on it, this won't happen. So lets remove the height, so that it acts correctly */
		if(!ig_shared.IsIE && expandEffect._panel._serverHeight=="")
			expandEffect._contentArea.childNodes[0].style.height = "";
		return;
	}
	else{		
		clearInterval(expandEffect._shrinkProcess);		
		/* SJZ 2/26/07 - When setting the height, we need to set the panel's height before the content area, otherwise
         * in Firefox, we'll see a jumping behavior with the header */
		expandEffect._panel._element.style.height=expandEffect._closedHeight + "px";
		expandEffect._contentArea.style.height=1+"px";		
		if(expandEffect._contentArea.filters&&expandEffect._contentArea.filters["alpha"])expandEffect._contentArea.filters["alpha"].opacity=0;
		expandEffect._shrinkProcess=null;
		expandEffect._contentArea.style.display="none";
		expandEffect._panel.adjustSizes(false);
		expandEffect._panel.notifyExpandComplete(expandEffect._event);
		return;
	}
}
function igpnl_onExpansionKeyUp(id,evt)
{
    var panel=igpnl_getPanelById(id);
    if(panel){
        var e=(evt)?evt:window.event;
        if(e&&(e.keyCode==13||e.keyCode==32)&&(!e.shiftKey))
            panel.getHeader().onButtonClick(e);
    }
}
function igpnl_ExpandEffectGenerator(panel){
	this._shrinkProcess=0;
	this._contentArea=panel._contentPanelElement;
	this._panel=panel;
	this._opacity=100;
	this._closedHeight=panel._header._element.offsetHeight;
	this._originalOverflow=(ig_csom.IsIE?this._contentArea.firstChild.style.overflowY:this._contentArea.firstChild.overflow);
	 
	if(this._originalOverflow == "")
		this._originalOverflow = "hidden";
	this.expand=igpnl_slide;
}
