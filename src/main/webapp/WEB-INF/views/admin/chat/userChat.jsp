<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">






 


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <style type="text/css" media="screen">
        @import url(resources/img/userChat.css);
    </style>
    <script language="JavaScript">
        connectionClosedNotice = "서버와의 연결이 끊어졌습니다. 잠시 후 다시 사용하여 주십시오"
    </script>
    <script type="text/javascript" src="http://kr03.tocplus007.com:80/ajax.js"></script>
    <script type="text/javascript">
        var peerAway =false;
        var managerName = "상담원";
        var userName = "고객님";
        var chatSetter = "command/setChat.do";
        var userId = "sambank";
        var manager =false;
        var enableViewLink =false;
        var mainServerUrl = "https://tocplus.co.kr";
        var chatServerUrl = "kr03.tocplus007.com";
        var tocdocEmbededUrl = "https://sambank.net/";
        var typingMessage = "대화를 입력중입니다.";
        var tid = "1588406245287";
        var mobile = false;
    </script>
    <script type="text/javascript" src="http://kr03.tocplus007.com:80/userChat.js?20150610"></script>

</head>
<body onload="startup()"
       >
<object
        id="socketBridge" class="hidden"
        classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
        codebase="http://fpdownload.adobe.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0">
    <param name="movie" value="http://kr03.tocplus007.com:80/socketBridge.swf?onloadcallback=test"/>
    <param name="allowScriptAccess" value="always"/>
    <embed
            class="hidden"
            src="http://kr03.tocplus007.com:80/socketBridge.swf?onloadcallback=test"
            allowScriptAccess="always"
            type="application/x-shockwave-flash"
            pluginspage="http://www.adobe.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
    </embed>
</object>
<BGSOUND id="BGSOUND_ID" LOOP=1 src="/img/jsilence.mid" volume='0' />
    <div class="#b5fdba" id="chatContent"
         style="width: 100%; height: 100%;">
        <div id="awayMessage" style="visibility: hidden;">대화상대가 자리를 비웠으므로 응답하지 않을 수 있습니다.</div>
        <div id="chatLog"
             style="background-image: url();"></div>
        <div id="sendForm">
            <form name="mainForm" method="post" onsubmit="addChat(); return false;">
                <input id="chatInput" name="chatInput" onfocus="inputFocused()"
                       onblur="inputBlured()" onkeyup="checkTyping()"
                       value="이곳에 대화를 입력하세요"/>
                
            </form>
        </div>
    </div>
    
    
    
    <script type="text/javascript">
        function checkMobileBrowser() {
            return ( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) );
        }
        if(checkMobileBrowser()) {
            document.getElementById('chatContent').onclick = function() {
                parent.openMobilePopup();
            }
        }
    </script>
    
    
</body>
</html>
