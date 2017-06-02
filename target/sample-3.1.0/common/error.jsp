<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ko">
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
    <title>오류 - 이용에 불편을 드려서 대단히 죄송합니다.</title>
</head>
<body>
<br/>
<div align="center">
<img src="http://cdn4.wpbeginner.com/wp-content/uploads/2013/12/error.jpg" />
<br/>
    <h1>아래 메세지를 잘 보고 분석하세요</h1>
    <b>exception</b> : <c:out value="${requestScope['javax.servlet.error.exception']}"/><br/>
    <b>exception type</b> : <c:out value="${requestScope['javax.servlet.error.exception_type']}"/><br/>
    <b>message</b> : <c:out value="${requestScope['javax.servlet.error.message']}"/>
</div>
<!--
    시스템오류
    이용에 불편을 드려서 대단히 죄송합니다.
    시스템장애로 인해 정상적인 화면이 호출되고 있지 않습니다.
    인터넷 창을 다시 띄우시거나 잠시후 다시 접속하여 주시기 바랍니다.
    이용에 불편을 드려서 대단히 죄송합니다.
-->
</body>
</html>