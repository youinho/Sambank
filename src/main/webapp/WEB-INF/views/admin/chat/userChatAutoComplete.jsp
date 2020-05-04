<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">






 


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css" media="screen">
        @import url(resources/img/userChat.css);
    </style>
    <script type="text/javascript" src="http://kr03.tocplus007.com/api/autocomplete.do?userId=sambank"></script>
    <script type="text/javascript">
    var chatServerUrl = "http://localhost:8080/";
</script>
</head>
<body style="background-color: #FFFFFF; color: #222222; " >

<div style="width: 100%; height: 100%; overflow: auto;" id="autoCompleteListContainer">
<ul id="autoCompleteList" tabindex="0" style="width: 100%; list-style: none;
padding: 0;
margin: 0;
display: block;
outline: none; cursor: default; 
">

</ul>
</div>

<script>
    var autoCompleteListContainer = document.getElementById('autoCompleteList');
    var autoCompleteList = document.getElementById('autoCompleteList');

    function goToUrl(link) {
        window.open(link);
    }

    function showChatAutoComplete(message) {
        try {
            var resultList = new Array();
            messageArray = message.split(" ");
            message = "" + messageArray[messageArray.length - 1];

            if (message != "") {
                var itemLength = tocplusAutoCompleteList.length;
                for (var i = 0; i < itemLength; i++) {
                    if (tocplusAutoCompleteList[i].title.toLowerCase().indexOf(message.toLowerCase()) != -1) {
                        if (tocplusAutoCompleteList[i].link.toLocaleLowerCase().indexOf("http") == 0) {
                            resultList.push('<div style="width: 800px; cursor: pointer; cursor: hand; text-decoration:underline;" onclick="goToUrl(\'' + tocplusAutoCompleteList[i].link + '\'); return false;" >' + tocplusAutoCompleteList[i].title + '</div>');
                        } else {
                            resultList.push('<div style="width: 800px; cursor: pointer; cursor: hand; text-decoration:underline;" onclick="showAutoCompleteContent(' + i + '); return false;" ><a style="color: #000; text-decoration:none;" href="#" title="' + tocplusAutoCompleteList[i].title + '" />' + tocplusAutoCompleteList[i].title + '</a></div>');
                        }
                    }
                }

                autoCompleteList.innerHTML = "";
                resultList.forEach(function (entry) {
                    var e = document.createElement('li');
                    e.style.overflow = "hidden";
                    e.style.padding = 5;
                    e.onmouseover = function () {
                        this.style.backgroundColor = "#EDEDED"
                    };
                    e.onmouseout = function () {
                        this.style.backgroundColor = "#FFFFFF"
                    };
                    e.innerHTML = entry;
                    autoCompleteList.appendChild(e);
                });
            }

            autoCompleteListContainer.style.height = "100%";
            parent.postMessage({command: "showChatAutoCompleteWindow", content: resultList.length}, chatServerUrl);
        } catch(ignore) {
            // do nothing when something bad has happened, especially for message is null (message.split(" ") fails).
        }
    }

    if (window.addEventListener) {
        window.addEventListener('message', function (e) {
            showChatAutoComplete(e.data);
        });
    }
    else { // IE8 or earlier
        window.attachEvent('onmessage', function (e) {
            showChatAutoComplete(e.data);
        });
    }

    function showAutoCompleteContent(num) {
        parent.postMessage({command:"showAutoCompleteContent",content:tocplusAutoCompleteList[num].content}, chatServerUrl);
    }
</script>
</body>
</html>
