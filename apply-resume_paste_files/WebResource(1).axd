//vs 061610
function iged_init(ids,p1,p2,p3,p4,p5)
{
	ids=ids.split("|");
	var id=ids[0];
	var elem=iged_el(ids[1]),ta=iged_el(id+"_t_a"),tb=iged_el(ids[3]);
	if(!ta)return;
	var o=new iged_new(id,ta,tb,p1,p2,p3,p4,p5);
	o._ids=[ids[4]+"_d",ids[4]+"_h"];
	o._elem=elem;
	o._cDoc=function(){return this._elem.contentDocument;}
	o._edit=function(edit)
	{
		if(this._elem.offsetWidth==0){this._zero=edit;return;}
		if(edit||this._zero)try{this._zero=false;this._cDoc().designMode="On";}catch(i){}
	}
	var doc=o._cDoc(),edit=o._prop[12];
	o._edit(edit>0);
	doc.open();
	var s=ta.value;
	doc.write(o._fixStr(s));
	doc.close();
	/* remove <body> tags which were built on server */
	var i=(s.indexOf('%3Cbody')==0)?s.indexOf('%3E'):0,i1=s.lastIndexOf('%3C/body%3E');
	if(i>4&&i1>i)ta.value=s.substring(i+3,i1);
	o.getText=function()
	{
		var body=this._body();
		if(!this._html)return body.innerHTML;
		var html=body.ownerDocument.createRange();
		html.selectNodeContents(body);
		return html.toString();
	}
	o._win=function(){return this._elem.contentWindow;}
	o._doc=function(){return this._win().document;}
	o._sel=function(){return this._win().getSelection();}
	o.print=function(){this._win().print();}
	o._onLink=function()
	{
		var s=prompt(this._cs(15)+"\n"+this._cs(16)+"\n"+this._cs(17), "http://");
		if(s&&s!="")this._format("CreateLink",s,false);
	}
	/*return reference to TD/TH where caret is*/
	o._inTbl=function(){return this._getTag(this._cont(),'TD','TH');}
	o._insBook=function(n)
	{
		var b=this._doc().createElement("A");
		b.setAttribute("name",n);
		iged_insNodeAtSel(b);
	}
	o._insRule=function(align,w,clr,size,noShad)
	{
		var t=this._doc().createElement("HR");
		if(align&&align!="default")t.setAttribute("align",align);
		if(w&&w!="")t.setAttribute("width",w);
		if(clr&&clr!="")t.setAttribute("color",clr);
		if(size&&size!="")t.setAttribute("size",size);
		iged_insNodeAtSel(t);
	}
	o._onApplyStyle=function(e)
	{
		var str=e.id,sel=this._sel();
		var range=sel.getRangeAt(0);
		var txt=iged_stripTags(range.toString());
		var n=document.createElement("SPAN");
		n.innerHTML=txt;
		if(str.indexOf(":")>1)n.setAttribute("style", str);
		else if(str.length>1)n.className=str;
		iged_insNodeAtSel(n);
		this._afterSel(e);
	}
	o._popWin=function(cap,x,img,evt)
	{
		x=this._fixDlgS(x);
		var cont,id=x[0],h=x[14],w=x[15],flag=x[16];
		if(id.length<1)return;
		if(flag=="c")
		{
			if((cont=this._cont())==null)return;
			if((iged_all._curCell=this._inTbl())==null)return;
		}
		if(flag=="t")
		{
			if((cont=this._cont())==null)return;
			if((iged_all._curTable=this._getTag(cont,'TABLE'))==null)return;
		}
		iged_closePop();
		var elem=iged_el(id),pan=this._pan();
		if(!elem||!pan)return;
		this._choiceAct=this._itemStyle=null;
		if(!elem._igf){elem._igf=true;this._fixPop(elem);}
		if(x[1])pan.className=x[1];
		var s=pan.style;
		if(x[2])s.backgroundColor=x[2];if(x[3])s.borderColor=x[3];
		if(x[4])s.borderStyle=x[4];if(x[5])s.borderWidth=x[5];
		if(x[6])s.fontFamily=x[6];if(x[7])s.fontSize=x[7];if(x[8])s.color=x[8];
		if(h)s.height=h;if(w)s.width=w;
		var tbl=document.createElement("TABLE");
		tbl.cellSpacing=0;
		tbl.insertRow(0);tbl.insertRow(0);
		if(w)tbl.style.width=w;
		var r0=tbl.rows[0];
		r0.insertCell(0);tbl.rows[1].insertCell(0);
		var c0=r0.cells[0];var s0=c0.style;
		s0.width="100%";s0.cursor="pointer";
		c0.id="titleBar";
		if(x[10])s0.backgroundColor=x[10];
		var txt="<table border='0' cellpadding='1' cellspacing='0' width='100%'><tr><td id='titleBar' width='100%'>";
		if(img!="")txt+="<img id='titleBar' align='absmiddle' src='"+img+"'></img>";
		txt+="&nbsp;<b id='titleBar' style='";
		if(x[11])txt+="font-family:"+x[11]+";";
		if(x[12])txt+="font-size:"+x[12]+";";
		if(x[13])txt+="color:"+x[13]+";";
		txt+="'>"+cap+"</b></td><td>";
		if(x[9])txt+="<img onclick='iged_closePop(3)' align='absmiddle' src='"+x[9]+"'></img>";
		txt+="</td></tr></table>";
		c0.innerHTML=txt;
		tbl.rows[1].cells[0].innerHTML=elem.innerHTML;
		pan.innerHTML=iged_getOuterHtml(tbl);
		iged_all._pop=pan;
		iged_all._popID=this.ID;
		this._pos(evt,pan);
		this._delay();
		if(flag=="c")iged_loadCell();
		if(flag=="t")iged_loadTable();
		if(!pan._mde){this._addLsnr(pan,"mousedown",iged_dragEvt);pan._mde=true;}
	}
	o._showHtml=function(html)
	{
		var o=this,e=this._elem;
		if(e._html!=null)o._html=e._html;
		if(html!==true&&html!==false)html=o._html!=true;
		if(html==(o._html==true))return;
		e._html=html;
		var i,tb=o._tb,body=o._doc().body;
		o._swapS(iged_el(o._ids[html?0:1]),iged_el(o._ids[html?1:0]));
		if(html)
		{
			if(tb)
			{
				var elems=tb.getElementsByTagName("img");
				for(i=0;i<elems.length;i++)elems[i].style.visibility="hidden";
				elems=tb.getElementsByTagName("table");
				for(i=0;i<elems.length;i++)elems[i].style.visibility="hidden";
			}
			o._html=true;
			var html=document.createTextNode(o._amp(body.innerHTML));
			body.innerHTML="";
			body.appendChild(html); 
			o.focus();
			return;
		}
		if(tb)
		{
			var elems=tb.getElementsByTagName("img");
			for(i=0;i<elems.length;i++)elems[i].style.visibility="visible";
			elems=tb.getElementsByTagName("table");
			for(i=0;i<elems.length;i++)elems[i].style.visibility="visible";
		}
		o._html=false;
		var html=body.ownerDocument.createRange();
		html.selectNodeContents(body);
		body.innerHTML=html.toString(); 
		o.focus();
	}
	o._cont=function(){var s=this._sel();if(s)s=s.getRangeAt(0);return s?s.startContainer:null;}
	o._getSelElem=function()
	{
		var cont=this._cont();
		return (cont.nodeType==1)?cont:null;
	}
	o._insTbl=function()
	{
		var iRows=iged_el("iged_tp_rr").value,iCols=iged_el("iged_tp_cc").value;
		var align=iged_el("iged_tp_al").value,cellPd=iged_el("iged_tp_cp").value;
		var cellSp=iged_el("iged_tp_cs").value,bdSize=iged_el("iged_tp_bds").value;
		var clrBg=iged_el("iged_tp_bk1").value,clrBd=iged_el("iged_tp_bd1").value,w=iged_el("iged_tp_w").value;
		var t,t0=iged_all._curTable;
		if(t0)t=t0;
		else
		{
			t=this._doc().createElement("TABLE");
			var i,tbody=this._doc().createElement("TBODY");
			t.appendChild(tbody);
			for(i=0;i<iRows;i++)
			{
				var r2=this._doc().createElement("TR");
				for(j=0;j<iCols;j++)
				{
					var c2=this._doc().createElement("TD");
					var br=this._doc().createElement("BR");
					c2.appendChild(br);
					r2.appendChild(c2);
				}
				tbody.appendChild(r2);
			}
		}
		if(align!="default")t.setAttribute("align",align);
		t.setAttribute("border",bdSize);
		t.setAttribute("cellpadding",cellPd);
		t.setAttribute("cellspacing",cellSp);
		t.setAttribute("bgcolor",clrBg);
		t.setAttribute("bordercolor",clrBd);
		t.setAttribute("width",w);
		iged_all._curTable=null;
		iged_closePop();
		iged_insNodeAtSel(t);
	}
	o._delCol=function()
	{
		var cont=this._cont();
		var i,c=this._inTbl(),t=this._getTag(cont,'TABLE');
		if(t&&c)for(i=0;i<t.rows.length;i++)t.rows[i].deleteCell(c.cellIndex);
		iged_closePop();
	}
	o._delRow=function()
	{
		var cont=this._cont();
		var r=this._getTag(cont,'TR'),t=this._getTag(cont,'TABLE');
		if(t&&r)t.deleteRow(r.rowIndex);
		iged_closePop();
	}
	o._insRow=function(act)
	{
		var cont=this._cont();
		var r=this._getTag(cont,'TR'),t=this._getTag(cont,'TABLE');
		iged_closePop();
		if(!t||!r)return;
		var i,r2=t.insertRow(r.rowIndex+((act=="below")?1:0));
		for(i=0;i<r.cells.length;i++)
		{
			var c2=r2.insertCell(i);
			if(c2)c2.appendChild(this._doc().createElement("BR"));
		}
	}
	o._insCol=function(act)
	{
		var cont=this._cont();
		var c=this._inTbl(),t=this._getTag(cont,'TABLE');
		iged_closePop();
		if(!t||!c)return;
		var i,ii=c.cellIndex+((act=="right")?1:0);
		for(i=0;i<t.rows.length;i++)
		{
			var c2=t.rows[i].insertCell(ii);
			if(c2)c2.appendChild(this._doc().createElement("BR"));
		}
	}
	o._colSpan=function(act)
	{
		var cont=this._cont();
		var c=this._inTbl(),t=this._getTag(cont,'TABLE'),r=this._getTag(cont,'TR');
		iged_closePop();
		if(!c||!r)return;
		if(act=="increase")
		{
			if(r.cells[c.cellIndex+1])
			{
				c.colSpan+=1;
				r.deleteCell(c.cellIndex+1);
			}
		}
		else if(c.colSpan>1) 
		{
			c.colSpan-=1;
			var c2=r.insertCell(c.cellIndex);
			if(c2)c2.appendChild(this._doc().createElement("BR"));
		}
	}
	o._rowSpan=function(act)
	{
		var r2=null,cont=this._cont();
		var c=this._inTbl(),t=this._getTag(cont,'TABLE'),r=this._getTag(cont,'TR');
		iged_closePop();
		if(!c||!r)return;
		if(t.rows.length>r.rowIndex)r2=t.rows[r.rowIndex+c.rowSpan];
		if(act=="increase")
		{
			if(!r2)return;
			c.rowSpan+=1;
			r2.deleteCell(c.cellIndex);
		}
		else
		{
			if(c.rowSpan==1)return;
			c.rowSpan-=1;
			r2=t.rows[r.rowIndex+c.rowSpan];
			var c2=r2.insertCell(c.cellIndex);
			if(c2)c2.appendChild(this._doc().createElement("BR"));
		}
	}
	o.insertAtCaret=function(o)
	{
		if(!o)return;
		if(typeof o=='string')iged_insText(o,null,null,null,this);
		else iged_insNodeAtSel(o,this);
	}
	var d=o._doc();
	if(!elem._oldE)
	{
		elem._oldE=true;
		o._addLsnr(iged_el(id),"mousedown",iged_mainEvt);
		if(edit>0)
		{
		var saf='';
		try{saf=navigator.userAgent.toLowerCase();}catch(ex){}
		o._saf=saf&&(saf.indexOf('webkit')>0||saf.indexOf('safari')>0||saf.indexOf('chrome')>0);
		/* safari and chrome fail to process focus/blur for document: use window */
		saf=o._saf?o._win():d;
		o._ed0=true;
		o._addLsnr(d,"mousedown",iged_mainEvt);
		o._addLsnr(saf,"focus",iged_mainEvt);
		o._addLsnr(saf,"blur",iged_mainEvt);
		o._addLsnr(d,"keydown",iged_mainEvt);
		o._addLsnr(d,"keypress",iged_mainEvt);
		o._addMenu();
		}
	}
	d.id="ig_d_"+id;
	if(o._prop[10]==1)o._showHtml(true);
	else if((edit&4)!=0)o.focus();
	o._fire(0);
}
function iged_insNodeAtSel(insertNode,o)
{
	iged_closePop(o?null:3);
	if(!o)o=iged_all._cur;
	var sel=o._sel();
	var range=sel.getRangeAt(0);
	sel.removeAllRanges();
	try{range.deleteContents();}catch(e){}/*Bug 11655*/
	var afterNode,cont=range.startContainer,pos=range.startOffset;
	range=document.createRange();
	try/*Bug 11655*/
	{
		if(cont.nodeType==3&&insertNode.nodeType==3)
		{
			cont.insertData(pos,insertNode.nodeValue);
			range.setEnd(cont,pos+insertNode.length);
			range.setStart(cont,pos+insertNode.length);
		}
		else
		{
			if(cont.nodeType==3)
			{
				var textNode=cont;
				cont=textNode.parentNode;
				var text=textNode.nodeValue;
				var textBefore=text.substr(0,pos),textAfter=text.substr(pos);
				var beforeNode=document.createTextNode(textBefore);
				var afterNode=document.createTextNode(textAfter);
				cont.insertBefore(afterNode,textNode);
				cont.insertBefore(insertNode,afterNode);
				cont.insertBefore(beforeNode,insertNode);
				cont.removeChild(textNode);
			}
			else
			{
				afterNode=cont.childNodes[pos];
				cont.insertBefore(insertNode,afterNode);
			}
			if(afterNode)
			{
				range.setEnd(afterNode,0);
				range.setStart(afterNode,0);
			}
		}
	}catch(e){}
	sel.addRange(range);
	o._mod=true;
}
function iged_insText(txt,strip,a2,a3,a4)
{
	iged_closePop(a4?null:"InsertText");
	if(strip)txt=iged_stripTags(txt);
	var o=a4?a4:iged_all._cur;
	if(o)if(o=o._cDoc())iged_insNodeAtSel(o.createTextNode(txt));
}
function iged_doImgUpdate(img)
{
   var sel=iged_all._cur._sel();
   var range=sel.getRangeAt(0);
   range.extractContents();
   if(img&&img!="")iged_insNodeAtSel(img);
   iged_all._curImg=null;
}
function iged_modal(url,h,w,evt)
{
	url=iged_replaceS(url,"&amp;","&");
	var str="";
	if(h)str+="Height="+h+",";
	if(w)str+="Width="+w+",";
	str+="scrollbars=no";
	url+=((url.indexOf("?")>-1)?"&num=":"?num=")+Math.round(Math.random()*100000000);
	url+="&parentId="+iged_all._cur._elem.id;
	return window.open(url,window,str);
}
function iged_getOuterHtml(n) 
{
	var i,html="";
	if(n.nodeType==Node.ELEMENT_NODE)
	{
		html+="<";
		html+= n.nodeName;
		if(n.nodeName!="TEXTAREA") 
		{
			for(i=0;i<n.attributes.length;i++)
				html+=" "+n.attributes[i].nodeName.toUpperCase()+"=\""+n.attributes[i].nodeValue+"\">";
			var s=n.nodeName;
			if(s!="HR"&&s!="BR"&&s!="IMG"&&s!="INPUT")
				html+=n.innerHTML+"<\/"+s+">";
		}
		else
		{
			var txt="";
			for(i=0;i<n.attributes.length;i++)
			{
				if(n.attributes[i].nodeName.toLowerCase()!="value")
					html+=" "+n.attributes[i].nodeName.toUpperCase()+"=\""+ n.attributes[i].nodeValue+"\"";
				else txt=n.attributes[i].nodeValue;
			}
			html+=">"+txt+"<\/"+n.nodeName+">";
		}
	}
	else if(n.nodeType==Node.TEXT_NODE)html+=n.nodeValue;
	else if(n.nodeType==Node.COMMENT_NODE)html+="<!--"+n.nodeValue+"-->";
	return html;
}
