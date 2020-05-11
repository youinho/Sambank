<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<script type="text/javascript">
/* tocplusBgImage='123';
tocplusAwayImage='132'; */
tocplusTop=300;
/* tocplusTop1=1150; */
tocplusLeft=20;
tocplusMinimizedImage='https://i.imgur.com/0nEhPSn.png';
tocplusHAlign='right';
tocplusMinimized='true';
tocplusWidth=180;
tocplusHeight=150;
<c:choose>
<c:when test="${name != null}">tocplusUserName='<c:out value="${name}(${id})님"></c:out>';</c:when>
<c:when test="${name == null}">tocplusUserName='<c:out value="고객님"></c:out>';</c:when>
</c:choose>

// tocplusHost
tocplusFrameColor='#ffa428';
tocplusFloatingWindow=true;
var tocplusHost = (("https:" == document.location.protocol) ? "https://" : "http://");
/*document.write(unescape("%"+"3Cscript src='" + tocplusHost + "kr03.tocplus007.com/chatLoader.do?userId=sambank' type='text/javascript'"+"%"+"3E"+"%"+"3C/script"+"%"+"3E"));
 */
/* document.write(unescape("%"+"3Cscript src='" + tocplusHost + "localhost:8080/chatLoader.do?userId=sambank' type='text/javascript'"+"%"+"3E"+"%"+"3C/script"+"%"+"3E"));
 */
 document.write(unescape("%"+"3Cscript src='" + "https://" + "sambank.net/chatLoader.do?userId=sambank' type='text/javascript'"+"%"+"3E"+"%"+"3C/script"+"%"+"3E"));
 /* <div id="tocplusWindow" style="z-index: 2147483647; position: absolute; top: 930.4px; left: 1318px;"><div id="TpTbw" style="border: none; position: absolute; top: 140px; cursor: pointer;"><img src="https://i.imgur.com/3dca7QT.png" style="border:none"></div></div>
 */ </script>
</body>
</html>