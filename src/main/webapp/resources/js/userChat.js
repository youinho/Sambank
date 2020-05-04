var socket;var _aa=0;var _ba=false;var _ca=false;function safeParentPostMessage(Ga){if(tocdocEmbededUrl&&tocdocEmbededUrl!="null"&&tocdocEmbededUrl!="undefined"){parent.postMessage(Ga,tocdocEmbededUrl);}}
function connectSocket(){socket.connect(chatServerUrl,8192);}
function _da(){setTimeout("connectSocket()",5000);}
function test(){FileLike.prototype=new FlashSocket();FileLike.prototype.constructor=FileLike;function FileLike(){FlashSocket.apply(this,arguments);this.on_data=this.on_recv;this.buff="";this.lines=[];this.maxbuff=this.maxbuff||8192;};FileLike.prototype.on_recv=function(Ha){if(Ha.indexOf("\n")!=-1){this.lines.push.apply(this.lines,(this.buff+Ha).split("\n"));for(var i=0;i<this.lines.length;i++){this.on_line(this.lines[i]);}
this.lines=[];this.buff='';}
else{if(this.buff.length+Ha.length>this.maxbuff){this.lines=[];this.buff='';}
else{this.buff+=Ha;}}}
socket=new FileLike({on_line:function(Ia){try{var Ja=eval("("+Ia+")");if(Ja[0]=="ping"){socket.write('["pong"]\r\n');}
else if(Ja[0]=="login"){if(Ja[1]=="OK"){_ba=true;}}
else if(Ja[0]=="seq"){if(_aa<Ja[1]){socket.write('["u","'+_aa+'",'+_ca+']\r\n');}}
else{getChatLogCallbackInternal(Ja[1]);}}
catch(err){return;}},on_io_error:function(Ka){_ba=false;setTimeout("location.reload(true)",9000);},on_security_error:function(La){_ba=false;_da();},on_close:function(Ma){_ba=false;_da();},on_connect:function(){socket.write('["login","'+userId+'","'+tid+'"]\r\n');_ba=false;}});}
function playSound(Na){document.all['BGSOUND_ID'].src=Na;}
function stopSound(){document.all['BGSOUND_ID'].src='../img/jsilence.mid';}
function _ea(){var Oa=460;if(document.body&&document.body.offsetWidth){Oa=document.body.offsetHeight;}
if(document.compatMode=='CSS1Compat'&&document.documentElement&&document.documentElement.offsetWidth){Oa=document.documentElement.offsetHeight;}
if(window.innerWidth&&window.innerHeight){Oa=window.innerHeight;}
return Oa;}
function _fa(){var Pa=460;if(document.body&&document.body.offsetWidth){Pa=document.body.offsetWidth;}
if(document.compatMode=='CSS1Compat'&&document.documentElement&&document.documentElement.offsetWidth){Pa=document.documentElement.offsetWidth;}
if(window.innerWidth&&window.innerHeight){Pa=window.innerWidth;}
return Pa;}
var _ga=true;var _ha=false;var _ia="";var _ja="";var _ka=false;var _la=true;function _ma(){var Qa=document.getElementById("chatLog");Qa.style.cursor="auto";Qa.onclick=null;}
function _na(Ra,Sa){var Ta="";if(Ra=="M"||Ra=="V"){if(_ia!=Ra){_ia=Ra;var Ua=Ra=="M"?managerName:userName;if(!(tid.lastIndexOf("m_",0)==0&&Ra=="V")){Ta+="<div id='chatNotice'>"+Ua+":</div>";}}}
var Va=_ia=="M"?manager:!manager;var Wa=Va?"myChat":"chat";Ta+="<div class='"+Wa+"'>"+Sa+"</div>";if(Sa.search(/<a href/)!=-1){_ma();}
return Ta;}
function getChatLogCallback(Xa){try{var Ya=eval("("+Xa+")");getChatLogCallbackInternal(Ya);}
catch(err){return;}}
function getChatLogCallbackInternal(Za){try{var $a=0;var ab=Za[$a++];if(ab&&!manager){location.href="awayMessage.do";}
var bb=peerAway;var cb=Za[$a++];peerAway=(userId.indexOf("test_")==0&&userId.length>7)?false:cb;bb=peerAway!=bb;var db=Za[$a++];var eb=0;if(db<_aa){eb+=_aa-db;}
_aa=Za[$a++];_ga=Za[$a++];var fb=_ka;_ka=Za[$a++];fb=_ka!=fb;var gb=Za[$a++];var hb=false;for(i=eb;i<gb.length;i++){var ib=gb[i];if(ib[0]=="C"){_ia="";_ja="";continue;}
if(ib[0]=="I"){if(ib[2]!=null){managerName=ib[2];}
continue;}
if(ib[0]=="O"){if(ib[1]!=null){operatorId=ib[1];}
continue;}
if(ib[0]=="M"&&(ib[1].indexOf("tocplus.co.kr/premium.do")!==-1)){continue;}
_ja+=_na(ib[0],ib[1]);if(ib.length<=2){hb=true;}}
if(hb&&!_ha){if(!_la){playSound('img/dingdong.mp3');}
_la=false;}
if(gb.length!=0||fb||bb){var jb=document.getElementById("chatLog");jb.innerHTML=_ja+(_ka?"<div id='chatNotice'>"+typingMessage+"</div>":"");_oa();}}
catch(err){return;}}
function _pa(kb){return kb.replace(/"/g,'\\"');}
var _qa="";function _ra(lb,mb,nb){if(!manager&&tid.lastIndexOf("m_",0)===0&&mb!=""){mb=userName+" : "+mb;}
if(!manager&&_ba){try{if(mb!=""){socket.write('["msg","'+_pa(mb)+'","'+_aa+'",'+_ca+']\r\n');}
if(_qa!=_sa.value&&typingMessage!=_sa.value){_qa=_sa.value;socket.write('["p","'+_pa(_qa)+'"]\r\n');}}
catch(err){return;}
_ta();return;}
var ob=chatSetter+"?userId="+userId+"&tid="+tid+"&chat="+encodeAscii(mb)+"&sequence="+_aa+"&typing="+_ca;if(nb){new net.ContentLoader(ob,lb,nb);}
else{new net.ContentLoader(ob,lb);}}
var _sa;var _ua=false;function addChat(){scrollLog=true;_ca=false;_ra(getChatLogCallback,_sa.value);_sa.value="";if(mobile){_ua=true;_sa.focus();}}
function _ta(){var pb=(_ga&&!_ha)?9000:3000;setTimeout("getChatLog()",pb);}
function _va(qb){getChatLogCallback(qb);_ta();}
function getChatLog(){_ra(_va,"",_ta);}
function setChatLogExternal(rb){_ra(_va,rb,_ta);}
var _wa;function _xa(){return /msie/i.test(navigator.userAgent)&&!/opera/i.test(navigator.userAgent);}
var _ya=(function(){var sb,v=3,div=document.createElement('div'),all=div.getElementsByTagName('i');while(div.innerHTML='<!--[if gt IE '+(++v)+']><i></i><![endif]-->',all[0]);return v>4?v:sb;}());function _za(){if(_xa){if(_ya>=9)return 0;return 0;}
return 8;}
var _Aa;var _Ba;var _Ca;function _oa(){var tb=document.getElementById("chatLog");tb.style.width=_fa()-(_za());var ub=22;if(peerAway){var vb=_fa()>=300?20:34;_wa.style.height=vb;_wa.style.visibility="visible";try{tb.style.height=_ea()-ub-(_za())-vb;}
catch(err){}
tb.style.top=vb;}
else{_wa.style.visibility="hidden";try{tb.style.height=_ea()-ub-(_za());}
catch(err){}
tb.style.top=0;}
if(mobile){var wb=8;var xb=document.getElementById("chatSubmitBtn");_sa.style.height='auto';_sa.style.padding=wb;_sa.style.top=_ea()-_sa.offsetHeight;_sa.style.width=window.innerWidth-xb.offsetWidth;xb.style.padding=wb;xb.style.top=_sa.offsetTop;xb.style.height=_sa.offsetHeight;document.body.style.fontSize='medium';xb.style.fontSize='large';_sa.style.fontSize='large';}
else{_sa.style.top=_ea()-ub;_sa.style.height=ub;}
tb.scrollTop=tb.scrollHeight;_Aa=tb.scrollTop;_Ba=tb.offsetHeight;_Ca=_sa.offsetTop;}
var _Da=true;function inputFocused(){_ha=true;if(mobile){if(_ua){_ua=false;}
else{chatLog.scrollTop=_Aa/2;chatLog.style.height=_Ba/2;_sa.style.top=_Ca/2;chatSubmitBtn.style.top=_Ca/2;}}
else{safeParentPostMessage({command:"focusedInChatInput",content:""});}
if(_Da){_sa.value="";_sa.style.color="black";_Da=false;}}
function inputBlured(){_ha=false;if(mobile){chatLog.scrollTop=_Aa;chatLog.style.height=_Ba;_sa.style.top=_Ca;chatSubmitBtn.style.top=_Ca;}
else{safeParentPostMessage({command:"focusedOutChatInput",content:""});}}
function checkTyping(){var yb=_sa.value.length;if(!mobile){safeParentPostMessage({command:"showAutoComplete",content:_sa.value});}
_ca=yb>0;}
var _Ea=false;function _Fa(){if(enableViewLink){var zb=document.getElementById("chatLog");zb.onclick=function(){if(!_Ea){window.open(mainServerUrl,"_blank");_Ea=true;}};}}
function startup(){getChatLog();_wa=document.getElementById("awayMessage");_sa=document.getElementById("chatInput");_oa();window.onscroll=_oa;window.onresize=_oa;_Fa();}
var addEvent=window.attachEvent||window.addEventListener;addEvent("message",function(e){document.getElementById('chatContent').innerText=e.data;},false);