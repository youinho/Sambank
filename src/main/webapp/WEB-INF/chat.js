var mobileUserChat;if(typeof tpOnce=="undefined"){try{var _T$aa="undefined";var _T$ba=(typeof tocplusWidth==_T$aa)?300:tocplusWidth;var _T$ca=(typeof tocplusHeight==_T$aa)?150:tocplusHeight;var _T$da=(typeof tocplusTop==_T$aa)?100:tocplusTop;var _T$ea=(typeof tocplusLeft==_T$aa)?300:tocplusLeft;var _T$fa=(typeof tocplusFloatingWindow==_T$aa)?true:tocplusFloatingWindow;var _T$ga=(typeof tocplusFrameColor==_T$aa)?"orange":tocplusFrameColor;var _T$ha=(typeof tocplusBgImage==_T$aa)?"":tocplusBgImage;var _T$ia=(typeof tocplusAwayImage==_T$aa)?"":tocplusAwayImage;var _T$ja=(typeof tocplusAwayUrl==_T$aa)?"":tocplusAwayUrl;var _T$ka=(typeof tocplusLocaleFixed==_T$aa)?"":tocplusLocaleFixed;var _T$la=(typeof tocplusUserName==_T$aa)?"":escape(escape(tocplusUserName));var _T$ma=(typeof tocplusMinimized==_T$aa)?false:tocplusMinimized;var _T$na=(typeof tocplusMinimizedImage==_T$aa)?"http://tocplus.com/img/minimized_en.gif":tocplusMinimizedImage;var _T$oa=(typeof tocplusWidget==_T$aa)?"":tocplusWidget;var _T$pa=(typeof tocplusChatFrame==_T$aa)?"":tocplusChatFrame;var _T$qa=(typeof tocplusButton==_T$aa)?"":tocplusButton;var _T$ra=(typeof tocplusUrl==_T$aa)?document.URL:tocplusUrl;var _T$sa=document.referrer;var _T$ta=appRoot+"/img";if(_T$oa!=""||_T$qa){try{_T$ra=parent.document.URL;_T$sa=parent.document.referrer;}
catch(e$){}}
var _T$ua=(typeof tocplusHAlign==_T$aa)?"left":tocplusHAlign;var _T$va;var _T$wa;var _T$xa="#FFFFFF";var _T$ya="1px solid #555555";var _T$za="#666666";function _T$Aa(wb,xb){var r=xb/100;var yb=(wb>>16)&255;var zb=(wb>>8)&255;var Ab=wb&255;var Bb=(yb+zb+Ab)/3;var Cb=Math.floor(Bb>127?yb*r:255-((255-yb)*r)).toString(16);var Db=Math.floor(Bb>127?zb*r:255-((255-zb)*r)).toString(16);var Eb=Math.floor(Bb>127?Ab*r:255-((255-Ab)*r)).toString(16);Cb=Cb=="0"?"00":Cb;Db=Db=="0"?"00":Db;Eb=Eb=="0"?"00":Eb;return "#"+(Cb+Db+Eb).toUpperCase();}
if(_T$ga=="white"){_T$wa="#D7D7E0";_T$va="#FBFDFE";_T$xa="#7A7A92";}
else if(_T$ga=="blue"){_T$wa="#ACB4D8";_T$va="#8793C6";}
else if(_T$ga=="green"){_T$wa="#C9E285";_T$va="#A5CE34";}
else if(_T$ga=="purple"){_T$wa="#DFA8EA";_T$va="#D17FE0";}
else if(_T$ga=="grey"){_T$wa="#8E8E8E";_T$va="#676767";}
else if(_T$ga.indexOf("#")==0){var tmpSelectedColor=parseInt(_T$ga.substr(1),16);_T$wa=_T$ga;_T$va=_T$ga;_T$xa=_T$Aa(tmpSelectedColor,40);_T$ya="2px solid "+_T$wa;_T$za=_T$wa;}
else{_T$wa="#FFDA63";_T$va="#FFB300";}
_T$xa=_T$Aa(tmpSelectedColor,40);var _T$Ba=0;function _T$Ca(){var Fb=0;if(document.body&&document.body.offsetWidth){Fb=document.body.offsetHeight;}
if(document.compatMode=='CSS1Compat'&&document.documentElement&&document.documentElement.offsetWidth){Fb=document.documentElement.offsetHeight;}
if(window.innerWidth&&window.innerHeight){Fb=window.innerHeight;}
return Fb;}
function _T$Da(){var Gb=0;if(document.body&&document.body.offsetWidth){Gb=document.body.offsetWidth;}
if(document.compatMode=='CSS1Compat'&&document.documentElement&&document.documentElement.offsetWidth){Gb=document.documentElement.offsetWidth;}
if(window.innerWidth&&window.innerHeight){Gb=window.innerWidth;}
return Gb;}
function _T$Ea(Hb){var Ib=_T$Da();var Jb=0;if("center"==_T$ua){Ib=_T$Ba>Ib?_T$Ba:Ib;Jb=(Ib-_T$ba-10)/2+Hb;}
else if("right"==_T$ua){Jb=_T$Da()-(Hb+_T$ba+33);}
else{Jb=Hb;}
return Jb<0?0:Jb;}
function _T$Fa(Kb){var Lb=_T$Da();if("center"==_T$ua){Lb=_T$Ba>Lb?_T$Ba:Lb;return Kb-(Lb-_T$ba-10)/2;}
if("right"==_T$ua){return Lb-(Kb+_T$ba+33);}
return Kb;}
var _T$Ga="";var _T$Ha;var _T$Ia=true;function scrollUpdate(){var Mb=document.documentElement.scrollTop;var Nb=document.body.scrollTop;var Ob=Mb>Nb?Mb:Nb;_T$Ha.style.top=(Ob+_T$da)+"px";_T$Ha.style.left=_T$Ea(_T$ea)+"px";}
function _T$Ja(){if(_T$Ia==true){setTimeout("scrollUpdate()",3);}}
var _T$Ka=false;var _T$La;var _T$Ma;var _T$Na;var _T$Oa;var nn6=document.getElementById&&!document.all;function _T$Pa(e){var ev=nn6?e:event;_T$Na=ev.clientX;_T$Oa=ev.clientY;_T$La=_T$Na-_T$Ea(_T$ea);_T$Ma=_T$Oa-_T$da;_T$Ka=true;scrollUpdate();document.body.focus();document.onselectstart=function(){return false;};return false;}
function _T$Qa(){_T$Ka=false;scrollUpdate();}
function _T$Ra(e){if(_T$Ka){var ev=nn6?e:event;_T$ea=_T$Fa(ev.clientX-_T$La);_T$da=ev.clientY-_T$Ma;scrollUpdate();}}
var _T$Sa;var _T$Ta;var _T$Ua;function _T$Va(Pb,Qb,e){Pb(e);if(Qb!=null){Qb(e);}}
var _T$Wa=true;function addCommonHandlers(){if(_T$Wa){_T$Sa=document.onmousemove;document.onmousemove=function(e){_T$Va(_T$Ra,_T$Sa,e);};_T$Ta=window.onscroll;window.onscroll=function(e){_T$Va(_T$Ja,_T$Ta,e);};_T$Ua=window.onresize;window.onresize=function(e){_T$Va(_T$Ja,_T$Ua,e);};_T$Wa=false;}}
var _T$Xa;function onTitleOver(Rb){if(!a1ad0e){_T$Xa.innerHTML=Rb;_T$Xa.style.textDecoration="underline";}}
function onTitleOut(Sb){if(!a1ad0e){_T$Xa.innerHTML=Sb;_T$Xa.style.textDecoration="none";}}
function _T$Ya(Tb,Ub,Vb){var Wb=new Date();Wb.setDate(Wb.getDate()+Vb);document.cookie=Tb+"="+escape(Ub)+"; path=/; expires="+Wb.toGMTString()+";"}
function closeTocplusWindow(){_T$Ya("TocplusWindow","invisible",1);_T$Za();}
var _T$$a=false;var _T$ab;var _T$bb;var _T$cb;function expandTocplusWindow(){_T$$a=true;_T$ca*=1.4;_T$ba*=1.4;_T$db();}
function contractTocplusWindow(){_T$ca/=1.4;_T$ba/=1.4;_T$db();}
var _T$eb;function _T$fb(){}
function _T$gb(){_T$Ka=false;}
function sUp(){var Xb=document.body.scrollTop;if(Xb==0){document.body.scrollTop=1;scrollUpdate();document.body.scrollTop=Xb;}
else{scrollUpdate();}}
function _T$hb(Yb,Zb){var $b=document.getElementById("TpTbw");$b.style.cursor=Zb;$b.onmousedown=_T$Pa;$b.onmouseup=Yb;$b.ondragstart=_T$Pa;$b.ondrag=_T$Ra;setTimeout("addCommonHandlers()",900);setTimeout("sUp()",3);}
function emptyTocplusWindow(){}
var _T$ib=12;var _T$jb=31;function addFrame(ac){if(_T$ba<0){_T$ba=_T$Da()-_T$ib;}
if(_T$ca<0){_T$ca=_T$Ca()-_T$jb;}
if(_T$ba<0||_T$ca<0){setTimeout("addFrame('"+ac+"')",100);return;}
if(_T$ba<120){_T$ba=120;}
if(_T$ca<80){_T$ca=80;}
var bc='width:15px;height:15px;display:inline;vertical-align:middle;border:none;float:none;background:none;';var cc='style="'+bc+'"';function _getImgTag(dc){return '<a href="javascript:'+dc+'TocplusWindow();"><img '+cc+' src="'+_T$ta+'/'+dc+'.gif" ></a>';}
if(TaitL=="Tocplus"){TaitLLink=mainServerUrl+'/invitedUser.do?invitorType=title&invitor=';}
else{TaitLLink='#';}
_T$Ha.innerHTML='\
<div style="word-break:normal; float:left; border:'+_T$ya+';'+_T$Ga+'">\
<div id="TpTbw" style="'+_T$Ga+'border: 1px solid '+_T$wa+'; padding:2px; padding-top:3px; background: '+_T$va+' repeat-x top;">\
<div style="'+_T$Ga+(_T$fa?'position:absolute;left:4;top:5':'float:left')+'"><a id="eTkZp" style="font-size:12px; padding-left: 4px; color: '+_T$xa+'; font-weight: bold; font-family: Arial; text-decoration: none;" href="'+TaitLLink+'" title="'+userId+'" target="_blank">'+TaitL+'</a></div>\
<div style="'+_T$Ga+'background: url(\''+_T$ta+'/empty.gif\'); text-align:right;padding-right:2px;font-size:12px">'+(_T$fa?(_T$$a?_getImgTag("contract")+' ':'')+_getImgTag("expand")+' '+_getImgTag("close"):_getImgTag("empty"))+'</div>\
<div id="iVCkq" style="'+_T$Ga+'margin-top: 3px;">\
</div></div></div>\
<div id="tocplusExtWindow" style="display: block; position: absolute; z-index: 999999; width: 100%;"></div>';_T$ab=document.createElement('iframe');_T$ab.style.width=_T$ba+'px';_T$ab.style.height=_T$ca+'px';_T$ab.src=appRoot+'/'+ac;_T$ab.style.border="1px solid "+_T$za;_T$ab.frameBorder=0;_T$kb=document.getElementById("iVCkq");_T$kb.appendChild(_T$ab);_T$Xa=document.getElementById("eTkZp");_T$Xa.onmouseover=function(){onTitleOver(TaitL);}
_T$Xa.onmouseout=function(){onTitleOut(TaitL);}
if(_T$fa){_T$hb(_T$Qa,"move");_T$ab.onmouseover=_T$fb;_T$ab.onmouseout=_T$gb;}
_T$cb=document.createElement('iframe');_T$cb.src=appRoot+'/userChatAutoComplete.do?userId='+userId+'&url='+escape(_T$ra.substring(0,140));_T$cb.style.width=_T$ba+100+'px';_T$cb.style.height=_T$ca+'px';_T$cb.style.border="1px solid #666666";_T$cb.frameBorder=0;_T$bb=document.getElementById("tocplusExtWindow");_T$bb.style.display="none";var ec=_T$ca+40;_T$bb.style.marginTop=ec+'px';_T$bb.appendChild(_T$cb);if(document.body.offsetWidth<parseInt(_T$Ha.style.left.replace('px',''))+_T$ba+50){_T$bb.style.marginLeft=_T$bb.style.marginLeft-90;}
else{_T$bb.style.marginLeft=0;}
_T$lb=document.createElement('div');_T$lb.id='tocplusExtActionLayer';_T$lb.style.width='0';_T$lb.style.height='0';_T$Ha.appendChild(_T$lb);}
function _T$mb(fc){var gc=fc+"=";var x=0;while(x<=document.cookie.length){var y=(x+gc.length);if(document.cookie.substring(x,y)==gc){if((endOfCookie=document.cookie.indexOf(";",y))==-1)endOfCookie=document.cookie.length;return unescape(document.cookie.substring(y,endOfCookie));}
x=document.cookie.indexOf(" ",x)+1;if(x==0)break;}
return "";}
function _T$nb(){if(typeof tocplusTid!=_T$aa)return tocplusTid;var hc=_T$mb("tid");if(!hc){hc=new Date().getTime();_T$Ya("tid",hc,1);}
return hc;}
function _T$ob(){var ic='userChat.do?userId='+userId+'&tid='+_T$nb()+'&frameColor='+encodeURIComponent(_T$ga)+'&userName='+_T$la+'&bgImage='+escape(_T$ha)+'&locale='+encodeURIComponent(_T$ka);if(_T$oa==""){ic+='&url='+escape(_T$ra.substring(0,240))+'&ref='+escape(_T$sa.substring(0,220));}
else{ic+='&url='+escape(_T$ra.substring(0,300))+'&ref='+escape(_T$sa.substring(0,300));}
ic+='&dumb='+(new Date().getTime());mobileUserChat=ic;addFrame(ic);}
function _T$pb(){var jc=new Date().getTime()-userCreated;jc/=(1000*60*60*24);var kc='awayMessage.do?l='+Math.floor(jc)+'&dumb='+(new Date().getTime())+'&locale='+_T$ka;if(_T$ia!=''){kc+='&awayImage='+_T$ia;}
if(_T$ja!=''&&_T$ja.substr(0,4)=="http"){kc+='&awayLink='+_T$ja;}
kc+='&awayMessage='+encodeURI(awayMessage);addFrame(kc);}
function _T$qb(){addFrame('wrongHost.do');}
function _T$rb(){_T$Ya("TocplusWindow","visible",1);_T$db();}
function _T$sb(e){var ev=nn6?e:event;_T$Qa();if(_T$Na==ev.clientX&&_T$Oa==ev.clientY){_T$rb();}}
function showNoFloatTocplus(){_T$rb();}
function _T$Za(){var lc='<img src="'+_T$na+'" style="border:none"/>';if(!_T$fa){lc='<a href="javascript:showNoFloatTocplus();">'+lc+'</a>';}
_T$Ha.innerHTML='<div id="TpTbw" style="'+_T$Ga+'border:none;">'+lc+'</div>';if(_T$fa){_T$hb(_T$sb,"pointer");}}
function _T$db(){var mc=_T$mb("TocplusWindow");if(mc.length==0&&_T$ma){closeTocplusWindow();return;}
if(userId.substring(0,4)=='test'){_T$ob();}
else if(mc=="invisible"){_T$Za();}
else if(wrongHost){_T$qb();}
else if(managerAway){_T$pb();}
else{_T$ob();}}
var _T$tb=false;function stu(){_T$db();}
var _T$ub='<div id="tocplusWindow" style="'+_T$Ga+' width:100%;"></div>';if(_T$oa=="wb"||_T$oa=="appf"){_T$tb=true;document.write(_T$ub);_T$Ha=document.getElementById("tocplusWindow");setTimeout("stu()",500);}
function rtdiv(){if(_T$tb){return;}
_T$tb=true;_T$Ba=document.body.scrollWidth;if(_T$Ba<0||_T$Ba==document.body.clientWidth){_T$Ba=0;}
if(_T$Ba>1500){_T$Ba=1500;}
var nc=document.createElement('div');if(_T$fa){var oc=_T$Ca();var pc=_T$da+_T$ca+60;if(pc>oc){_T$da-=pc-oc;}
nc.innerHTML='<div id="tocplusWindow" style="'+_T$Ga+'z-index: 2147483647; position:absolute; top:'+_T$da+'px; left:'+_T$Ea(_T$ea)+'px;'+_T$Ga+'"></div>';}
else{nc.innerHTML=_T$ub;}
document.body.appendChild(nc);_T$Ha=document.getElementById("tocplusWindow");setTimeout("stu()",500);}
function _T$vb(qc){var rc=window.onload;if(typeof window.onload!='function'){window.onload=qc;}
else{window.onload=function(){qc();if(rc){rc();}}}}
_T$vb(rtdiv);setTimeout("rtdiv()",3000);}
catch(e$){}}
var tpOnce=true;function showChatAutoCompleteWindow(sc){if(sc==0){_T$bb.style.display="none";}
else{if(sc>7){sc=7};var tc=(26*sc);_T$bb.style.display="block";_T$cb.style.height=tc+"px";}}
function writeMessageInChatAutoCompleteWindow(uc){_T$cb.contentWindow.postMessage(uc,appRoot);}
function scrollTocplusWindowPosition(vc){_T$Ia=vc;}
function hideAutoCompleteContent(){_T$lb.innerHTML="";}
function showAutoCompleteContent(wc){_T$lb.innerHTML='<div onclick="hideAutoCompleteContent();" style="z-index:999999; opacity: 0.3; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: #333333;">Hi</div><div id="tocplusAutoCompleteContentLayter" style="font-size: 14px; z-index:9999991; position: fixed; display: block; background-color: #ffffff; top: 10%; left: 50%; margin: 0 0 0 -250px; width: 550px; border: 1px solid rgba(0, 0, 0, 0.3); box-shadow: 0px 3px 7px rgba(0, 0, 0, 0.3); border-radius: 6px; padding: 10px; max-height: 600px; overflow: auto;">'+wc+'</div>';}
function checkMobileBrowser(){if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)){return true;}
return false;}
function openMobilePopup(){window.open(appRoot+"/"+mobileUserChat+"&mobile=true","fullscreen=yes, toolbar=no, menubar=no, resizable=no");return false;}
function doActionBetweenChatWindow(e){var xc=""+e.data["command"];xc=xc;var yc=""+e.data["content"];yc=yc;switch(xc){case "showAutoComplete":writeMessageInChatAutoCompleteWindow(yc);break;case "focusedInChatInput":scrollTocplusWindowPosition(false);break;case "focusedOutChatInput":scrollTocplusWindowPosition(true);break;case "showChatAutoCompleteWindow":showChatAutoCompleteWindow(yc);break;case "showAutoCompleteContent":showAutoCompleteContent(yc);break;default:}}
if(window.addEventListener){window.addEventListener('message',function(e){doActionBetweenChatWindow(e);});}
else{window.attachEvent('onmessage',function(e){doActionBetweenChatWindow(e);});}