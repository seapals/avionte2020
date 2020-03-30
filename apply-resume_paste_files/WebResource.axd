//vs 071210
if(typeof iged_all!="object")
	var iged_all=new Object();
function iged_getById(id)
{
	if(!id)return null;
	var o=iged_all[id];
	if(o!=null)return o;
	for(var i in iged_all)if((o=iged_all[i])!=null)if(o.ID==id||o._elem==id)return o;
	return null;
}
function iged_new(id,ta,tb,p1,p2,p3,p4,p5)
{
	if(iged_all[id])iged_closePop();
	this.ID=id;
	this._ta=ta;
	this._tb=tb;
	/*get around focus-features of IE7 (no blur if focus goes to address-bar)*/
	/*try to catch first blur, and only after that suspend "focus()" while control has focus*/
	/*this._foc=-1:never blur, 0:blur, 1:focus before blur, 2:focus after blur*/
	this._foc=-1;
	this._elem0=iged_el(id);
	this._addLsnr=function(e,n,f)
	{
		try{if(e&&e.addEventListener){e.addEventListener(n,f,false);return 1;}}catch(i){}
		try{if(e&&e.attachEvent){e.attachEvent("on"+n,f);return 1;}}catch(i){}
		try
		{
		eval("var old=e.on"+n);
		var sF=f.toString();var i=sF.indexOf("(")+1;
		if((typeof old=="function")&&i>10)
		{
			old=old.toString();
			var args=old.substring(old.indexOf("(")+1,old.indexOf(")"));
			while(args.indexOf(" ")>0)args=args.replace(" ","");
			if(args.length>0)args=args.split(",");
			old=old.substring(old.indexOf("{")+1,old.lastIndexOf("}"));
			sF=sF.substring(9,i);
			if(old.indexOf(sF)>=0)return;
			var s="f=new Function(";
			for(i=0;i<args.length;i++){if(i>0)sF+=",";s+="\""+args[i]+"\",";sF+=args[i];}
			sF+=");"+old;
			eval(s+"sF)");
		}
		eval("e.on"+n+"=f");
		return 1;
		}catch(i){}
		return 0;
	}
	this._alert=function(s){iged_closePop();window.alert(s?s:this._cs(11));}
	/* 0-init,1-before,2-after,3-keydown,4-keypress,5-focus,6-blur,7-preview,8-fontStyle,9-?,10-htmlMode,11-palette,12-edit+P,13-rightMenu */
	this._prop=p1.split("|");
	for(var i=9;i<this._prop.length;i++)this._prop[i]=parseInt(this._prop[i]);
	this._butS=p2.split("|");/* button styles */
	this._ddImgClr=p3.split("|");/* drop-down images/colors */
	this._dlgS=p4.split("|");/* dialog styles */
	this._exp=p5;/* expand effects */
	if(!iged_all._clrNum)iged_all._clrNum=this._prop[11];
	this._fixDlgS=function(x)
	{
		x=x.split("|");
		var i=0,s=this._dlgS,d=x[1]!="";
		if(d&&s[0]!="")x[1]=s[0]+" "+x[1];
		while(++i<14){if(x[i]==""&&(!d||i>8))x[i]=s[i-1];if(x[i]=="")x[i]=null;}
		return x;
	}
	/* not used by this */
	this._addMenu=function()
	{
		if(this._prop[13]==0||iged_all._onMenu)return;
		iged_all._onMenu=true;
		this._addLsnr(this._doc(),"contextmenu",iged_mainEvt);
	}
	this._fire=function(id,act,p1,p2,p3,p4,p5,p6)
	{
		var p,e=this._evt;
		id=this._prop[id];
		if(e==null)e=this._evt=new Object();
		e.p4=e.p5=e.p6=e.p7=e.p8=e.key=e.act=null;
		e.cancelPostBack=e.needPostBack=e.cancel=false;
		if(id&&id.length>0)
		{
			p=id=iged_replaceS(iged_replaceS(id,'&quot;','"'),'&pipe;','|');
			if(p.indexOf('=')<0&&p.indexOf(';')<0&&p.indexOf(',')<0&&p.indexOf('(')<0&&p.indexOf('{')<0&&p.indexOf('[')<0&&p.indexOf('"')<0&&p.indexOf("'")<0&&p.indexOf(':')<0)
				p+="(this,act,e,p1,p2,p3,p4,p5,p6)";
			try{eval(p);}catch(i){window.status="Can't eval "+id;}
		}
		p=e.needPostBack?true:(this._post&&!e.cancelPostBack&&!e.cancel);
		this._post=false;
		if(p)if((p=this._ta.form)!=null)
		{
			iged_update();
			this._ta.value+="\03"+act+"\04";
			this._posted=true;
			if(typeof __doPostBack=="function")__doPostBack(this.ID,"");/* fix for UpdatePanel of Atlas */
			else p.submit();
			return true;
		}
		return e.cancel==true;
	}
	this._swapS=function(s1,s2)
	{
		if(s1)s1=s1.style;if(s2)s2=s2.style;
		if(!s1||!s2)return;
		var bk=s1.backgroundColor,bc=s1.borderColor,c=s1.color,bs=s1.borderStyle;
		s1.backgroundColor=s2.backgroundColor;s1.borderColor=s2.borderColor;s1.color=s2.color;s1.borderStyle=s2.borderStyle;
		s2.backgroundColor=bk;s2.borderColor=bc;s2.color=c;s2.borderStyle=bs;
	}
	this._format=function(act,mod,restore,foc)
	{
		iged_closePop(act);
		this.focus();
		iged_all._noUndo=false;
		var e=this._elem,f=this._ie!=null;
		try{
		if(f)
		{
			if(foc)e.setActive();
			if(restore&&iged_all._curRange)
				iged_all._curRange.select();
			e=e.document;
		}
		else
		{	
			if(foc)e.contentWindow.focus();
			e=e.contentDocument;
		}
		e.execCommand(act,f,(!mod||mod=="")?null:mod);
		}catch(e){}
	}
	/*_foc:-1:never blur, 0:blur, 1:focus before blur, 2:focus after blur*/
	this.hasFocus=function(){return this._foc>0&&this._focs;}
	/*-1:never blur, 0:blur, 1:focus before blur, 2:focus after blur*/
	this.focus=function(f){if(this._foc<2||f)try{if(this._ie)this._elem.focus();else this._win().focus();}catch(i){}}
	this.setText=function(txt,ie)
	{
		var o=this,e=this._elem;
		if(o._ie)
		{
			if(o._html)e.innerText=o._decode(txt);
			else o._txt(txt);
		}
		else
		{
			e=o._doc().body;
			if(!o._html)e.innerHTML=txt;
			else
			{
				e.innerHTML="";
				e.appendChild(document.createTextNode(txt));
			}
		}
		o._mod=true;
		if(ie!=1)this._update();
	}
	this._onSelFont=function(e,act)
	{
		this._format(act,e.id,this._ie&&iged_all._curRange&&iged_all._curRange.boundingWidth!=0,true);
		this._syncBullets();
		this._afterSel(e);
	}
	this._afterSel=function(e)
	{
		iged_closePop(3);
		if(!this._ie)return;
		var elem=iged_el(e.name),t=e.innerText;
		if(elem&&t&&t!="")elem.firstChild.firstChild.firstChild.innerText=t;
	}
	this._onSubSup=function(s1,s2)
	{
		try
		{
			if(this._ie)
			{if(iged_all._curRange.queryCommandState(s2))this._format(s2,"",false,true);}
			else{if(this._elem.contentDocument.queryCommandState(s2))this._format(s2,"",false,true);}
			this._format(s1,"",false,true);
		}catch(s1){}
	}
	this._onToggleBdr=function()
	{
		var t=null,i=-1,toggle=this._toggle;
		try
		{
			if(this._ie)t=this._getCurTable();
			else if(this._inTbl())t=this._getTag(this._cont(),'TABLE');
		}catch(e){}
		if(t){this._tblBdr(t,t.border==0);return;}
		t=this._ie?this._elem:this._doc();
		t=t.getElementsByTagName('TABLE');
		while(++i<t.length)
		{
			if(i==0)
			{
				if(toggle==null)toggle=t[i].border!=0;
				this._toggle=toggle=!toggle;
			}
			this._tblBdr(t[i],toggle);
		}
	}
	this._tblBdr=function(t,b)
	{
		var old=t._oldB;
		if(!old){old=t.border;if(old==0)old=1;t._oldB=old;}
		t.border=b?old:0;
	}
	this._onClr=function(clr)
	{
		iged_closePop("clr");
		if(!clr)clr="";
		var f=this._clrTarget;
		if(f)
		{
			try
			{
				f.value=clr;
				f.style.backgroundColor=(clr=="")?"#F0F0F0":clr;
			}catch(f){}
			return;
		}
		f=this._popF==1;
		if(this._ie)this._format(f?"forecolor":"backcolor",clr,true,true);
		else this._format(f?"forecolor":"hilitecolor",clr,false,true);
		if(f)this._syncBullets();
	}
	this._fixPop=function(e,rc,skip)
	{
		if(!e||!e.getAttribute||(e._oldP&&!rc))return;
		e._oldP=true;
		var a=e.getAttribute("act");
		if(a&&a.length>0)this._choiceAct=a;
		a=e.getAttribute("sts");
		if(a&&a.length>0)this._itemStyle=a.split("?");
		a=e.getAttribute("igf");
		if(a&&a.length==1)
		{
			var f=this._itemStyle,s=e.style;
			if(a=="m"&&rc)
			{
				/*if menu appears within bounds of IMG, then IE hides onclick, so, onmouseup should be used*/
				var cl=e.onmouseup,d="none";if(!cl)return;cl=iged_replaceS(cl.toString(),"\"","'");
				if(rc==3){if(cl.indexOf("Image'")>0)d="";}
				else if(rc==2){if(cl.indexOf("Image'")<0)d="";}
				else if(cl.indexOf("'Table")<1&&cl.indexOf("'Cell")<1&&cl.indexOf("Image'")<1)d="";
				s.display=d;
			}
			if(a=="c"||a=="m"||a=="l")
			{
				if(skip)return;
				s.cursor=(a=="m")?"pointer":"default";
				this._addLsnr(e,"mouseover",iged_choiceEvt);
				this._addLsnr(e,"mouseout",iged_choiceEvt);
				e._b=e._b2=s.backgroundColor;
				e._f=e._f2=s.color;
				if(a=="m"){if(f)e._b2=f[0];}
				else
				{
					e._b2=this._ddImgClr[3];e._f2=this._ddImgClr[4];
					this._addLsnr(e,"click",iged_choiceEvt);
					if(a=="l")
					{
						s.fontWeight="bold";
						s.fontFamily="verdana,tahoma";
						s.fontSize="12px";
						return;
					}
					e._act=this._choiceAct;
					e.noWrap=true;
					if((!s.fontFamily||s.fontFamily=="")&&f&&f[0]!="")s.fontFamily=f[0];
					if((!s.fontSize||s.fontSize=="")&&f&&f[1]!="")s.fontSize=f[1];
				}
			}
			else try{eval(this._prop[8]);}catch(a){}
			return;
		}
		e=e.childNodes;
		if(e)for(var i=0;i<e.length;i++)this._fixPop(e[i],rc,skip);
	}
	this._fixMouse=function(e,p)
	{
		if(!e||!e.getAttribute||(e._old&&p))return;
		var i=e.tagName,a=(p==1)?e.getAttribute("mm"):null;
		if(!i||i=="INPUT"||i=="SELECT")return;
		e.unselectable="on";
		e._old=true;
		if(!a||a.length<1)
		{
			e=e.childNodes;i=-1;
			if(e)while(++i<e.length)this._fixMouse(e[i],p);
			return;
		}
		var dd=a=="t";
		if(dd)e.mm="x";
		else
		{
			var m=a.split("|"),s=e.style,b=this._butS;
			if((i=b.length)>m.length){a=null;m=new Array();}
			while(i-->0)if(!a||m[i].length<2)
			{
				m[i]=b[i];
				if(i==0)s.backgroundColor=b[i];
				if(i==1)s.borderColor=b[i];
				if(i==2)s.borderStyle=b[i];
			}
			this._addLsnr(e,"mouseup",iged_mEvt);
			e.mm=m;
		}
		a=e.getAttribute("im2");
		if(a&&a.length>5)e.imgs=a.split("|");
		if(dd)for(i=1;i<4;i++)if(e.imgs[i]=="")e.imgs[i]=this._ddImgClr[i-1];
		this._addLsnr(e,"mouseover",iged_mEvt);
		this._addLsnr(e,"mouseout",iged_mEvt);
		this._addLsnr(e,"mousedown",iged_mEvt);
		this._fixMouse(e);
	}
	this._clrDrop=function(e,doc)
	{
		if(!e)return;
		this._clrTarget=e;
		this._pos(e,this._clrInit0(iged_all._doc0=doc),8);
	}
	this._wait=function(e)
	{
		var pan=this._pan('_');
		if(!pan)return;
		var s=pan.style;s.height="15px";s.width="200px";s.border="";
		pan.innerHTML="<div style='padding:7px;font-family:verdana;font-size:10pt;font-weight:bold;color:#005000;background:#E0FFF0;border:1px solid #005080'>"+this._cs(14)+"</div>";
		/* no _fire */
		iged_all._popID=null;
		this._pos(e,iged_all._pop=pan);
	}
	this._delay=function(){iged_all._canCloseCur=false;window.setTimeout("iged_all._canCloseCur=true",100);}
	this._pop=function(id,x,evt,flag,h,rc)
	{
		if(this._isKnown(id)&&this._sel())iged_all._curRange=this._sel().createRange();
		iged_closePop();
		var pan;
		this._clrTarget=null;
		if(id=="iged_0_clr"){pan=this._clrInit0();this._popF=x;x=null;}
		else pan=iged_el(id);
		if(!pan)return;
		this._choiceAct=this._itemStyle=null;
		if(!pan._igf||flag==3){this._fixPop(pan,rc,pan._igf);pan._igf=true;}
		var s=pan.style;
		if(x)
		{
			x=x.split("?");
			if(h!=null)x[7]=h;
			if(x[0])s.backgroundColor=x[0];if(x[1])s.borderColor=x[1];
			if(x[2])s.borderStyle=x[2];if(x[3])s.borderWidth=x[3];
			if(x[4])s.fontFamily=x[4];if(x[5])s.fontSize=x[5];if(x[6])s.color=x[6];
			if(x[7])s.height=x[7];if(x[8]){s.width=x[8];s.paddingLeft="2px";}
		}
		this._fixMouse(pan,2);
		this._pos(evt,pan,flag);
		iged_all._pop=pan;
		iged_all._popID=this.ID;
		this._doValid(this.ID);
		this._delay();
	}
	this._doValid=function(id)/*used to close pop-up if container of editor goes invisible*/
	{
		if(iged_all._popValid){window.clearInterval(iged_all._popValid);delete iged_all._popValid;}
		if(id)iged_all._popValid=window.setInterval('iged_valid("'+id+'")',300);
	}
	this._valid=function()
	{
		var e=this._elem0;if(!e)e=this._elem;
		if(e&&e.offsetHeight==0){iged_closePop();return false;}
		return true;
	}
	this._isKnown=function(id)
	{
		var i=id.length;
		return this._ie&&(id.indexOf("iged_0_")==0||id.indexOf("_iged_dlg")==i-9);
	}
	this._body=function(){return this._doc().body;}
	this._pan=function(id)
	{
		var e=iged_el(id='iged_0_div'+(id?id:''));
		if(!e)try
		{
			e=document.createElement("DIV");
			e.style.display='none';
			this._elem.parentNode.appendChild(e);
			e.id=id;
		}catch(i){}
		return e;
	}
	this._getSelImg=function()
	{
		if(!this._ie)return iged_all._curImg;
		if(this._sel().type!="Control")return null;
		iged_all._curRange=this._range();
		if(iged_all._curRange.item(0).tagName=="IMG")return iged_all._curRange.item(0);
		return null;
	}
	this._fixListFormat=function()
	{
		if(this._ie)iged_all._curRange=this._range();
	}
	this._cssFont=function(f)
	{
		try
		{
			if(f.length==1)f=parseInt(f,10);
			if(f==1)return "xx-small";if(f==2)return "x-small";if(f==3)return "small";
			if(f==4)return "medium";if(f==5)return "large";if(f==6)return "x-large";if(f>6)return "xx-large";
		}catch(i){return "";}
		return f;
	}
	this._syncBullets=function()
	{
		var lis=document.getElementsByTagName("li");
		for(var i=0;i<lis.length;i++)
		{
			var li=lis[i];
			if(li.children.length>0)
			{
				if(li.children[0].tagName.toLowerCase()=="font")
				{
					var e=li.children[0];
					if(e.size!="")li.style.fontSize=this._cssFont(e.size);
					li.style.fontFamily=e.face;
					li.style.color=e.color;
				}
			}
		}
		iged_all._needSync=false;
	}
	this._setOl=function()
	{
		var sel;
		if(this._ie)
		{
			iged_all._curRange=this._range();
			try{sel=iged_all._curRange.parentElement();}catch(sel){return;}
		}
		else sel=this._cont();
		var ol=this._getTag(sel,'OL');
		if(!ol)return;
		var i=iged_nestCount(ol,"OL")%3;
		if(i==0)ol.type="i";
		if(i==1)ol.type="1";
		if(i==2)ol.type="a";
	}
	this._cleanWord=function(txt)
	{
		txt=txt.replace(/<(\/)?strong>/ig,"<$1B>");
		txt=txt.replace(/<(\/)?em>/ig,"<$1I>").replace(/<P class=[^>]*>/gi, "<P>").replace(/<LI class=[^>]*>/gi, "<LI>");
		txt=txt.replace(/<\\?\??xml[^>]>/gi,"").replace(/<\/?\w+:[^>]*>/gi,"").replace(/<SPAN[^>]*>/gi," ");
		txt=txt.replace(/<\/SPAN>/gi,"").replace(/\r\n/g,"").replace(/\n/g,"").replace(/\r/g,"");
		txt=txt.replace(/<P/gi,"\n<P").replace(/<H/gi,"\n<H").replace(/<\/H/gi,"<\/H");
		txt=txt.replace(/<P>\n/gi,"").replace(/<T/gi,"\n<T").replace(/<TD>\n/gi,"<TD>");
		txt=txt.replace(/<\/TR>/gi,"\n<\/TR>").replace(/<\/TR>\n/gi,"<\/TR>").replace(/<UL/gi,"\n<UL");
		txt=txt.replace(/<\/UL>/gi,"\n<\/UL>").replace(/<OL/gi,"\n<OL").replace(/<\/OL>/gi,"\n<\/OL>");
		txt=txt.replace(/<LI/gi,"\n<LI").replace(/<DL/gi,"\n<DL").replace(/<\/DL>/gi,"<\/DL>\n").replace(/<DD/gi,"\n<DD");
		/* Replace smart quotes. */
		txt=escape(txt);
		txt=iged_replaceS(txt,"%u2019","'");txt=iged_replaceS(txt,"%u201C","\"");txt=iged_replaceS(txt,"%u201D","\"");
		txt=iged_replaceS(txt,"%u2022","");txt=iged_replaceS(txt,"%u2026","...");
		return unescape(txt);
	} 
	this._toClr=function(c)
	{
		var a=Math.floor(c);
		c-=a;if(a>=15)c=a=15;
		if(c>0.8)c="F";else if(c>0.6)c="A";else if(c>0.3)c=5;else c=0;
		return ((a<10)?a:String.fromCharCode(55+a))+""+c;
	}
	this._clrInit=function()
	{
		var cols=iged_all._clrNum;
		if(!cols)cols=11;
		for(var i=0;i<cols;i++)for(var j=0;j<13;j++)
		{
			var e=iged_el("iged_clr_"+i+"_"+j);
			if(!e)continue;
			e.clr=e.style.backgroundColor=e.style.borderColor=iged_all._cur._clrGet(i,j,cols);
		}
	}
	this._clrGet=function(i,j,x)
	{
		var r,g,b,v=iged_all._clrRGB;
		if(v==null)v=iged_all._clrRGB=0;
		if(j--==0)r=g=b=(i==0)?0:(1+i*14.5/(x-1));
		else
		{
			var m=Math.floor(j/4),c=(x-1)/2;
			var z=[(i<=c)?0:15*(i-c+3)/(c+3),15-(j%4)*3,(i>c)?9:15*(c-i)/c];
			g=z[m%3];r=z[(m+1)%3];b=z[(m+2)%3];
		}
		if(v>0){r+=(15-r)*v;g+=(15-g)*v;b+=(15-b)*v;}
		if(v<0){v=-v;r/=v;g/=v;b/=v;}
		return "#"+this._toClr(r)+this._toClr(g)+this._toClr(b);
	}
	this._newE=function(doc,t,p){p.appendChild(t=doc.createElement(t));return t;}
	this._clrInit0=function(doc)
	{
		var o=doc,clr=doc?doc.getElementById("iged_clr0_id"):iged_all._clr;
		if(clr)
		{
			try{iged_el("iged_c_c0").style.backgroundColor="";iged_el("iged_c_c1").value="";}catch(o){}
			return clr;
		}
		if(!doc)doc=window.document;
		clr=doc.createElement("DIV");
		if(!o)iged_all._clr=clr;
		doc.body.insertBefore(clr,doc.body.firstChild);
		clr.id="iged_clr0_id";
		var s=clr.style;o=iged_all._cur;
		s.position="absolute";s.display="none";s.zIndex=100001;
		var sp,t0=doc.createElement("TABLE");
		clr.appendChild(t0);
		s=t0.style;s.backgroundColor="#E0E0E0";s.border="solid 1px #808080";
		t0.border=0;t0.cellSpacing=3;
		var tb0=doc.createElement("TBODY");
		t0.appendChild(tb0);
		var r=doc.createElement("TR");
		tb0.appendChild(r);
		var c0=o._newE(doc,"TD",r);
		c0.noWrap=true;c0.align="center";
		for(var i=0;i<9;i++)
		{
			sp=o._newE(doc,"SPAN",c0);
			var c=(i==4)?"&nbsp;0":((i<4)?("-"+(4-i)):("+"+(i-4)));
			sp.innerHTML=""+c;
			s=sp.style;
			s.border="solid 1px #90C0C0";s.cursor="pointer";s.fontSize="11px";s.fontFamily="courier new";
			r=4;
			if(i==4)iged_all._clrSelBut=sp;
			else r=(i<4)?5:6;
			sp.title=this._cs(r);
			s.color=(i==4)?"red":"black";s.margin="1px";
			c=6+i*1.2;
			s.backgroundColor="#"+o._toClr(c)+o._toClr(c)+o._toClr(c);
			sp.id="iged_c_b"+i;
			sp.setAttribute("c","b"+i);
			o._addLsnr(sp,"mouseout",iged_clrEvt);
			o._addLsnr(sp,"mouseover",iged_clrEvt);
			o._addLsnr(sp,"click",iged_clrEvt);
		}
		r=doc.createElement("TR");
		tb0.appendChild(r);
		var c1=o._newE(doc,"TD",r);
		c1.style.border="solid blue 1px";
		r=doc.createElement("TR");
		tb0.appendChild(r);
		var c2=o._newE(doc,"TD",r);
		c2.noWrap=true;c2.align="center";
		sp=o._newE(doc,"SPAN",c2);
		s=sp.style;
		s.border="solid 1px black";s.fontSize="16px";s.fontFamily="courier new";s.cursor="default";
		sp.title=this._cs(2);
		sp.innerHTML="&nbsp;&nbsp;";
		sp.id="iged_c_c0";
		sp=o._newE(doc,"SPAN",c2);
		sp.innerHTML="&nbsp;";
		var f=doc.createElement("INPUT");
		f.title=this._cs(3);
		c2.appendChild(f);
		o._addLsnr(f,"keydown",iged_clrEvt);
		o._addLsnr(f,"keyup",iged_clrEvt);
		s=f.style;s.fontSize="12px";s.width="130px";
		f.id="iged_c_c1";
		var t=doc.createElement("TABLE");
		c1.appendChild(t);
		t.cellSpacing=1;
		var i,j,tb=doc.createElement("TBODY"),tt=this._cs(1);
		t.appendChild(tb);
		var cols=iged_all._clrNum,w=r=12;
		if(!cols)cols=11;
		if(cols<11)w=19;else if(cols>11)r=w=10;
		w=r+'px '+w+'px 0px 1px';
		for(j=0;j<13;j++)
		{
			r=doc.createElement("TR");
			tb.appendChild(r);
			for(i=0;i<cols;i++)
			{
				var c=o._newE(doc,"TD",r);
				c.innerHTML="&nbsp;";
				c.id="iged_clr_"+i+"_"+j;
				c.title=tt;
				s=c.style;
				s.cursor="pointer";s.padding=w;s.fontSize="1px";s.border="solid 1px blue";
				c.setAttribute("c","c");
				o._addLsnr(c,"mouseout",iged_clrEvt);
				o._addLsnr(c,"mouseover",iged_clrEvt);
				o._addLsnr(c,"click",iged_clrEvt);
			}
		}
		this._clrInit();
		return clr;
	}
	this._pos=function(evt,pan,flag)
	{
		if(!evt)if((evt=window.event)==null)return;
		var x=0,y=0,x0=0,y0=0,e=(flag==8)?evt:evt.target;
		if(!e)if((e=evt.srcElement)==null)return;
		var elem=e,doc=iged_all._doc0;if(!doc)doc=window.document;
		/* if it is menu item, then use last parent of menu for container of drop-down */
		if(iged_all._pop)while(e)
		{
			if(e.getAttribute&&e.getAttribute('igf')=='m'){elem=iged_all._lastPopParent;break;}
			e=e.parentNode;
		}
		e=elem;
		if(flag==2)
		{
			while(e&&e.nodeName!='TABLE')e=e.parentNode;
			if(!e)e=elem;
		}
		var eH=e.offsetHeight,s=pan.style;
		if(!eH)eH=20;
		var ee=e,x=0,y=0,x1=0,y1=0,e0=this._elem0,ed=this._elem;
		var ep=ed.parentNode;
		/* check if event is inside editing area: popup */
		while(ee&&ee!=e0)
		{
			if(ee==ed||ee==ep)
			{
				x1=evt.offsetX;y1=evt.offsetY;
				if(!x1){x1=evt.layerX;y1=evt.layerY;if(!x1)x1=y1=0;}
				eH=0;
				e=ee;
				x1+=x-ee.parentNode.scrollLeft+10;
				y1+=y-ee.parentNode.scrollTop+10;
				break;
			}
			x+=ee.offsetLeft;
			y+=ee.offsetTop;
			ee=ee.parentNode;
		}
		/* memorize old parent of drop-down panel and parent of element which is used to adjust position of drop-down */
		pan._moved=pan.parentNode;
		pan._pan=e.parentNode;
		iged_all._lastPopParent=e;
		s.position='absolute';
		s.marginLeft='0px';
		/* move panel to new parent */
		if(pan.parentNode)pan.parentNode.removeChild(pan);
		e.parentNode.insertBefore(pan,e);
		s.display='';
		s.visibility='visible';
		var panW=pan.offsetWidth,panH=pan.offsetHeight,w0=e0.offsetWidth,h0=e0.offsetHeight;
		/* check if drop-down is within bounds of editor */
		ee=e;
		x=y=0;
		while(ee&&ee!=e0)
		{
			if(ee==this._elem)break;
			x+=ee.offsetLeft;
			y+=ee.offsetTop;
			ee=ee.offsetParent;
		}
		if(!ee)x=y=0;
		x+=x1;y+=(y1+=eH);
		if(x+panW>w0)x1+=w0-panW-x;
		if(y+panH>h0+80)y1+=h0-panH-y+80;
		s.marginLeft=x1+'px';
		s.marginTop=y1+'px';
	}
	this._cellProp=function()
	{
		var c=iged_all._curCell;
		if(!c)return;
		var alignH=iged_el("iged_cp_ha").value,alignV=iged_el("iged_cp_va").value;
		var w=iged_el("iged_cp_w").value,h=iged_el("iged_cp_h").value,noWrap=iged_el("iged_cp_nw").checked;
		var clrBk=iged_el("iged_cp_bk1").value,clrBd=iged_el("iged_cp_bd1").value;
		if(alignH&&alignH!="default")c.align=alignH;
		if(alignV&&alignV!="default")c.vAlign=alignV;
		if(w)c.width=w;
		if(h)c.height=h;
		if(noWrap)c.noWrap=noWrap;
		c.bgColor=clrBk;
		if(this._ie)c.borderColor=clrBd;
		else{c.setAttribute("bc",clrBd);if(clrBd!="")clrBd+=" solid 1px";c.style.border=clrBd;}
		iged_all._curCell=null;
		iged_closePop();
	}
	this._decode=function(t){return t;}
	this._fixStr=function(v,s)
	{
		v=iged_replaceS(iged_replaceS(v,'%3E','>',s),'%3C','<',s);
		if(s)v=iged_replaceS(v,'%22','%3C=!=%3E');/*BR30767:preserve original %22*/
		v=iged_replaceS(v,'%22','"',s);
		return s?v:iged_replaceS(v,'<=!=>','%22');
	}
	this._update=function()
	{
		/*this._foc=-1:never blur, 0:blur, 1:focus before blur, 2:focus after blur*/
		if(this._mod||this._foc>0)this._ta.value=this._fixStr(this._decode(this.getText()),true);
		this._mod=false;
	}
	this._onInsert=function(e)
	{
		var v=iged_replaceS(iged_replaceS(e.id,"&quot1;","'"),"&quot;","\"");
		if(this._ie)iged_insText(v,false,true);
		else
		{
			var n=document.createElement("SPAN");
			n.innerHTML=v;
			iged_insNodeAtSel(n);
		}
		this._afterSel(e);
	}
	this._amp=function(t)/* replace "&amp;" strings in <IMG src="xx"> and <A href="xx"> by "&" */
	{
		var i,i1,i2,x=8,n=' href="';
		while(--x>5)
		{
			i=t.length;
			while((i2=i-1)>2)if((i=t.lastIndexOf(n,i2))>=0)
			{
				i1=t.indexOf('"',i+x);
				if(i1<i||i1>i2)continue;
				var t1=t.substring(i+x,i1);
				while(t1.indexOf('&amp;')>=0){t1=t1.replace('&amp;','&');i2=0;}
				if(i2==0)t=t.substring(0,i+x)+t1+t.substring(i1);
			}
			n=' src="';
		}
		return t;
	}
	this._getTag=function(e,t1,t2)
	{
		if(!e)return e;
		var t=e.tagName;
		if(t==t1||t==t2)return e;
		if(e.id==iged_all._cur._elem.id||t=='BODY')return null;
		return this._getTag(e.parentNode,t1,t2);
	}
	this._cs=function(i)
	{
		var o=this._csA;
		if(!o)
		{
			o=iged_el(this.ID);
			if(o)o=o.getAttribute('ig_cs');
			if(o)this._csA=o=o.split('|');
			else return '';
		}
		return o[i]?o[i]:'';
	}
	this._fixMouse(tb,1);
	iged_all._cur=iged_all[id]=this;
	try
	{
		id=navigator.userAgent.toLowerCase();
		this._saf=id.indexOf('safari')>=0;
		this._opr=id.indexOf('opera')>=0;
		this._mac=id.indexOf('mac')>=0;
	}catch(id){}
	this._maxZ=function(e,zi)
	{
		if(!zi)zi=9999;
		while(e)
		{
			if(e.nodeName=='BODY'||e.nodeName=='FORM')break;
			z=this._getStyle(e,'zIndex');
			if(z&&z.substring)z=(z.length>4&&z.charCodeAt(0)<58)?parseInt(z):0;
			if(z&&z>=zi)zi=z+1;
			e=e.parentNode;
		}
		return zi;
	}
	this._getStyle=function(e,p)
	{
		var s=e.currentStyle;
		if(!s)
		{
			var win=document.defaultView;
			if(!win)win=window;
			if(win.getComputedStyle)s=win.getComputedStyle(e,'');
			if(!s)s=e.style;
		}
		var val=s[p];
		if(!val||!s.getPropertyValue)return val;
		return s.getPropertyValue(p);
	}
	if(iged_all._submit)return;
	iged_all._submit=true;
	this._addLsnr(ta.form,"submit",iged_update);
	this._addLsnr(ta.form,"click",iged_update);
}
function iged_popTimer()
{
	var o=iged_all._ip;
	if(!o||!o.f)return;
	var d,s=o.pan.style,h=o.h,pH=o.panH;
	if(++o.i>1)o.i=0;
	if(h&&pH&&(((o.f&2)==0)||o.i==0))
	{
		d=(pH>>5)+(h>>3)+2;
		if((h+=d)>=pH){h=pH;o.panH=null;}
		o.h=h;
		s.height=h+"px";
		if(o.y>=0)s.top=(o.y+pH-h)+"px";
	}
	d=o.o;
	if(d&&(((o.f&8)==0)||o.i==0))
	{
		if((o.o+=0.06)>=1.0){d=1.0;o.o=null;}
		s.opacity=d;
		s.filter="progid:DXImageTransform.Microsoft.Alpha(opacity="+(d*100)+")";
	}
	if(o.o||o.panH)return;
	window.clearInterval(o.fn);
	delete o.fn;
	delete iged_all._ip;
	if(o.h){s.height=o.oldH;if(o.overF)s.overflow=o.overF;}
}
function iged_mainEvt(e)
{
	if(!e)if((e=window.event)==null)return;
	var o=iged_all._pop,src=e.target;
	if(!src)if((src=e.srcElement)==null)src=this;
	var ee=src,t=src.ownerDocument;
	if(o)while(ee)
	{
		if(ee==o||ee==iged_all._clr)
		{
			if(e.keyCode==27){iged_cancelEvt(e);iged_closePop();}
			return;
		}
		ee=ee.parentNode;
	}
	ee=src;
	var inElem=iged_getById(ee);
	if(t)t=t.id;if(!t)t=src.id;
	/* focus/blur under safari and chrome was added to window, but not document */
	if(!t)try{t=src.document.id;}catch(t){}
	o=null;
	if(t&&t.indexOf("ig_d_")==0)o=iged_getById(t.substring(5));
	if(o){if(src.src&&src.src.length>1)iged_all._curImg=src;}
	else while((ee=ee.parentNode)!=null)try
	{
		if(iged_getById(ee))inElem=true;
		if(ee.getAttribute)if((o=ee.getAttribute("ig_id"))!=null)
		if((o=iged_getById(o))!=null)break;
	}
	catch(i){}
	if(!o)return;
	var elem=src;
	while(elem){if(o._elem==elem){src=elem;break;}elem=elem.parentNode;}
	if(o._ie)o._ie();
	if(o._zero)o._edit(true);
	switch(e.type)
	{
		case "keydown":t=3;o._focs=1;break;
		case "keypress":t=4;break;
		case "focus":t=5;if(o._foc>0)o._focs=1;break;
		case "blur":t=6;break;
		case "contextmenu":t=7;if(!o.hasFocus())return;break;
		case "mousedown":t=8;iged_all._click=src.onclick?o:null;/*maybe not-editable button*/
			/*this._foc=-1:never blur, 0:blur, 1:focus before blur, 2:focus after blur*/
			if(o._foc==-1)o._foc=0;if(o._foc==1)o._foc=2;
			if(o._elem==src)o._focs=1;
			o._click=(new Date()).getTime();if(!o._ed0)return;break;
		default:return;
	}
	if(t<7)
	{
		var k=e.keyCode;
		if(!k||k==0)k=e.which;
		if(iged_all._pop){iged_cancelEvt(e);if(k==27)iged_closePop();return;}
		ee=o._fire(t,k);
		if(t<5)
		{
			/*this._foc=-1:never blur, 0:blur, 1:focus before blur, 2:focus after blur*/
			o._foc=2;
			if(ee){if(!o._posted)iged_cancelEvt(e);}
			else
			{
				if(!e.ctrlKey&&!e.altKey&&(k=o._evt.key)!=null)e.keyCode=k;
				if(t==3&&o._onKey)o._onKey(e);
			}
			return;
		}
	}
	if(t==7)
	{
		if((t=o._prop[13])!=0)
		{
			iged_cancelEvt(e);
			if(t==2)iged_act("RightClick:pop","","",e,"r");
		}
		return;
	}
	/*this._foc=-1:never blur, 0:blur, 1:focus before blur, 2:focus after blur*/
	if(t==6){o._update(e);o._foc=0;return;}
	if(o._ie)try
	{
		iged_all._curRange=o._range();
		if(!o._2D)o._doc().execCommand("2D-Position",true,o._2D=true);
	}catch(i){}
	if(iged_all._canCloseCur)iged_closePop();
	/*this._foc=-1:never blur, 0:blur, 1:focus before blur, 2:focus after blur*/
	if(t==5){o._mod=true;if(o._foc<1)o._foc+=2;}
	/*this._foc=-1:never blur, 0:blur, 1:focus before blur, 2:focus after blur*/
	if(t==8&&!inElem&&(o._foc<1)&&!(src.unselectable&&iged_all._cur==o)&&src.id!=o._ids[0]&&src.id!=o._ids[1])window.setTimeout("iged_all._cur.focus()",0);
	iged_all._cur=o;
}
function iged_mEvt(e)
{
	if(!e)if((e=window.event)==null)return;
	var m=null,i=0,el=e.target;
	if(!el)if((el=e.srcElement)==null)el=this;
	while(++i<7&&el)try{if((m=el.mm)!=null)break;el=el.parentNode;}catch(e){}
	if(!m)return;
	var i0=0,s=el.style,t=e.type.substring(5);
	var im=el.imgs;
	if(im)i=im.length;
	if(t=="over"){i0=3;i=(i<4)?1:3;}
	else if(t=="down"){i0=6;i=2;}
	else if(t=="up"){i0=9;i=(i<4)?1:3;}
	else i=1;
	if(m.length>9)try{eval("s.backgroundColor=m["+i0+"];s.borderColor=m["+(i0+1)+"];s.borderStyle=m["+(i0+2)+"];");}catch(e){}
	if(im)if((e=iged_el(im[0]))!=null)e.src=im[i];
}
function iged_choiceEvt(e)
{
	if(!e)if((e=window.event)==null)return;
	var a,s=0,el=e.target;
	if(!el)if((el=e.srcElement)==null)el=this;
	while(++s<6&&el)try
	{
		a=el.getAttribute;if(a)a=el.getAttribute("igf");if(a=="c"||a=="m"||a=="l")break;
		el=el.parentNode;
	}catch(i){}
	if(s>5)return;
	var p=el.innerHTML;s=el.style;
	switch(e.type)
	{
		case "mouseover":s.backgroundColor=el._b2;s.color=el._f2;return;
		case "mouseout":s.backgroundColor=el._b;s.color=el._f;return;
		case "click":if(a=="l"){iged_act("characterdialog",el,p,"select");return;}
			s=el._act;if(s&&s!="none")iged_act(s,el,p,"select");return;
	}
}
function iged_clrEvt(e)
{
	if(!e)if((e=window.event)==null)return;
	var el=e.target,o=iged_all._cur;
	if(!el)if((el=e.srcElement)==null)el=this;
	var a=el.getAttribute("c"),s=el.style;
	if(a=="c"||(a&&a.length<2))a=null;
	var c=a?"#90C0C0":el.clr,d=iged_el("iged_c_c0"),f=iged_el("iged_c_c1");
	if(o)try{switch(e.type)
	{
		case "click":if(!a){s.borderColor=c;o._onClr(c);}
			else
			{
				a=parseInt(a.substring(1))-4;
				if(a<0)a=(a*2-5.5)/7;if(a>0)a=(a*3+1)/15;
				iged_all._clrSelBut.style.color="black";
				s.color="red";iged_all._clrSelBut=el;
				iged_all._clrRGB=a;o._clrInit();
			}return;
		case "mouseout":s.borderColor=c;return;
		case "mouseover":
			if(!a)d.style.backgroundColor=f.value=c;
			s.borderColor="black";
			try{f.focus();}catch(a){}
			return;
		case "keyup":try{d.style.backgroundColor=el.value;o._clrNew=el.value;}catch(a){};return;
		case "keydown":
			var k=e.keyCode;c=o._clrNew;
			if(!k||k==0)k=e.which;
			if(k==27)o._onClr("");
			if(k==13){o._onClr(c);iged_cancelEvt(e);}
			return;
	}}catch(a){}
}
function iged_act(key,p1,p2,p3,p4,p5)
{
	var i,o=iged_all._cur,o1=iged_all._click,act=key.toLowerCase();
	if(!o||!o._valid())return;
	if(o1&&o1!=o){i=(new Date()).getTime();if(i<o1._click+4000&&(!o._click||o._click<o1._click))o=o1;}/*mousedown on not-editable button*/
	i=act.indexOf(":");
	if(o._prop[12]<1)if(!(act.indexOf('print')==0||act.indexOf('find')==0||act.indexOf('word')==0||act.indexOf('view')>0||act.indexOf('custom')==0||act.indexOf('zoom')==0))return;
	if(i>0){key=key.substring(0,i);act=act.substring(i+1);if(act=="_0"){act=key;o._post=true;}}
	if(o._fire(1,key,p1,p2,p3,p4,p5,act))return;
	i=o._evt;
	if(i.p4)p1=i.p4;if(i.p5)p2=i.p5;if(i.p6)p3=i.p6;if(i.p7)p4=i.p7;if(i.p8)p5=i.p8;if(i.act)act=i.act;
	switch(act)
	{
		case "fontname":case "fontsize":o._onSelFont(p1,act);break;
		case "fontformatting":o._onSelFont(p1,"formatblock");break;
		case "fontstyle":o._onApplyStyle(p1);break;
		case "insert":o._onInsert(p1);break;
		case "superscript":o._onSubSup(act,"subscript");break;
		case "subscript":o._onSubSup(act,"superscript");break;
		case "bold":case "italic":case "underline":case "strikethrough":
		case "justifyleft":case "justifycenter":case "justifyright":case "justifyfull":
		case "redo":
			o._format(act,"",false,true);break;
		case "print":o.print();break;
		case "undo":if(iged_all._noUndo)return;o._format(act,"",false,true);break;
		case "indent":o._format(act,"",false,true);o._setOl();break;
		case "outdent":o._format(act,"",false,true);o._setOl();break;
		case "removelink":o._format("unlink","",false,true);break;
		case "insertlink":if(o._ie&&!o.hasFocus()){o._alert(o._cs(12));return;}o._onLink();break;
		case "togglepositioning":if(!o._ie){o._alert();return;}
			var sElem=o._getSelElem();
			if(!sElem){o._alert(o._cs(12));return;}
			sElem.style.position=(sElem.style.position=="absolute")?"static":"absolute";
			break;
		case "sendbackward":case "bringforward":
			if(!o._ie){o._alert();return;}
			var sElem=o._getSelElem();
			if(sElem)sElem.style.zIndex+=((act=="sendbackward")?1:-1);
			else{o._alert(o._cs(12));return;}
			break;
		case "toggleborders":o._onToggleBdr();break;
		case "wordcount":
			var txt=iged_replaceS(iged_getEditTxt(),"<BR>"," ");
			txt=iged_replaceS(txt,"<P>","");txt=iged_replaceS(txt,"</P>"," ");
			txt=iged_stripTags(txt);
			txt=iged_replaceS(iged_replaceS(txt,"\n"," "),"\r","");
			txt=iged_replaceS(txt,"&nbsp;"," ");
			var words=0,chars=txt.length,clean=iged_replaceS(txt," ","").length;
			txt=iged_replaceS(txt,"  "," ");
			if(chars>0)
			{
				txt=txt.split(" ");
				for(i=0;i<txt.length;i++)if(txt[i].length>0)words++;
			}
			var t="\t "+o._cs(7)+"\r\n_______________________________\t\r\n\r\n ";
			txt=o._cs(8);if(txt.length<8)txt+="\t";t+=txt+"\t\t"+words+"\r\n "+o._cs(9)+"\t\t"+chars+"\r\n ";
			t+=o._cs(10)+"\t"+clean;
			o._alert(t);
			break;
		case "orderedlist":case "unorderedlist":
			o._fixListFormat();
			o._format("insert"+act,"",false,true);
			iged_all._needSync=true;
			break;
		case "copy":case "cut":case "paste":
			try{if(!o._ie&&window.netscape)netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");}
			catch(i){o._alert();return;}
			o._format(act,"",p1,!p1);
			break;
		case "preview":
			var win=window.open(o._prop[7],"_blank","width=800, height=600, location=no, menubar=no, status=no, toolbar=no, scrollbars=yes, resizable=yes",false);
			var doc=o._ie?o._elem:o._body();
			win.document.write("<html><head><title>"+o._cs(0)+"</title></head><body topmargin='0' leftmargin='0'>"+doc.innerHTML+"</body></html>");
			break;
		case "pastehtml":
			try
			{
				var cd=window.clipboardData;
				if(cd)
				{
					cd="<P>"+cd.getData("Text").toString()+"</P>";
					cd=o._cleanWord(cd);
					iged_insText(cd,false,true);
					break;
				}
			}catch(i){}
			o._alert();
			return;
		case "cleanword":
			if(o._ie)
			{
				o.setText(o._cleanWord((!o._html)?o._elem.innerHTML:o._elem.innerText));
				break;
			}
			var body=o._body();
			if(!o._html)
				body.innerHTML=o._cleanWord(body.innerHTML);
			else
			{
				var html=body.ownerDocument.createRange();
				html.selectNodeContents(body);
				html=document.createTextNode(o._cleanWord(html.toString()));
				body.innerHTML="";
				body.appendChild(html);
			}
			break;
		case "zoom25":case "zoom50":case "zoom75":case "zoom100":case "zoom200":case "zoom300":case "zoom400":case "zoom500":case "zoom600":
			if(o._ie)o._elem.style.zoom=act.substring(4)+"%";
			else {o._alert();return;}
			iged_closePop("Zoom");
			break;
		case "insertcolumnright":case "insertcolumnleft":o._insCol(act.substring(12));break;
		case "insertrowabove":case "insertrowbelow":o._insRow(act.substring(9));break;
		case "increasecolspan":case "decreasecolspan":o._colSpan(act.substring(0,8));break;
		case "increaserowspan":case "decreaserowspan":o._rowSpan(act.substring(0,8));break;
		case "deleterow":o._delRow();break;
		case "deletecolumn":o._delCol();break;
		case "insertimage":
			var img=o._getSelImg();
			if(img)iged_all._curImg=img;
		case "insertwindowsmedia":case "insertflash":case "upload":case "open":
			iged_closePop();
			o._wait(p4);
			p5=iged_modal(p1,p2,p3,p4);break;
		case "findreplace":if(o._ie)return;
			if(!o._elem.contentWindow.nsFindInstData)o._elem.contentWindow.nsFindInstData=new Function();
			o._elem.contentWindow.find();
			break;
		case "pop":
			var p6=null;
			if(p4=="r")
			{
				p1="iged_0_rcm";p4=3;p6=1;
				if((iged_all._curImg=o._getSelImg())!=null)p6=3;
				else if(o._inTbl())p6=2;
			}
			if(p4=="t")
			{
				var tbl=o._inTbl();
				p4=null;p1=tbl?"iged_0_itm":"iged_0_ito";
				if(o._ie)
				{
					o._elem.setActive();
					iged_all._curRange=o._range();
					iged_all._curMenuCell=iged_all._curMenuTable=iged_all._curMenuRow=null;
					if(tbl)try
					{
						var par=iged_all._curRange.parentElement();
						iged_all._curMenuCell=o._getTag(par,'TD','TH');
						iged_all._curMenuTable=o._getTag(par,'TABLE');
						iged_all._curMenuRow=o._getTag(par,'TR');
					}catch(tbl){}
				}
			}
			if(p1&&p1.length>0)o._pop(p1,p2,p3,p4,p5,p6);
			break;
		case "popwin":o._popWin(p1,p2,p3,p4,p5);break;
		case "ruledialog":o._insRule(p1,p2,p3,p4,p5);break;
		case "bookmarkdialog":o._insBook(p1);break;
		case "characterdialog":iged_insText(p2,true,true);break;
		case "tabledialog":o._insTbl();break;
		case "celldialog":o._cellProp();break;
		case "finddialog":if(!o._find0)return;o._find0(1);break;
		case "replacedialog":if(!o._find0)return;o._find0(2);break;
		case "replacealldialog":if(!o._find0)return;o._find0(3);break;
		case "changeview":o._showHtml(p1);break;
		case "spellcheck":i=(typeof ig_getWebControlById=="function")?ig_getWebControlById(p1):null;
			if(i&&i.checkTextComponent)i.checkTextComponent(o.ID);
			else o._alert(o._cs(13).replace('{0}',p1));
			break;
		default:return;
	}
	o._fire(2,key,p1,p2,p3,p4,p5,act);
}
function iged_getEditTxt()
{
	var o=iged_all._cur;
	if(!o)return "";
	if(!o._ie)return o._body().innerHTML;
	return o._html?o._elem.innerText:o._decode(o._elem.innerHTML);
}
function iged_imgMouseAct(id,img){id=iged_el(id);if(id)id.src=img;}
function iged_changeSt(elem,clrBk,clrBd,stBd){var s=elem.style;s.backgroundColor=clrBk;s.borderColor=clrBd;s.borderStyle=stBd;}
function iged_moveBack(p)
{
	var m=p?p._moved:null;
	if(!m)return;
	p.style.display='none';
	p._moved=null;
	p.parentNode.removeChild(p);
	m.appendChild(p);
}
function iged_closePop(s)
{
	iged_moveBack(iged_all._clr);
	var doc=iged_all._doc0;
	if(doc)if((doc=doc.getElementById("iged_clr0_id"))!=null)doc.style.display="none";
	iged_all._doc0=null;
	if(s=="clr")return;
	var p=iged_all._pop;
	if(!p||p.style.visibility=="hidden")return;
	iged_moveBack(p);
	var o=iged_getById(iged_all._popID);
	var foc=s!=null;if(s==3||!s)s="";
	if(o){if(o._fire(1,"ClosePopup",s))if(s)return;o._doValid();}
	p.style.visibility="hidden";
	iged_all._pop=null;
	if(o)o._fire(2,"ClosePopup",s);
	iged_all._canCloseCur=false;
	if(o&&foc)o.focus(1);
}
function iged_stripTags(html) 
{
   html=html.replace(/\n/g, ".$!$.")
   var aScript=html.split(/\/script>/i);
   for(i=0;i<aScript.length;i++)
      aScript[i]=aScript[i].replace(/\<script.+/i,"");
   html=aScript.join("");
   html=html.replace(/\<[^\>]+\>/g,"").replace(/\.\$\!\$\.\r\s*/g,"").replace(/\.\$\!\$\./g,"");
   return html.replace(/\r\ \r/g,"");
} 
function iged_nestCount(elem,tag)
{
	var i=0,id=iged_all._cur._elem.id;
	while(elem&&elem.id!=id)
	{
		if(elem.tagName==tag)i++;
		if(document.all)elem=elem.parentElement;
		else elem=elem.parentNode;
	}
	return i;
}
function iged_el(id){var d=iged_all._doc0;if(!d)d=window.document;return d.getElementById(id);}
function iged_replaceS(s1,s2,s3,r)
{
	try{return s1.replace(new RegExp(r?s3:s2,'g'),r?s2:s3);}catch(e){}
	if(r){r=s2;s2=s3;s3=r;}
	while(s1.indexOf(s2)>=0)s1=s1.replace(s2,s3);
	return s1;
}
function iged_cancelEvt(e)
{
	if(e==null)if((e=window.event)==null)return;
	if(e.stopPropagation)e.stopPropagation();
	if(e.preventDefault)e.preventDefault();
	e.cancelBubble=true;
	e.returnValue=false;
}
function iged_clearText()
{
	var o=iged_all._cur;if(!o)return;
	if(o._ie)o._elem.innerHTML="";
	else o._elem.contentDocument.clear();
}
function iged_loadCell()
{
	var c=iged_all._curCell,e=iged_el("iged_cp_ha");
	if(!c||!e)return;
	e=e.options;
	iged_el("iged_cp_w").value=c.width;
	iged_el("iged_cp_h").value=c.height;
	iged_el("iged_cp_nw").checked=c.noWrap;
	for(i=0;i<e.length;i++)if(e[i].value==c.align)e[i].selected=true;
	e=iged_el("iged_cp_va").options;
	for(i=0;i<e.length;i++)if(e[i].value==c.vAlign)e[i].selected=true;
	iged_updateClr(c.bgColor,"iged_cp_bk1");
	var bc=c.borderColor;if(!bc)bc=c.getAttribute("bc");
	iged_updateClr(bc?bc:c.getAttribute("bc"),"iged_cp_bd1");
}
function iged_loadTable()
{
	var t=iged_all._curTable,e=iged_el("iged_tp_rr");
	if(!t||!e)return;
	e.disabled=true;e.value=t.rows.length;
	e=iged_el("iged_tp_cc");
	e.disabled=true;e.value=t.rows[0]?t.rows[0].cells.length:0;
	e=iged_el("iged_tp_al").options;
	for(var i=0;i<e.length;i++)if(e[i].value==t.align)e[i].selected=true;
	iged_el("iged_tp_cp").value=t.cellPadding;
	iged_el("iged_tp_cs").value=t.cellSpacing;
	iged_el("iged_tp_w").value=t.width;
	iged_el("iged_tp_bds").value=t.border;
	iged_updateClr(t.bgColor,"iged_tp_bk1");
	var bc=t.borderColor;
	iged_updateClr(bc?bc:t.getAttribute("borderColor"),"iged_tp_bd1");
}
function iged_updateClr(c,id)
{
	if(!c)c="";
	id=iged_el(id);
	id.style.backgroundColor=(c=="")?"#F0F0F0":c;
	id.value=c;
}
function iged_dragEvt(e)
{
	if(!e)if((e=window.event)==null)return;
	var src=e.target,o=iged_all._cur,p=iged_all._pop;
	if(p)p=p.style;else return;
	if(!src)if((src=e.srcElement)==null)src=this;
	if(e.type=="mouseup"){iged_all._dragOn=false;return;}
	if(e.type=="mousemove")
	{
		if(!iged_all._dragOn)return;
		iged_cancelEvt(e);
		var x=iged_all._dragX+e.clientX-iged_all._dragX0,y=iged_all._dragY+e.clientY-iged_all._dragY0;
		if(!isNaN(x))p.marginLeft=x+'px';
		if(!isNaN(y))p.marginTop=y+'px';
		return;
	}
	if(!o||src.id!="titleBar")return;
	iged_all._dragX0=e.clientX;iged_all._dragY0=e.clientY;
	if(isNaN(iged_all._dragX=parseInt(p.marginLeft)))return;
	if(isNaN(iged_all._dragY=parseInt(p.marginTop)))return;
	iged_all._dragOn=true;
	if(iged_all._dragE)return;
	iged_all._dragE=true;
	o._addLsnr(document,"mousemove",iged_dragEvt);
	o._addLsnr(document,"mouseup",iged_dragEvt);
}
function iged_update(e)
{
	var o=null;
	if(e&&e.type=='click')if((o=e.srcElement)==null)o=e.target;
	if(o&&o.type!='submit')return;
	var t1=new Date().getTime(),t=iged_all._lastT;
	if(!t||t+99<t1)for(var i in iged_all)
		if(i!='_cur'&&(o=iged_all[i])!=null)if(o._update)o._update();
	iged_all._lastT=t1;
}
function iged_valid(id){var o=iged_all[id];if(o)o._valid();}
