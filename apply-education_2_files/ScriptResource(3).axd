//vs 031210
if(typeof(igedit_all)!="object")
	var igedit_all=new Object();
function igedit_getById(id,elem)
{
	var o,e=elem,i1=-2;
	if(e!=null)
	{
		while(true)
		{
			if(e==null)return null;
			try{if(e.getAttribute!=null)id=e.getAttribute("editID");}catch(ex){}
			if(!ig_csom.isEmpty(id))break;
			if(++i1>4)return null;
			e=e.parentNode;
		}
		var ids=id.split(",");
		if(ig_csom.isEmpty(ids))return null;
		id=ids[0];
		i1=(ids.length>1)?parseInt(ids[1]):-1;
	}
	if((e=igedit_all)!=null)if((o=e[id])==null)for(var i in e)if((o=e[i])!=null)
		if(o.ID==id||o.ID_==id||o.uniqueId==id)break;else o=null;
	if(o!=null&&i1>-2)o.elemID=i1;
	return o;
}
function igedit_init(id,t,prop0,prop1,cb)
{
	var i=-1,foc=false,vs=null,o=igedit_all[id],elem=(typeof document=='unknown')?null:document.getElementById('igtxt'+id);
	if(o&&o.msV)
	{
		var b=o.buttons;
		if(b)while(++i<b.length)if(b[i])b[i].elem=null;
		o._element=o.Element=o.elem=o.elemViewState=o.elemValue=o.tr=o.Event=o.webGrid=null;
		foc=o.fcs>0;
		ig_dispose(o);
	}
	if(!elem||!prop0)return;
	i=prop1.length;
	while(i-->0)if(prop1[i]&&prop1[i].toLowerCase)prop1[i]=prop1[i].replace(/&lt;/g,'<').replace(/&amp;/g,'&');
	/* Check for redirect under Mozilla. */
	/* Mozilla updates values in <input>s before running init javascript (I wish IE did similar). */
	/* Note:redirect for IE is done while processing load event */
	if(!o)if((vs=document.getElementById(id+'_p'))!=null)
	/* check if elemViewState.value=='\9' (set on server), if it is not, then that is new value after redirect. */
	/* under async postback Firefox is not able to keep input.value='\9', so, validation fails: add validation for value of another input */
	{vs=vs.value;o=document.getElementById(id);if((vs.length==1&&vs=='\t')||(o&&vs.length==0&&o.value.length>0))vs=null;}
	prop0=prop0.split(",");
	if(t>=4)o=igedit_number(elem,id,prop0,prop1);
	else if(t==2)o=igedit_date(elem,id,prop0,prop1);
	else if(t==1)o=igedit_mask(elem,id,prop0,prop1);
	else o=new igedit_new(elem,id,prop0);
	igedit_all[id]=o;
	o.fix=1;
	if(cb)ig_csom.getCBManager().addPanel(o,id,id,o.Element,(cb=='1')?null:cb);
	/* If it is redirect, then use current value in editor (_ok does that), but not value from javascript */
	if(vs!=null)o._ok((t==2)?vs:null);
	else o.setValue(prop1[0]);
	o.fcs=o._np=0;
	o._dtt();
	if((o._flag&2)!=0||foc)o.focus1();
	o.fireEvent(10);
	o._vs=o._vs0=o.elemViewState.value;/*BR23139: fix for "reset" button*/
}
function igedit_number(elem,id,prop0,prop1)
{
	var i=1,me=new igedit_new(elem,id,prop0);
	var j=-1,v=me.valI(prop1,i++);
	var n=v.length;if(n<1)v=".";if(n<2){n=2;v+=v;}
	me.dec_vld=v.substring(n>>=1);
	me.decimalSeparator=v.substring(0,n);
	me.groupSeparator=me.valI(prop1,i++);
	v=me.valI(prop1,i++);
	if(v.length<1)v="-";
	me.minus=v;
	me.symbol=me.valI(prop1,i++);
	me.nullText=me.valI(prop1,i++);
	me.positivePattern=me.valI(prop1,i++);
	me.negativePattern=me.valI(prop1,i++);
	me.mode=me.valI(prop1,i++);
	me.decimals=me.valI(prop1,i++);
	me.minDecimals=me.valI(prop1,i++);
	v=me.valI(prop1,i++);
	if(v==1)me.min=me.valI(prop1,i++);
	v=me.valI(prop1,i++);
	if(v==1)me.max=me.valI(prop1,i++);
	me.clr1=me.valI(prop1,i++);
	me.clr0=me.valI(prop1,i++);
	me.groups=new Array();
	while(++j<6){if((v=me.valI(prop1,i++))>0)me.groups[j]=v;else break;}
	me.getMaxValue=function(){return this.max;}
	me.setMaxValue=function(v){this.max=this.toNum(v,false);}
	me.getMinValue=function(){return this.min;}
	me.setMinValue=function(v){this.min=this.toNum(v,false);}
	me.toNum=function(t,limit,fire)
	{
		var c,num=null,i=-1,div=1,dec=-1,iLen=0;
		if(t==="")t=null;
		if(t==null||t.length==null)num=t;
		else
		{
			var neg=false,dot=this.decimalSeparator.charCodeAt(0);
			if(t)
			{
				c=this.symbol;
				if(c.length>0)if((iLen=t.indexOf(c))>=0)t=t.substring(0,iLen)+t.substring(iLen+c.length);
				if(t.toUpperCase==null)t=t.toString();
				iLen=t.length;
			}
			while(++i<iLen)
			{
				if(this.isMinus(c=this.jpn(t.charCodeAt(i)))){if(neg)break;neg=true;}
				if(c==dot||c==12290||c==65294||(c==12289&&dot==44)){if(dec>=0)break;dec=0;}/*japanese ".","'.","("*/
				if(c<48||c>57)continue;
				if(num==null)num=0;
				if(dec<0)num=num*10+c-48;
				else{dec=dec*10+c-48;div*=10;}
			}
			if(num!=null){if(dec>0)num+=dec/div;if(neg)num=-num;}
		}
		i=limit?this.limits(num):num;
		if(fire!=true)return i;
		c="";
		if(this._np!=null&&(i!=num||(i==null&&iLen>0)))
		{
			fire=new Object();fire.value=i;fire.text=t;
			fire.type=(num==null)?((iLen==0)?2:0):1;
			c=String.fromCharCode(30);
			c+=t+c+fire.type;
			if(this.fireEvent(13,null,fire))c="";
			i=fire.value;
		}
		this.value=i;
		this._vs=this.elemViewState.value=this.toTxt(i,true,null,"-",".")+c;
		this.valid(this.toTxt(i,true,null,"-",this.dec_vld));
		return i;
	}
	me.enter0=function(){return this.toTxt(null,true,this.elem.value,"-",".");}
	me.focusTxt=function(foc,e)
	{
		if(e!=null&&!foc)this.value=this.toNum(this.elem.value,true,this.fcs>=0);
		return this.toTxt(this.value,foc);
	}
	me.toTxt=function(v,foc,t,m,dec)
	{
		if(t==null)
		{
			if(v==null)return foc?"":this.nullText;
			var neg=(v<0);
			if(neg)v=-v;
			try{t=v.toFixed(this.decimals);}catch(ex){t=""+v;}
			return this.toTxt(neg,foc,t.toUpperCase(),(m==null)?this.minus:m,(dec==null)?this.decimalSeparator:dec);
		}
		var c,i=-1,iL=t.length;
		if(v==null)
		{
			if(iL==0)return foc?t:this.nullText;
			if(v=this.isMinus(t.charCodeAt(0)))t=t.substring(1);
		}
		var iE=t.indexOf("E");
		if(iE<0)iE=0;
		else
		{
			iL=parseInt(t.substring(iE+1));
			t=t.substring(0,iE);
			iE=iL;
		}
		iL=t.length;
		while(++i<iL)/* remove dot */
		{
			c=t.charCodeAt(i);
			if(c<48||c>57){t=t.substring(0,i)+t.substring(i+1);iL--;break;}
		}
		/* if dot,remove trailing 0s */
		while(i<iL){if(t.charCodeAt(iL-1)!=48)break;t=t.substring(0,--iL);}
		if(iE!=0)
		{
			while(iE-->0)if(i++>=iL)t+="0";
			if(++iE<0){if(i==0)t="0"+t;while(++iE<0)t="0"+t;t="0"+t;i=1;}
		}
		iL=i;
		var iDec=0;
		if(this.decimals>0&&iL<t.length)
		{
			iDec=t.length-iL;
			t=t.substring(0,iL)+dec+t.substring(iL);
			iL+=dec.length+this.decimals;
		}
		if(iL<t.length)t=t.substring(0,iL);
		if((iL=this.minDecimals)!=0){if(iDec==0)t+=dec;while(iL-->iDec)t+="0";}
		if(foc)return v?(m+t):t;
		var g0=(this.groups.length>0)?this.groups[0]:0;
		var ig=0,g=g0;
		while(g>0&&--i>0)if(--g==0)
		{
			t=t.substring(0,i)+this.groupSeparator+t.substring(i);
			g=this.groups[++ig];
			if(g==null||g<1)g=g0;
			else g0=g;
		}
		var txt=v?this.negativePattern:this.positivePattern;
		txt=txt.replace("$",me.symbol);
		return txt.replace("n",t);
	}
	me.setText=function(v){this.sTxt=1;this.setValue(v);this.sTxt=0;}
	me.isMinus=function(k){return k==this.minus.charCodeAt(0)||k == 45||(k==40&&this.negativePattern.indexOf('(')>=0)||k==12540||k==65293||k==65288;}/*japanese "'-","-","("*/
	me.doKey=function(k,c,t,i,sel0,sel1,bad)
	{
		if(bad)
		{
			if(!(k<9||this.isMinus(k)||(k>=48&&k<=57)||k==this.decimalSeparator.charCodeAt(0)))
				ig_cancelEvent(e);
			return;
		}
		if(sel0!=sel1){t=t.substring(0,sel0)+t.substring(sel1);sel1=sel0;i=t.length;}
		/* 7-del,8-back */
		else if(k==7){if(sel1++>=i||i==0)return;}
		else if(k==8){if(sel0--<1)return;}
		if(k<9||this.maxLength==0||this.maxLength>i)
		{
			var dot=k==this.decimalSeparator.charCodeAt(0);
			var ok=(k>47&&k<58)||(sel0==0&&this.isMinus(k))||(dot&&this.decimals>0);
			if(i>0&&sel0==0)if(this.isMinus(t.charCodeAt(0)))ok=false;
			if(k>8&&!ok)return;
			if(dot)if((dot=t.indexOf(this.decimalSeparator))>=0)
			{
				if(dot==sel0||dot==sel0-1)return;
				i--;
				if(dot<sel0)sel0=--sel1;
				t=t.substring(0,dot)+t.substring(dot+1);
			}
			if(k>8&&sel1>=i)t+=c;
			else t=t.substring(0,sel0)+c+t.substring(sel1);
		}
		else k=0;
		this.elem.value=t;
		this.select((k>10)?sel1+1:sel0);
	}
	me.limits=function(v,r)
	{
		if(v==null&&!this.nullable)v=0;
		if(v!=null)
		{
			var n=this.min,x=this.max;
			if(n!=null&&v<=n)return r?x:n;
			if(x!=null&&v>=x)return r?n:x;
		}
		return v;
	}
	me.getNumber=function(){return this.instant(true,true,true);}
	me.setNumber=function(v){this.setValue(v);}
	me.instant=function(num,limit,v)
	{
		v=(this.fcs==2||v)?this.toNum(this.elem.value,limit==true):this.value;
		if(this._vld==1)this.msV(this.toTxt(v,true,null,"-",this.dec_vld));
		return (num||this.mode>0)?v:this.toTxt(v,true);
	}
	me.getValue=function(num){this._ok();this._vld=1;return this.instant(num,true,true);}
	me.setValue=function(v)
	{
		this.text=this.toTxt(this.value=this.toNum(v,true,true),this.fcs==2);
		this.repaint();
		this.select(1000);
		if(this.fix==1)this.old=this.instant(true);
	}
	me.spin=function(v)
	{
		var val=this.toNum(this.elem.value);
		if(val==null)val=0;
		this.fix=0;this.setValue(val+v);this.fix=1;
	}
	me.getRenderedValue=function(v){return this.toTxt(this.toNum(v),false);}
	return me;
}
function igedit_date(elem,id,prop0,prop1)
{
	var me=igedit_mask(elem,id,prop0,prop1);
	me.mask1=me.dMask(me.valI(prop1,3),true);
	me.nullText=me.valI(prop1,4);
	me.century=prop1[5];
	me.yearFix=prop1[6];
	me.str=me.valI(prop1,7).split(",");
	me.getMaxValue=function(){return this.max;}
	me.setMaxValue=function(v){if(v!=null&&v.getTime==null)v=this.toDate(v.toString(),true);this.max=v;}
	me.getMinValue=function(){return this.min;}
	me.setMinValue=function(v){if(v!=null&&v.getTime==null)v=this.toDate(v.toString(),true);this.min=v;}
	me.getAMPM=function(am){var v=this.valI(this.str,am?0:1);return (v.length>0)?v:(am?"AM":"PM");}
	me.setAMPM=function(v,am){return this.str[am?0:1]=v;}
	me.getMonthNameAt=function(i){return this.valI(this.str,2+i%12);}
	me.setMonthNameAt=function(v,i){return this.str[2+i%12]=v;}
	me.getDowNameAt=function(i){return this.valI(this.str,14+i%7);}
	me.setDowNameAt=function(v,i){return this.str[14+i%7]=v;}
	me.setNow=function(){this.setValue(new Date());}
	me.date=new Date();
	me.isNull=false;
	me.d_s=10;
	me.setText=function(v){this.sTxt=1;this.setValue(v,true);this.sTxt=0;}
	/* f:flag of field, d:Date, e:focus, c:fill-up character*/
	me.fieldValue=function(f,d,e,c)
	{
		/* 1-y,2-yy,3-yyyy,4-M,5-MM,6-MMM,7-MMMM,8-d,9-dd */
		/* 10-h,11-hh,12-H,13-HH,14-t,15-tt,16-m,17-mm,18-s,19-ss */
		/* 20-ddd,21-dddd,22-f,23-ff,24-fff,25=ffff,26-fffff,27-ffffff,28-fffffff */
		var v,i=(f&1)*2;
		if(f<4){v=d.getFullYear()+this.yearFix;if(f==3)i=4;else{v%=100;i=(f==2)?2:0;}}
		else if(f<8){this.d_s=2;v=d.getMonth()+1;if(f>5){f=this.getMonthNameAt(v-1);if(f.length>0)return f;}}
		else if(f<10)v=d.getDate();
		else if(f<16)
		{
			v=d.getHours();
			if(f>13)//ampm
			{
				v=this.getAMPM(v<12);
				if((f-=13)==(i=v.length))return v;
				if(i<f)v+=" ";
				return v.substring(0,f);
			}
			if(f<12){v%=12;if(v==0)v=12;}
		}
		else if(f<18)v=d.getMinutes();
		else if(f<20)v=d.getSeconds();
		else if(f<22)return this.getDowNameAt(d.getDay());
		else
		{
			v=d.getMilliseconds();
			var j=i=f-21;
			while(j-->3)v*=10;
			while(j++<2)v=Math.floor(v/10);
		}
		v=""+v;
		if(f<20||f>22)
		{
			f=v.length;
			if(e){if(i==0)i=2;else e=false;}
			if(i>0){if(i<f)v=v.substring(0,i);else while(f++<i)v=(e?c:"0")+v;}
		}
		return v;
	}
	me.limits=function(d,r)
	{
		if(d==null)return d;
		var v=d.getTime(),n=this.min,x=this.max;
		if(n!=null)n=n.getTime();if(x!=null)x=x.getTime();
		if(n!=null&&(v<n||(r&&v==n))){d.setTime(r?x:n);return d;}
		if(x!=null&&(v>x||(r&&v==x))){d.setTime(r?n:x);return d;}
		return null;
	}
	me.toDate=function(t,foc,limit,fire)
	{
		var fields=(foc&&fire)?this.fields0(t):this.fields1(t,foc);
		/* n: 3-ymd,8-invalid,16-limit,32-lastGood */
		var v,i0,n=0,i=-1,j=-1,iLen=fields.length,c,y=-1,mo=-1,day=-1,h=-2,m=-2,s=-2,ms=-2,pm=-1;
		var any=false,arg=new Object();
		while(++i<iLen)
		{
			j++;v=fields[i];i0=foc?this.field0IDs[i]:this.field1IDs[i];
			if(i0<4){if(v>100&&v>this.yearFix)v-=this.yearFix;if((arg.year=y=v)<0)n|=8;else{n++;c=this.century;if(v<100){if(i0<3&&c<0)c=29;if(c>=0)y+=(v>c)?1900:2000;}}}
			else if(i0<8){arg.month=mo=v;if(v<1||v>12)n|=8;else n++;}
			else if(i0<10){arg.day=day=v;if(v<1||v>31)n|=8;else n++;}
			else if(i0<14)
			{
				if(v==24)v=0;
				if(i0>11)pm=-4;else{if(v==12)v=0;if(v>12)n|=8;}
				arg.hours=h=v;if(v>23||v<0)n|=8;
			}
			else if(i0<16){j--;if(v>0)pm++;continue;}
			else if(i0<18){arg.minutes=m=v;if(v>59||v<0)n|=8;}
			else if(i0<20){arg.seconds=s=v;if(v>59||v<0)n|=8;}
			else if(i0<22){j--;continue;}
			else{while(i0++<24)v*=10;while(i0-->25)v=Math.floor(v/10);arg.milliseconds=ms=v;if(v>999||v<0)n|=8;}
			if(v>=0)any=true;
			if(j<this.minF&&n>7)n|=32;
		}
		if(pm==0&&h>=0&&h<12)arg.hours=(h+=12);
		var inv=fire?(":"+y+","+mo+","+day+","+h+","+m+","+s+","+ms+","):"";
		var d=null;
		if((n&3)==3){d=new Date(y,mo-1,day);if(y<100)d.setFullYear(y);}
		else if(n<30)
		{
			d=new Date();if(this.date)d.setTime(this.date.getTime());
			if(day>0)d.setDate(day);if(y>=0)d.setFullYear(y);if(mo>0)d.setMonth(mo-1);
		}
		n&=15;
		if(day>0&&d!=null)if(day!=d.getDate())n|=8;
		day=this.good;
		if(fire&&d==null&&!this.nullable)
		{
			d=day;
			if(d==null||d.getTime==null){d=new Date();n|=8;}else n|=32;
		}
		if(d!=null)
		{
			if(h>-2)d.setHours((h<0)?0:h);if(m>-2)d.setMinutes((m<0)?0:m);
			if(s>-2)d.setSeconds((s<0)?0:s);if(ms>-2)d.setMilliseconds((ms<0)?0:ms);
			if(limit){if((d=this.limits(i=d))!=null)n=16;else d=i;}
		}
		if(fire)
		{
			if(any&&d==null&&t.length>0&&day!=null&&day.getTime!=null){d=day;n=32;}
			arg.date=d;
			if(n<8||(n==8&&!any&&this.nullable))inv="";
			else
			{
				inv+=(arg.type=(n<16)?2:((n==16)?1:0));
				if(this.fireEvent(13,null,arg))inv="";
				d=arg.date;
			}
			this.updatePost(d,inv);
			if(day!=false)this.good=d;
		}
		return d;
	}
	me.updatePost=function(d,inv)
	{
		if(d!=null)inv=""+d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+"-"+d.getHours()+"-"+d.getMinutes()+"-"+d.getSeconds()+"-"+d.getMilliseconds()+inv;
		this._vs=this.elemViewState.value=inv;
		this.valid((d==null)?"":this.toTxt(d,true,""));
	}
	me.enter0=function()
	{
		var d=this.toDate(this.elem.value,true);
		return (d==null)?"":this.toTxt(d,true,"");
	}
	me.toTxt=function(d,foc,prompt,txt)
	{
		var t="",mask=foc?this.mask:this.mask1;
		if(d==null)return foc?this.getTxt(5,prompt,txt?(this.txt=mask):mask):this.nullText;
		var ids=foc?this.field0IDs:this.field1IDs;
		var c,k,i=-1,f0=0;
		this.d_s=6;/* seconds */
		while(++i<mask.length)
		{
			c=mask.charAt(i);
			if((k=mask.charCodeAt(i))<21)
			{
				t+=this.fieldValue(ids[f0++],d,foc,c);
				if(foc)while(i+1<mask.length)if(mask.charCodeAt(i+1)==k)i++;else break;
			}
			else t+=c;
		}
		if(!foc)return t;
		if(txt)this.txt=t;
		return this.getTxt(5,prompt,t);
	}
	me.focusTxt=function(foc,e,t)
	{
		var d=null,prompt="";
		if(t==null)
		{
			prompt=this.promptChar;
			/* key-press */
			if(e==null&&foc)return this.getTxt(5,prompt);
			if(e!=null&&!foc)
			{
				/* ""-from update=lostFocus */
				d=this.toDate(this.elem.value,e==="",true,this.fcs>=0);
				if(!(this.isNull=(d==null)))this.date=d;
			}
			else if(!this.isNull)d=this.date;
		}
		else d=this.toDate(t,foc,true);
		return this.toTxt(d,foc,prompt,e!=null);
	}
	me.fields1=function(t,foc)
	{
		var ids=foc?this.field0IDs:this.field1IDs;
		var iLen=ids.length;
		var j,i=-1,v=-1,field=0,fields=new Array(iLen);
		while(++i<iLen)fields[i]=-1;
		if(t==null)return fields;
		t=t.toUpperCase();
		i=-1;
		while(++i<t.length&&field<iLen)
		{
			var k=this.jpn(t.charCodeAt(i))-48,j=ids[field];
			if(j==20||j==21)j=ids[++field];//dow
			if(j==14||j==15)//ampm
			{
				if(k>=0&&k<=9){v=-1;field++;i--;continue;}
				if(this.getAMPM(false).charAt(0).toUpperCase()==t.charAt(i))
				{fields[field++]=1;v=-1;}
			}
			else
			{
				if(k>=0&&k<=9){if(v<0)v=k;else v=v*10+k;}
				else
				{
					if(v>=0){fields[field++]=v;v=-1;}
					else if(j==6||j==7)while(v-->-3)//MMM
					{
						for(k=0;k<12;k++)
						{
							var m=this.getMonthNameAt(k).toUpperCase();
							if((j=m.length)<1)continue;
							if(v==-3){if(j<4)continue;m=m.substring(0,3);}
							if((j=t.indexOf(m)-1)>-2)if(j<0||t.charAt(j).toLowerCase()==t.charAt(j))break;
						}
						if(k<12){fields[field++]=k+1;break;}
					}
				}
			}
		}
		if(field<iLen)fields[field]=v;
		return fields;
	}
	me.fields0=function(t)
	{
		var fields=new Array();
		if(t==null)t="";
		var x,k,j=-1,i=-1,v=-1,field=-1,n=22,m=this.mask;
		while(++i<m.length)
		{
			j++;
			if((x=m.charCodeAt(i))>21&&n>21)continue;
			if(x>21){if(field>=0)fields[field]=v;}
			else
			{
				if(n>21){v=-1;field++;}
				if(j<t.length)if(x>18)
				{
					k=this.jpn(t.charCodeAt(j))-48;
					if(k>=0&&k<=9){if(v<0)v=k;else v=v*10+k;}
					else if(i+1<m.length&&t.charAt(j)==m.charAt(i+1))j--;
				}
				else if(n!=x)if(this.getAMPM(false).charAt(0).toUpperCase()==t.charAt(j).toUpperCase())
					v=1;
			}
			n=x;
		}
		fields[field]=v;
		return fields;
	}
	me.curField=function(s,mask)
	{
		var x,n=22,field=this.n0=this.n1=-1;
		for(var i=0;i<mask.length;i++)
		{
			if(((x=mask.charCodeAt(i))>21)==(n>21))continue;
			if(x>21){if(i>=s)break;}
			else{this.n0=i;field++;}
			n=x;
		}
		if(this.n0>=0)this.n1=i;
		if((field=this.field0IDs[field])==null)return -1;
		if(field<8)return (field<4)?0:1;
		if(field<20)return Math.floor((field-4)/2);
		return (field>21)?8:-1;
	}
	me.key=function(k,c,t,i,s,mask)
	{
		var n=0,v=-1,field=this.curField(s,mask);
		if(s>=this.n1)if(t.charCodeAt(--s)>21)return this.key(k,c,t,i,s+2,mask);
		if(field<0)return -1;
		if(field==5)//ampm
		{
			if(s<=this.n0)
			{
				v=this.getAMPM(false);
				if(v.charAt(0).toUpperCase()!=c.toUpperCase())v=this.getAMPM(true);
				if(this.n1==this.n0+1)v=v.charAt(0);
				else if((i=v.length)<2)v+=" ";else if(i>2)v=v.substring(0,2);
				this.txt=t.substring(0,this.n0)+v+t.substring(this.n1);
			}
			return this.n1;
		}
		if(k<48||k>57)
		{
			if(s==0||(k!=47&&k!=58&&(k<44||k>57)))return -1;
			if(mask.charCodeAt(s-1)>=21||this.n1==i)return s;
			while(s<i)
			{
				if(mask.charCodeAt(s++)>=21)break;
				t=t.substring(0,s-1)+mask.charAt(s-1)+t.substring(s);
			}
			this.txt=t;
			return s;
		}
		k-=48;
		if(this.n0==s)
		{
			v=t.charCodeAt(s+1)-48;
			/* 0-y,1-M,2-d,3-h,4-H,5-AMPM,6-m,7-s,8-ms */
			switch(field)
			{
				case 4:k--;v-=2;
				case 3:case 1:if(k>1)n=1;else if(k==1&&v>2)n=2;break;
				case 2:if(k>3)n=1;else if(k==3&&v>1)n=2;break;
				case 6:case 7:if(k>6)n=1;else if(k==6&&v>0)n=2;break;
				default:break;
			}
		}
		if(this.n0+1==s)
		{
			v=t.charCodeAt(s-1)-48;
			switch(field)
			{
				case 4:v--;k-=2;
				case 3:case 1:if(v>1||(v==1&&k>2))n=3;break;
				case 2:if(v>3||(v==3&&k>1))n=3;break;
				case 6:case 7:if(v>6||(v==6&&k>0))n=3;break;
				default:break;
			}
		}
		if(n==1){t=t.substring(0,s)+mask.charAt(s)+t.substring(s+1);s++;}
		if(n==2)t=t.substring(0,s+1)+mask.charAt(s+1)+t.substring(s+2);
		if(n==3)
		{
			while(++s<i)if(mask.charCodeAt(s)<21)break;
			if(s>=i)return -1;
			return this.key(k+48,c,t,i,s,mask);
		}
		this.txt=t.substring(0,s)+c+t.substring(s+1);
		return ++s;
	}
	me.spin=function(v)
	{
		var x,i=this.spinF,d=new Date();
		d.setTime(this.date.getTime());
		if(i<0||i>8)
		{
			if(this.fcs==2)
			{
				this.getSelectedText();
				i=this.curField(this.sel0,this.mask);
				if((d=this.toDate(this.elem.value,true,true,this.fcs>=0))==null)d=new Date();
				this.spinF=i;
			}
			else this.spinF=i=this.d_s;
		}
		/* 0-y,1-M,2-d,3-h,4-H,5-AMPM,6-m,7-s,8-ms */
		if(i==5)v=(v>0)?12:-12;
		x=this.spinOnlyOneField;
		switch(i)
		{
			case 0:d.setFullYear(v+=d.getFullYear());if(x&&v!=d.getFullYear())i=-1;break;
			case 1:d.setMonth(v+=d.getMonth());if(x&&v!=d.getMonth())i=-1;break;
			case 2:d.setDate(v+=d.getDate());if(x&&v!=d.getDate())i=-1;break;
			case 3:case 4:case 5:i=d.getDate();d.setHours(v+=d.getHours());if(x&&i!=d.getDate())i=-1;break;
			case 6:d.setMinutes(v+=d.getMinutes());if(x&&v!=d.getMinutes())i=-1;break;
			case 7:d.setSeconds(v+=d.getSeconds());if(x&&v!=d.getSeconds())i=-1;break;
			case 8:for(i=this.n1-this.n0;i++<3;)v*=10;
				d.setMilliseconds(v+=d.getMilliseconds());if(x&&v!=d.getMilliseconds())i=-1;break;
		}
		if(i<0)return;
		if((v=this.limits(d))!=null)d=v;
		this.text=this.toTxt(d,this.fcs==2,this.promptChar,true);
		this.date=d;this.isNull=false;
		this.updatePost(d,"");
		this.repaint();this.select(this.sel0);
		if(this.fcs==2)this._last=this.elem.value;
	}
	me.getDate=function(){return this.instant(true);}
	me.setDate=function(v){this.setValue(v);}
	me.getValueByMode=function(vt,limit)
	{
		this._ok();
		var d=(this.fcs<2)?(this.isNull?null:this.date):this.toDate(this.elem.value,true,limit);
		if(this._vld==1)this.msV(d?this.toTxt(d,true,""):"");
		if(vt==0)return d;
		return this.toTxt(d,vt==1,this.emptyChar);
	}
	me.instant=function(date,limit){return this.getValueByMode(date?0:this.mode,limit==true);}
	me.date_7=function(v)
	{
		if(v.length<10)return null;
		var y,o=v.split("-");
		if(o.length<7)return null;
		v=this.intI(o,1);
		if(v>0&&this._0==1)v--;
		v=new Date(y=this.intI(o,0),v,this.intI(o,2),this.intI(o,3),this.intI(o,4),this.intI(o,5),this.intI(o,6));
		if(y<100)v.setFullYear(y);
		return v;
	}
	me.getValue=function(date){this._ok();this._vld=1;return this.instant(date,true);}
	me.setValue=function(v,o)
	{
		if(v!=null&&v.getTime==null)
		{
			if(this.fcs<0)
			{
				if(v.length<8)v="";
				o=v.split(",");
				if(o.length>2)this.max=this.date_7(o[2]);
				if(o.length>1)this.min=this.date_7(o[1]);
				v=this.date_7(o[0]);
			}
			else v=this.toDate(v.toString(),this.mode<2&&o!=true);
		}
		o=v;
		if((v=this.limits(v))==null)v=o;
		this.txt=this.mask;
		if(this.isNull=(v==null))v=new Date();
		else this.toTxt(v,true,"",true);
		this.date=v;
		if(this.good!=false)this.good=v;
		this.text=this.focusTxt(this.fcs>1);
		this.updatePost(this.isNull?null:v,"");
		this.repaint();
		if(this.fix==1)this.old=this.instant(true);
	}
	me.getRenderedValue=function(v)
	{
		if(v!=null&&v.getTime==null)v=this.toDate(v.toString(),false);
		return this.toTxt(v,false,"");
	}
	return me;
}
function igedit_mask(elem,id,prop0,prop1)
{
	var me=new igedit_new(elem,id,prop0);
	prop1[0]=ig_csom.replace(prop1[0],'~^+=','\03');/* Atlas chocks on \03,- restore server-flag */
	var prop=me.valI(prop1,2);
	me.promptChar=prop.charAt(0);
	me.padChar=prop.charAt(1);
	me.emptyChar=prop.charAt(2);
	me.mode=parseInt(prop.charAt(3));
	me.minF=parseInt(prop.charAt(4));
	me.good=prop.length>5;
	me.flag=function(c,u)
	{
		switch(c)
		{
			case '>':return -1;case '<':return -2;
			case '&':c=1;break;case 'C':c=2;break;
			case 'A':c=7;break;case 'a':c=8;break;
			case 'L':c=13;break;case '?':c=14;break;
			case '#':case '0':return 19;
			case '9':return 20;
			default:return 0;
		}
		return c+u*2;
	}
	me.filter=function(flag,s,i,sf)
	{
		if(i>=s.length)return sf;
		var c=s.charCodeAt(i),f=Math.floor((flag-1)/6);
		s=s.charAt(i);
		if(c<21)return sf;
		if(f==1||f==3)if(c>100)if((c=this.jpn(c))<100)s=String.fromCharCode(c);
		switch(f)
		{
			case 0:break;
			case 1:if(c>47&&c<58)return s;
			case 2:if(c>255||s.toUpperCase()!=s.toLowerCase())break;return sf;
			case 3:return (c>47&&c<58)?s:sf;
		}
		if((flag=Math.floor((flag-1)/2)%3)==0)return s;
		return (flag==2)?s.toLowerCase():s.toUpperCase();
	}
	me.getTxt=function(vt,prompt,t)
	{
		var flag,mask=this.mask,o="",non=(t!=null);
		if(!non)t=(this.bad!=0&&this.fcs>1)?this.elem.value:this.txt;
		if(non||this.fcs<0)non=this.minF==0;
		if(t==null||mask==null)return o;
		for(var i=0;i<mask.length;i++)if((flag=mask.charCodeAt(i))<21)
		{
			if(i<t.length&&t.charCodeAt(i)>=21){o+=t.charAt(i);non=false;}
			else if(vt%3==2||(vt%3==1&&(flag&1)==1))o+=prompt;
		}
		else if(vt>=3)o+=mask.charAt(i);
		return non?"":o;
	}
	me.setTxt=function(v,vt,render)
	{
		var c,flag,j=0,i=-1,mask=this.mask,t=this.mask;
		if(v!=null)while(++i<mask.length)
		{
			if(vt==1000+j)vt=this.mode;
			if(j>=v.length)break;
			if((flag=mask.charCodeAt(i))<21)
			{
				if((c=this.filter(mask.charCodeAt(i),v,j))!=null)t=t.substring(0,i)+c+t.substring(i+1);
				j++;
			}
			else if(vt>=3)j++;
		}
		if(render)return t;
		this.txt=t;
		this.text=this.focusTxt(this.fcs>1," ");
		this.repaint();
	}
	me.getInputMask=function(){return this.m0;}
	me.setInputMask=function(mask)
	{
		if(mask==null)mask="";
		this.m0=mask;
		var x,c,i,i0=0,u=0,n="",t="",t0=this.getTxt(0);
		for(i=0;i<mask.length;i++)
		{
			if((x=this.flag(c=mask.charAt(i),u))!=0)
			{
				if(x<0){u=(u==-x)?0:-x;continue;}
				n+=(c=String.fromCharCode(x));
				c=this.filter(x,t0,i0++,c);
			}
			else if(c=="\\"&&i+1<mask.length&&this.flag(mask.charAt(i+1),0)!=0)
				n+=(c=mask.charAt(++i));
			else n+=c;
			t+=c;
		}
		this.txt=t;this.mask=n;
	}
	me.dMask=function(v,d)
	{
		if(this.field0IDs==null)this.field0IDs=new Array();
		if(this.field1IDs==null)this.field1IDs=new Array();
		if(v==null)v="";
		var x,i,i0=0,flag=-1,t="";
		for(i=0;i<v.length;i++)
		{
			x=v.charCodeAt(i);
			if(x<48||x>57)
			{
				if(d==true&&(flag=v.charAt(i))=="\\"&&i+1<v.length)
				{
					if((x=v.charAt(++i))=="\\")continue;
					if(x=="0"||x=="9")t+=flag;
					t+=x;
				}
				else t+=v.charAt(i);
				continue;
			}
			flag=(x-48)*10+v.charCodeAt(++i)-48;
			if(d==true){this.field1IDs[i0++]=flag;t+="\01";continue;}
			this.field0IDs[i0++]=flag;
			if(flag==14)t+="L";else if(flag==15)t+="LL";
			else if(flag==22)t+="#";
			else{t+="##";if(flag==3)t+="##";while(flag-->23)t+="#";}
		}
		return t;
	}
	prop=me.valI(prop1,1);
	if(prop1.length>3)prop=me.dMask(prop);
	me.setInputMask(prop);
	me.focusTxt=function(foc,e)
	{
		var t=null;
		if(e!=null&&!foc)
		{
			e=e!=="";
			if(e&&this.bad!=0)this.txt=this.setTxt(this.elem.value,5,true);
			t=this.txt;
			var inv=t.length;
			if(!e&&this.hadFocus)
			{
				var iL=inv-this.elem.value.length,s0=this.sel0,s1=this.sel1;
				if(iL>0&&s1-s0==iL)
					this.txt=t=t.substring(0,s0)+this.mask.substring(s0,s1)+t.substring(s1);
			}
			while(inv-->0)
			{
				var c=t.charCodeAt(inv);
				if(c<21&&(c&1)==1)break;
			}
			if(!e&&inv>=0)if(this.fireEvent(13))inv=-1;
			/* BR29103. Get around following bug in IE7: when input.value is set to [013] or [010] char, then it replaces it by 2 chars [013][010]. */
			/* That nice new feature kills architecture of mask, when it contains L or > flag. */
			/* So, below logic replaces 13 or 10 by 14. */
			/* Logic on server ignores flags in postback mask, so, replacing 13 or 10 by any other 1..28 flag should not bring problem. */
			this._vs=this.elemViewState.value=ig_csom.replace(ig_csom.replace(t=this.txt,String.fromCharCode(13),String.fromCharCode(14)),String.fromCharCode(10),String.fromCharCode(14))+((inv<0)?"":String.fromCharCode(30));
			this.valid(this.getTxt(this.mode,""));
		}
		return this.getTxt(foc?5:4,foc?this.promptChar:this.padChar,t);
	}
	me.enter0=function(){return this.getTxt(this.mode,"");}
	me.setText=function(v,s){this.sTxt=1;this.setTxt(v,(s==null)?5:(1000+s));this.sTxt=0;if(this.fix==1)this.old=this.instant(true);}
	me.key=function(k,c,t,i,s,mask){return -2;}
	me.doKey=function(k,c,t,i,sel0,sel1,bad)
	{
		if(i<1||k<7||(k>8&&k<32))k=0;
		if(bad)
		{
			if(k==0||(this.getAMPM!=null&&!(this.mask.indexOf(c)>0||this.getAMPM(false).indexOf(c)>=0||this.getAMPM(true).indexOf(c)>=0||(k>=48&&k<=57))))
				ig_cancelEvent(e);
			return;
		}
		if(k==0)return;
		t=this.txt;
		var mask=this.mask;
		if(sel0!=sel1){while(--sel1>=sel0)t=t.substring(0,sel1)+mask.charAt(sel1)+t.substring(sel1+1);sel1++;}
		else if(k==7)//del
		{
			while(sel1<i&&mask.charCodeAt(sel1)>=21)sel1++;
			if(sel1>=i)return;
			t=t.substring(0,sel1)+mask.charAt(sel1)+t.substring(sel1+1);
			sel1++;
		}
		else if(k==8)//back
		{
			while(sel1>0&&mask.charCodeAt(sel1-1)>=21)sel1--;
			if(sel1--<1)return;
			t=t.substring(0,sel1)+mask.charAt(sel1)+t.substring(sel1+1);
		}
		if(k>8&&sel1<i)
		{
			if(sel1>=i)return;
			if((sel0=this.key(k,c,t,i,sel1,mask))>=0){t=this.txt;sel1=sel0;}
			else{if(sel0==-1)return;while(mask.charCodeAt(sel1)>=21)if(++sel1>=i)return;}
			if(sel0>=0){t=this.txt;sel1=sel0;}
			else
			{
				if((c=this.filter(mask.charCodeAt(sel1),c,0))==null)return;
				t=t.substring(0,sel1)+c+t.substring(sel1+1);
				sel1++;
			}
		}
		this.txt=t;
		this.elem.value=this.focusTxt(true);
		this.select(sel1);
	}
	me.getValueByMode=function(vt,v){return this.getTxt(vt,v?"":this.emptyChar);}
	me.instant=function(v){return this.getValueByMode(this.mode,v);}
	me.getValue=function(){this._ok();this.msV(this.getTxt(this.mode,""));return this.instant();}
	me.setValue=function(v){this.setTxt(v,(this.fcs<0)?2:this.mode);if(this.fix==1)this.old=this.instant(true);}
	me.getRenderedValue=function(v)
	{
		v=(v==null)?"":v.toString();
		return this.getTxt(4,this.padChar,(this.mode==5)?v:this.setTxt(v,this.mode,true));
	}
	return me;
}
function igedit_new(elem,id,prop0)
{
	this.fcs=-1;
	this.valI=function(o,i){o=(o==null||o.length<=i)?null:o[i];return (o==null)?"":o;}
	this.intI=function(o,i){return ig_csom.isEmpty(o=this.valI(o,i))?-1:parseInt(o);}
	this._lsnr=function(e,n){if(e&&!e._old)ig_csom.addEventListener(e,n,igedit_event);}
	this.initButElem=function(e,c,o)
	{
		if(e==null)return;
		var i=-1,n=e.nodeName=="IMG";
		if(n||e.nodeName=="TD")if(c==null)
		{
			if(o&&n)o.imgE=e;
			this._lsnr(e,"mousedown");this._lsnr(e,"mouseup");this._lsnr(e,"mousemove");this._lsnr(e,"mouseout");
			e._old=true;
			e.unselectable="on";
		}
		else if(!ig_csom.isEmpty(e.bgColor)){e.bgColor=c;e.style.color=c;}
		if(!n)if((n=e.childNodes)!=null)while(++i<n.length)this.initButElem(n[i],c,o);
	}
	this.focusTxt=function(foc,e)
	{
		if(e!=null&&!foc)this.valid(this._vs=this.elemViewState.value=this.elem.value);
		return this.elem.value;
	}
	this._fixSel=(ig_shared.IsOpera||ig_shared.IsSafari)?2:((ig_shared.IsNetscape||ig_shared.IsFireFox)?1:0);
	this.elemID=-10;
	this.bad=0;
	this.Element=this._element=elem;
	elem.Object=this;
	this.eventID=function(s)
	{
		switch(s.toLowerCase())
		{
			case "keydown":return 0;
			case "keypress":return 1;
			case "keyup":return 2;
			case "mousedown":return 3;
			case "mouseup":return 4;
			case "mousemove":return 5;
			case "mouseover":return 6;
			case "mouseout":return 7;
			case "focus":return 8;
			case "blur":return 9;
			case "initialize":return 10;
			case "valuechange":return 11;
			case "textchanged":return 12;
			case "invalidvalue":return 13;
			case "custombutton":return 14;
			case "spin": return 15;
		}
		return -1;
	}
	this.events=new Array(16);
	this.evtH=function(n,fRef,add,o,s)
	{
		if(n<0||n>15)return;
		var e=this.events[n];
		if(e==null){if(add)e=this.events[n]=new Array();else return;}
		for(n=0;n<e.length;n++)if(e[n]!=null&&e[n].fRef==fRef)
		{if(!add){delete e[n];e[n]=null;}return;}
		if(add)for(n=0;n<=e.length;n++)if(e[n]==null)
		{e[n]={fRef:fRef,o:o,s:s};break;}
	}
	this.removeEventListener=function(name,fref){this.evtH(this.eventID(name),fref,false);}
	this.addEventListener=function(name,fref,o){this.evtH(this.eventID(name),fref,true,o);}
	this.getRenderedValue=function(v){return (v==null)?"":v.toString();}
	var n,o,ii,j,i=0,e=document.getElementById(id+"_p");
	if(e==null)e=new Object();
	e.value='\t';
	this.elemViewState=e;
	if((e=document.getElementById(id))==null)if((e=document.getElementById(id.substring(1)))==null)e=new Object();
	this.elemValue=e;
	this.uniqueId=prop0[i++];
	e=prop0[i++];
	if(e.length>2)
	{
		e=e.split(" ");
		for(j=0;j<e.length-1;j+=2)
		{
			o=this.intI(e,j);
			n=ig_csom.replace(this.valI(e,j+1),'&quot;','\"');
			n=ig_csom.replace(ig_csom.replace(n,'&coma;',','),'&nbsp;',' ');
			if(o==99)this._dt=n;else if(o==98)this._null=n;
			else if(ig_csom.isName(n))try{this.evtH(o,eval(n),true);}catch(o){}
			else this.evtH(o,n,true,null,true);
		}
	}
	this.nullable=!ig_csom.isEmpty(prop0[i++]);
	this.postValue=!ig_csom.isEmpty(prop0[i++]);
	this.postButton=!ig_csom.isEmpty(prop0[i++]);
	this.postEnter=!ig_csom.isEmpty(prop0[i++]);
	this.maxLength=this.intI(prop0,i++);
	this.spinDelta=ig_csom.isEmpty(o=this.valI(prop0,i++))?1:parseFloat(o);
	this.spinOnArrows=!ig_csom.isEmpty(prop0[i++]);
	this.spinOnlyOneField=!ig_csom.isEmpty(prop0[i++]);
	this.hideEnter=!ig_csom.isEmpty(prop0[i++]);
	this.selectionOnFocus=this.intI(prop0,i++)-1;
	this._flag=this.intI(prop0,i++);/* 1:AllowAltPlusDigits, 2:focus, 4:readOnly */
	this.roll=!ig_csom.isEmpty(prop0[i++]);
	this.css=this.intI(prop0,i++);
	this.repaint=function(){if(this.elem.value==this.text)return;this.elem.value=this.text;}
	if((e=document.getElementById(id+"_t"))==null)e=elem;
	if((this._flag&4)==0)e.readOnly=false;
	this.elem=e;
	if(!igedit_all._end){igedit_all._end=true;this._lsnr(window,"load");this._lsnr(window,"unload");this._lsnr(e.form,"submit");}
	o=e.parentNode;ii=o.childNodes;n=ii.length-1;
	while(n-->0)if(ii[n]==e)break;
	n=(n<0)?null:ii[n+1];
	o.removeChild(e);
	this._lsnr(e,"keydown");this._lsnr(e,"keypress");this._lsnr(e,"keyup");
	this._lsnr(e,"focus");this._lsnr(e,"blur");
	this._lsnr(e,"mousedown");this._lsnr(e,"mouseup");
	this._lsnr(e,"mousemove");this._lsnr(e,"mouseover");this._lsnr(e,"mouseout");
	e._old=true;
	if(n)o.insertBefore(e,n);else o.appendChild(e);
	this.ID=id;
	if(id.indexOf("x_")==0)this.ID_=id.substring(1);
	e.setAttribute("editID",id);
	this.k0=this.sel0=this._wh=0;
	this.getEnabled=function(){return !this.elem.disabled;}
	this.setEnabled=function(v)
	{
		if(this.elem.disabled==!v)return;this.elem.disabled=!v;
		for(var i=0;i<3;i++)this.butState(i,v?0:3);
	}
	if(this.css>=0)
	{
		this.butP=-1;
		this.buttons=new Array(3);
		for(j=0;j<3;j++)
		{
			if((e=document.getElementById(id+"_b"+j))==null)i+=4;
			else
			{
				o={elem:e,img:new Array(4)};
				this.initButElem(e,null,o);
				e.setAttribute("editID",id+","+j);
				for(ii=0;ii<4;ii++)o.img[ii]=this.valI(prop0,i++);
				o.state=this.getEnabled()?0:3;this.buttons[j]=o;
			}
		}
		ii=1;
		if((o=this.intI(prop0,i++))<0)ii=8;
		else{while(o++<3)ii/=2;while(o-->4)ii*=2;}
		this.spinSpeedUp=ii;
		this.spinOnReadOnly=!ig_csom.isEmpty(prop0[i++]);
		this.spinDelay=this.intI(prop0,i++);
		this.spinFocus=!ig_csom.isEmpty(prop0[i++]);
		this.ccss=new Array(4);
		for(ii=0;ii<4;ii++){o=this.valI(prop0,i++);if(ii>0)o=this.ccss[0]+((o.length>0)?(" "+o):"");this.ccss[ii]=o;}
		this._wh=this.intI(prop0,i++);
	}
	this.getVisible=function(){return this.Element.style.display!="none";}
	this.setVisible=function(v,x,y,w,h)
	{
		var d,h0=h,e0=this.Element,e1=this.elem,hd=this.hd;
		if(!v&&this.fcs>0)e1.blur();
		var s0=e0.style,s1=e1.style,td=(e0==e1)?e0:e1.parentNode;
		s0.display=v?"":"none";
		s0.visibility=v?"visible":"hidden";
		if(!v)return;
		if(hd==null)
		{
			hd=e0.offsetHeight;d=e1.offsetHeight;
			if(!hd||hd<5||!d||d<5)hd=0;
			else if((hd-=d)<0)hd=0;
			if(hd>5)hd-=2;else if(hd>3)hd--;
			this.hd=hd;
			this._bw=(e0==e1)?0:(e0.offsetWidth-td.offsetWidth+1);
			if(this._bw<0)this._bw=0;
		}
		if(x!=null){s0.position="absolute";s0.left=x+"px";s0.top=y+"px";}
		if(w!=null)
		{
			s0.width=w+"px";s1.width=(w-this._bw)+"px";
			x=w+w+2-e0.offsetWidth;
			if(x>10&&x<w){s0.width=x+"px";s1.width=(x-this._bw)+"px";}
		}
		if(h!=null)
		{
			s0.height=h+"px";
			s1.height=(h-=hd)+"px";
			if(this.buttons)
			{
				td.style.height="";
				d=this.buttons[0];x=this.buttons[1];y=this.buttons[2];
				if(d&&(d=d.elem)!=null)d.style.height=h+"px";
				if(x&&(x=x.elem)!=null)
				{
					try{h-=parseInt(e0.cellSpacing);}catch(ex){}
					y=y.elem;
					x.style.height=(d=Math.floor(h/2))+"px";
					y.style.height=d+"px";
					if(e0.offsetHeight>h0)
					{
						x.style.height=(d=Math.floor(--h/2))+"px";
						y.style.height=d+"px";
						if(td.offsetHeight>h+1)td.style.height=h+"px";
						if(e1.offsetHeight>h+1)s1.height=h+"px";
					}
				}
			}
			else
			{
				x=h+h+2-e0.offsetHeight;
				if(x>10&&x<h)s0.height=x+"px";
			}
		}
		if(v)this.focus();
	}
	this.getReadOnly=function(){return this.elem.readOnly;}
	this.setReadOnly=function(v){this.elem.readOnly=v;}
	this.getText=function(){var v=this.elem.value;this.msV(v);return v;}
	this.setText=function(v){this.elemValue.value=this._vs=this.elemViewState.value=this.text=v;this.repaint();if(this.fix==1)this.old=this.instant(true);}
	this.instant=function(){return this.getText();}
	this.getValue=function(){this._ok();return this.instant();}
	this.setValue=function(v){this.setText(""+((v==null)?"":v));}
	this.spinF=-1;
	this.spin_=function(v)
	{
		if(this.fireEvent(15,null,v))return;
		var t=this.elem.value;
		this.spin(v);
		if(this.elem.value==t&&this.roll&&this.min!=null&&this.max!=null)
		{
			v=this.sel0;
			this.setValue(this.limits(this.getValue(true),true));
			this.select(v);
		}
		if(this.elem.value!=t){this._spinPost=this.postValue;this.fireEvent(12,null);this._spinPost=false;}
	}
	this.spin=function(v){}
	this.doKey=function(k,c,t,i,sel0,sel1)
	{
		if(sel0!=sel1){t=t.substring(0,sel0)+t.substring(sel1);sel1=sel0;i=t.length;}
		/* 7-del,8-back */
		else if(k==7){if(sel1++>=i||i==0)return;}
		else if(k==8){if(sel0--<1)return;}
		if(k<9||this.maxLength==0||this.maxLength>i)
		{
			if(k>8&&sel1>=i)t+=c;
			else t=t.substring(0,sel0)+c+t.substring(sel1);
		}
		else k=0;
		this.elem.value=t;
		this.select((k>10)?sel1+1:sel0);
	}
	this.doKey0=function(e,a)
	{
		var t0=this.text,t1=this.elem.value,k=this._gridKey;if(!k)k=e.keyCode;
		if(a!=1)this._np=2-a;else if(this._np!=2)this._np=1;
		if(this.fcs!=2||(k==114&&a!=1)||k==9){if(k==9)this.k0=(a==2)?0:9;return;}
		if(k==0||k==null)if((k=e.which)==null)return;
		if(this.bad>2){if(a==0)this.bad=2;if(a==2)this.bad-=3;}
		if(a==0&&k==229)if(t0!=t1)this.bad=2;else this.bad+=3;
		if(k==13&&this.k0==229&&this.flag)this.txt=this.setTxt(this.elem.value,5,true);
		if(this.bad==2||(a==1&&e.ctrlKey))return;
		if(a!=1&&(e.ctrlKey||e.altKey||k==17))
		{
			if(e.altKey)this.k0=-1;
			else if(t0!=t1&&(k==86||(k==17&&a==2))){this.paste(t1);this._np=1;}
			else if(k==17)this.getSelectedText();
			if(a==0&&(k==38||k==40))this.doBut(e,a,0);
			return;
		}
		if(a==0)this.k0=k;
		if(a==2){if(this.k0>0)this.k0=0;this.spinF=-1;}
		var i=t1.length,bad=this.bad!=0;
		if(k<=46)
		{
			switch(k)
			{
				case 8:case 46:/* back del */
					if(this.k0==k&&a==1)a=2;
					if(a==0){a=1;if(k==46)k=7;}
					break;
				case 27:ig_cancelEvent(e);return;
				case 13:/* enter */
					if(this.hideEnter)ig_cancelEvent(e);
					else if(a==0){this.valid(this.enter0());this.update();}
					if(this.postEnter&&a==0){ig_cancelEvent(e);try{window.setTimeout("try{igedit_all['"+this.ID+"'].doPost(2);}catch(e){}",0);}catch(ex){}}
					return;
				case 38:case 40:/* up down */
					if(a==0&&this.spinOnArrows&&!e.shiftKey)this.spin_((k==38)?this.spinDelta:-this.spinDelta);
					if(this.k0==k)a=2;
					break;
			}
		}
		if(a==1&&k==this.k0&&((k<48&&k>9&&k!=32)||k>90))return;
		if(!bad)
		{
			if(a!=0&&k!=9)ig_cancelEvent(e);
			if(a==1&&this.k0==-1){this.k0=0;if((this._flag&1)!=0)this.getSelectedText();else return;}
			if(a==0||k<9)this.getSelectedText();
		}
		if(a==1&&k>6)
		{
			if(k>31)
			{
				if(this.fireEvent(1,e,k)){if(bad)ig_cancelEvent(e);return;}
				if((a=this.Event)!=null)if((a=a.keyCode)!=null)k=a;
			}
			this.doKey(k,(k<10)?"":String.fromCharCode(k),t1,i,this.sel0,this.sel1,bad);
		}
	}
	this.paste=function(v)
	{
		var m=this.maxLength;if(this._np==1)return;
		if(m>0&&m<v.length)v=v.substring(0,m);
		this.text="";this.fix=0;
		this.setText(v,this.sel0);/* mask */
		this.fix=1;this.fireEvent(12,null);
	}
	this.spin0=function(b,o)
	{
		var z=0,t=(new Date()).getTime();
		if(o!=null){o.delay=o.spinDelay;ig_csom.edit_o=o;z++;o.spinF=-1;if(o.fcs<1&&o.spinFocus){o._fcs=1;o.focus();}}
		else
		{
			if((o=ig_csom.edit_o)==null)return;
			if(!o.elem){if((o=ig_csom.edit_f)!=null)window.clearInterval(o);return;}
			b=o.buttons!=null&&o.buttons[1].state==2;
			/* stop interval on custom alert in client spinEvent */
			if(o._sT&&t-o._sT>o.delay+300){o.butState(b?1:2,0);return;}
			if(o.spinSpeedUp>1){if(o.delay>o.spinDelay/o.spinSpeedUp)z=o.delay=Math.ceil(o.delay*6/7);}
			if(o.spinSpeedUp<1){if(o.delay<o.spinDelay/o.spinSpeedUp)z=o.delay=Math.ceil(o.delay*7/6);}
		}
		o._sT=t;
		o.spin_(b?o.spinDelta:-o.spinDelta);
		if(z==0)return;
		if(ig_csom.edit_f!=null)window.clearInterval(ig_csom.edit_f);
		ig_csom.edit_f=window.setInterval(o.spin0,o.delay);
	}
	this.butState=function(b,s)
	{
		var e,i=-1,bb=this.buttons;
		if(bb)bb=bb[b];
		if(!bb||bb.state==s)return;
		while(i++<3)if(i!=b&&(e=this.buttons[i])!=null)if(e.state==1||e.state==2)
			this.butState(i,0);
		if(b>0&&(s==2||bb.state==2))
		{
			if(ig_csom.edit_f!=null){window.clearInterval(ig_csom.edit_f);ig_csom.edit_f=null;}
			if(s==2)this.spin0(b==1,this);
		}
		bb.state=s;
		if(this.css>=0)
		{
			if((i=s)>0)i=((this.css&(1<<(s-1)))==0)?0:s;
			if(bb.elem.className!=(e=this.ccss[s]))bb.elem.className=e;
		}
		if(ig_csom.isEmpty(i=bb.img[s]))if(ig_csom.isEmpty(i=bb.img[0]))return;
		e=bb.imgE;
		if(e&&e.src!=i)e.src=i;
		bb=bb.elem.childNodes;
		for(s=0;s<bb.length;s++)
			if((e=bb[s])!=null)if(e.nodeName=="TABLE")if(e.ig_clr!=i)this.initButElem(e,e.ig_clr=i);
	}
	this.doBut=function(e,a,but)
	{
		ig_cancelEvent(e);
		if(!this.getEnabled()||but>2)return;
		if(but==0)
		{
			if(a<=3)
			{
				if(this.fireEvent(14,e))return;
				if(this.Event.needPostBack||(this.postButton&&!this.Event.cancelPostBack)){this.doPost(1);return;}
				if(a<3)return;
			}
		}
		else if(this.getReadOnly()&&!this.spinOnReadOnly)return;
		if(a==4)this.butP=-1;
		else if(a!=3&&e.button!=0&&this.butP<0)return;
		var b=this.buttons[but].elem;
		if(a==7)
		{
			/* fix for inner elems */
			var z,x=0,y=0,w=b.offsetWidth,h=b.offsetHeight;
			if(w!=null)
			{
				while(b!=null){x+=b.offsetLeft;y+=b.offsetTop;b=b.offsetParent;}
				z=1;
				if(e.clientX>x+z&&e.clientY>y+z&&e.clientX+z<x+w&&e.clientY+z<y+h)return;
			}
			if(this.butP==0)this.butP=-1;
		}
		b=this.butP;
		if(a==3)
		{
			if(b>=0)this.butState(b,0);
			this.butP=-2;
			if(e.button<2){this.butP=but;this.butState(but,2);}
			return;
		}
		if(e.button==0&&b<-1)b=this.butP=-1;
		if(b>=0&&a==5)if(e.button!=1){b=this.butP=-1;this.butState(but,1);return;}
		if(b<-1||(b>=0&&b!=but))return;
		this.butState(but,(a==7)?0:((b>=0)?2:1));
	}
	this.enter0=function(){return this.elem.value;}
	this.update=function(post)
	{
		if(this._lock)return;/*BR29871: process valueChanged with alert(), enter part value in mask, keep mouse within text, press enter: 2 alerts.*/
		this._lock=true;
		this.text=this.focusTxt(false,(this.fcs==2||this.hadFocus)?"":null);//""-still focus
		var v=this.instant(true);
		if(v!=null&&this.old!=null)if(v.getTime!=null&&v.getTime()==this.old.getTime())
			v=this.old;
		if(v!=this.old||this.bad==2)
		{
			if(this.fireEvent(11,null,this.old))
			{
				this.fix=0;this.setValue(this.old);this.fix=1;
				this.text=this.focusTxt(false,null);
			}
			else
			{
				v=this.instant(true);
				if(ig_csom.notEmpty(this.clr1))this.elem.style.color=(v!=null&&v<0)?this.clr1:this.clr0;
				if((post||this._spinPost)&&(this.Event.id!=11||!this.Event.cancelPostBack))this.doPost(3);
				else if(this.k0!=13||this.postEnter||!this.postValue)this.old=v;
				this._dtt(true);
			}
		}
		this._lock=false;
	}
	/* redirect */
	this._ok=function(v)
	{
		var t=this.elem.value;
		/* if this.elem.value is not equal to this.text, then assume "browser-back" from redirect */
		if(!this._0&&this._fcs==null&&t!=this.text)
		{
			this._0=1;
			if(v)this.setValue(v);
			else this.setText(t);
			this._0=2;
			this._vs=this._vs0=this.elemViewState.value;/*get around "reset" button*/
		}
	}
	this.doEvt=function(e)
	{
		var v=this.elemID,type=this.eventID(e.type);
		if(this._fcs==null)
		{
			this._ok();/* Check for redirect */
			try{if(this.elem.selectionStart!=null)this.tr=1;}catch(ex){}
			if(this.tr!=1)this.tr=(this.elem.createTextRange!=null)?this.elem.createTextRange():null;
			this.bad=(this.tr==null)?1:0;
		}
		this._fcs=0;
		/* cut from mask */
		if(type==5&&this.fcs==2&&e.button==1)this.getSelectedText();
		if(type!=1)if(this.fireEvent(type,e))if(type<8){ig_cancelEvent(e);return;}
		if(v>=0){this.doBut(e,type,v);return;}
		var foc=this._focT;
		if(type==4){if(foc&&foc+500>(new Date()).getTime()&&this.tr==1)window.setTimeout("try{igedit_all['"+this.ID+"']._select();}catch(e){}", 0);this._focT=0;}
		if(type<3)this.doKey0(e,type);
		var val=this.elem.value;
		if(type==2)
		{
			this._last=val;
			/* Firefox has list of last strings (like paste) and new value may come from nowhere on mousedown or enter */
			if(e.keyCode==13&&this._fixSel==1&&this._text!=val){this.setText(val);this.update(this.postValue);}
		}
		if(type>=8)
		{
			if(this.bad>2)this.bad=2;
			this.spinF=-1;
			foc=(type==8);
			if(foc==(this.fcs>0))return;
			v=(!this.getReadOnly()&& this.getEnabled())?2:1;
			this._np=0;
			this.fcs=foc?v:0;
			if(v==1)return;
			this.hadFocus=!foc;
			if(foc)
			{
				if(this.bad>1)this.bad=0;
				if(val!=this.text){this.getSelectedText();this.paste(val);}
				this._last=this.text=this.focusTxt(foc,e);
				this._focT=(new Date()).getTime();
				if(window.$util)window.$util._focusedCtl=this;
			}
			else
			{
				/* temporary enable focus state, because setText may fail. Remove, this.fix=1 to disable this.old-change (ValueChange+fast-Tab). */
				if(this._last!=val||this.bad!=0){v=this.fix;this.fix=0;this.fcs=2;this.setText(val);this.fcs=0;this.fix=v;}
				this.update(this.postValue);
				if(window.$util)window.$util._focusedCtl=null;
			}
			this.repaint();
			/* this._gridKey is flag/keyCode set by GridEditBase.__internalEnterEditMode->TextEditorProvider.set_value */
			/* which tells that edit mode was started by keypress */
			/* fake keypress action */
			if(foc&&this._gridKey)
			{
				/* select all text in order to remove old text */
				this.sel0=0;this.sel1=this.text.length;
				/* use dummy not 0 and not equal to this._key value to trick validation logic for keypress */
				this.k0=20;
				/* fake keypress with this._gridKey */
				this.doKey0({},1);
			}
			else this.select(this.selectionOnFocus*10000);
			this._gridKey=null;
			this.hadFocus=false;
			return;
		}
		if(val!=this.text&&!(this.webGrid&&type==5&&this.fcs==0))
		{
			if(type>3&&this.k0==0){this.paste(val);return;}
			this.text=val;this.fireEvent(12,e);
		}
	}
	this.fireEvent=function(id,evnt,arg)
	{
		if(id==12)
		{
			if(this.lastText==(arg=this.elem.value))return false;
			this.lastText=this.text=arg;
			if(this.fcs<2&&(this._fcs!=1||this._spinPost))this.update();
		}
		var evt=this.Event;
		if(evt==null)evt=this.Event=new ig_EventObject();
		evt.id=id;
		var i=evt.srcType=this.elemID;
		evt.srcElement=(i<0)?this.elem:this.buttons[i].elem;
		var evts=this.events[id];
		i=(evts==null)?0:evts.length;
		if(i==0)return false;
		var o,cancel=false,once=true;
		evt.keyCode=null;
		if(arg==null)
		{
			if(id<3){arg=evnt.keyCode;if(arg==0||arg==null)arg=evnt.which;}
			else arg=this.elem.value;
		}
		while(i-->0)
		{
			if((o=evts[i])==null)continue;
			if(once){evt.reset();evt.event=evnt;once=false;}
			if(o.s)ig_fireEvent(this,o.fRef);
			else o.fRef(this,arg,evt,o.o);
			if(evt.cancel)cancel=true;
		}
		if(evt.needPostBack&&id!=14)this.doPost(0);
		return cancel;
	}
	/* MS validators */
	this.msV=function(v){this._vld=0;if(this.elemValue.value==v)return false;this.elemValue.value=v;return true;}
	this._onValidate=function(){this.msV(this.enter0());}
	this.valid=function(v)
	{
		if(!this.msV(v)||this.fcs<0||!window.ValidatorOnChange)return;
		var ev=this.elemValue,e=this.elem;
		try
		{
			v=ev.Validators;e.Validators=v;
			var i=(v&&window['Page_InvalidControlToBeFocused']==null)?v.length:0;
			ValidatorOnChange({srcElement:ev});
			while(i-->0)if(v[i].focusOnError=='t'&&v[i].isvalid===false)
			{window['Page_InvalidControlToBeFocused']=e;this.focus();break;}
		}catch(e){}
	}
	this._select=function()
	{
		var elem=this.elem;
		var sel0=this.selectionOnFocus,sel1=elem.value.length;
		if(sel0==0)sel1=0;else if(sel0<0)sel0=0;else sel0=sel1;
		if(sel0!=elem.selectionStart||sel1!=elem.selectionEnd)this.select(sel0,sel1);
	}
	this.select=function(sel0,sel1)
	{
		if(this.fcs!=2||!this.getVisible())return;
		var e=this.elem;
		var i=e.value.length;
		if(sel1==null){sel1=sel0;if(sel0==null||sel0<0){sel0=0;sel1=i;}}
		if(sel1>=i)sel1=i;
		else if(sel1<sel0)sel1=sel0;
		if(sel0>sel1)sel0=sel1;
		this.sel0=sel0;this.sel1=sel1;
		if(this.tr==1){if(this._fixSel==1)e.readOnly=true;e.selectionStart=sel0;e.selectionEnd=sel1;if(this._fixSel==1)e.readOnly=false;return;}
		try
		{
			if(!this.tr){if(sel0!=sel1)e.select();return;}
			sel1-=sel0;
			this.tr.move("textedit",-1);
			this.tr.move("character",sel0);
			if(sel1>0)this.tr.moveEnd("character",sel1);
			this.tr.select();
		}catch(e){}
	}
	this.getSelectedText=function()
	{
		var r="";
		this.sel0=this.sel1=0;
		if(this.tr==null)return r;
		if(this.tr==1)
		{
			if((this.sel0=this.elem.selectionStart)<(this.sel1=this.elem.selectionEnd))
				r=this.elem.value.substring(this.sel0,this.sel1);
			return r;
		}
		try
		{
			var sel=document.selection.createRange();
			r=sel.duplicate();
			r.move("textedit",-1);
			try{while(r.compareEndPoints("StartToStart",sel)<0)
			{
				if(this.sel0++>1000)break;
				r.moveStart("character",1);
			}}catch(ex){}
			r=sel.text;
		}catch(ex){}
		this.sel1=this.sel0+r.length;
		return r;
	}
	this.getSelection=function(start){this.getSelectedText();return start?this.sel0:this.sel1;}
	this.doPost=function(type)
	{
		if(type!=0&&this.Event!=null&&this.Event.cancelPostBack)return;
		if(this.fcs==2)this.update();
		else if(this.fcs==0&&this.k0!=9)try{if(document.activeElement!=null)document.activeElement.fireEvent("onblur");else window.blur();}catch(ex){}
		try{__doPostBack(this.uniqueId,type);}catch(ex){}
	}
	this.focus1=function(){window.setTimeout("igedit_all['"+this.ID+"'].focus();",0);}
	this.focus=function(){try{this.elem.focus();}catch(i){}}
	this.hasFocus=function(){return this.fcs>0;}
	this.jpn=function(k){return(this.sTxt==1&&k>65295&&k<65306)?(k-65248):k;}
	this._dtt=function(foc)
	{
		var o=this.old,e=this.elem,t=this._dt;
		if(t)e.title=e.alt=t.replace('[value]',(!o||o=='')?this._null:(foc?this.focusTxt():this.elem.value));
	}
	this._onTimer=function()
	{
		var v=0,i=-1,w=-1,e=this.elem,bb=this.buttons;
		var p=e.parentNode;
		if(!p||!bb)return false;
		while(++i<3)
		{
			var im=null,b=bb[i];
			if(b)im=b.imgE;
			if(!im||b.ok)continue;
			if(im.complete||im.readyState=='complete'){im.onreadystatechange=im.onload=null;b.ok=true;continue;}
			im.onreadystatechange=igedit_event;
			im.onload=igedit_event;
			v++;
		}
		if(v>0)return false;
		if((v=p.offsetHeight)<3)
		{
			if(!this._timer&&typeof ig_handleTimer=='function'){this._timer=true;ig_handleTimer(this);}
			return false;
		}
		if((this._wh&4)!=0)if(v>e.offsetHeight){e.style.height=v+"px";w=-2;}
		if((this._wh&2)!=(v=0))while(v++<6&&e.offsetWidth-p.offsetWidth>w)p.style.paddingRight=v+"px";
		delete this._onTimer;
		if((this._wh&1)==0||(e=this.buttons[1])==null)return true;
		e=e.elem;
		while((e=e.parentNode)!=null)if(e.tagName=="TABLE"){if((v=e.parentNode.offsetHeight)>4)e.style.height=v+"px";break;}
		return true;
	}
	if(this._wh>0)this._onTimer();
	this.doResponse=function(vals,man)
	{
		var e,ei,div=document.createElement('DIV');
		div.style.display='none';
		man.setHtml(vals[1],div);
		var ch=div.childNodes;
		for(var i=0;i<ch.length;i++)
		{
			ei=ch[i];
			e=this.elemViewState;
			if(ei.id==e.id)this._vs=e.value=ei.value;
			e=this.elemValue;
			if(ei.id==e.id)e.value=ei.value;
			e=this.Element;
			if(ei.id==e.id)
			{
				var pe=e.parentNode;
				pe.replaceChild(ei,e);
			}
		}
	}
}
function igedit_event(e)
{
	if(e==null)if((e=window.event)==null)return;
	var i=e.type;
	var o=e.target,u=i=='unload',l=i=='readystatechange'||i=='load',s=i=='submit';
	if(s||u||l)
	{
		for(i in igedit_all)if((o=igedit_all[i])!=null)
		{
			var vs=o.elemViewState;
			if(!vs)continue;
			/* Check for redirect under IE: _ok() */
			/* IE has special feature: at the time when it runs init scripts, */
			/* <input> values are not updated yet and they are equal to initial server values. */
			/* So, validate if our values are the same which were set by init javascript. */
			/* If they were modified, then it probably IE refreshed them after redirect,- so, set our value to it. */
			if(l){if(o._onTimer)o._onTimer();o._ok();}
			else if(o.fcs==2)o.update();
			if(u)igedit_init(i,-1);
			if(s&&vs.value!=o._vs)vs.value=o._vs0;/*BR23139: fix for "reset" button*/
		}
		return;
	}
	if(!o)if((o=e.srcElement)==null)o=this;
	if((o=igedit_getById(null,o))!=null)if(o.doEvt!=null)o.doEvt(e);
}
