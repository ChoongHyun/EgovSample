<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>수정</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script type="text/javascript" src="<c:url value='/js/jquery/jquery-1.11.1.min.js'/>"></script>
    <script>
        //글 수정
        function fn_update() {
            /*
            document.frm.action = '<c:url value="/boardUpdate.do"/>';
            document.frm.submit();
            */
            $("#frm").attr('action','<c:url value="/boardUpdate.do"/>').submit();
        }

        //목록
        function fn_list() {
            /*
            document.frm.action = '<c:url value="/boardList.do"/>';
            document.frm.submit();
            */
            $("#frm").attr('action','<c:url value="/boardList.do"/>').submit();
        }

        //삭제
        function fn_delete() {
            if(confirm("삭제 하시겠습니까?"))
                $("#frm").attr('action','<c:url value="/boardDelete.do"/>').submit();
        }

    </script>
</head>
<body>
<form:form  commandName="sampleVO" id="frm" name="frm" method="post">
    <!-- 검색조건유지 -->
    <input type="hidden" name="searchCondition" value="${searchVO.searchCondition}"/>
    <input type="hidden" name="searchKeyword" value="${searchVO.searchKeyword}"/>
    <input type="hidden" name="pageIndex" value="${searchVO.pageIndex}"/>
    <div class="W500">
        <table class="mytable">
            <tr>
                <th>아이디</th>
                <td>
                    <%--<input type="text" name="id" value="${sampleVO.id}" readonly="readonly" class="readonly"/>--%>
                    <form:input path="id" readonly="true" cssClass="readonly" />
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <%--<input type="text" name="name" value="${sampleVO.name}"/>--%>
                    <form:input path="name"/>
                </td>
            </tr>
            <tr>
                <th>부서명</th>
                <td>
                    <%--<input type="text" name="department" value="${sampleVO.department}"/>--%>
                    <form:input path="department"/>
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <%--<select name="gender">
                        <option value="M" ${sampleVO.gender eq 'M' ? 'selected' : ''}>남성</option>
                        <option value="F" ${sampleVO.gender eq 'F' ? 'selected' : ''}>여성</option>
                    </select>--%>
                    <form:select path="gender">
                        <form:option value="M">남성</form:option>
                        <form:option value="F">여성</form:option>
                    </form:select>
                </td>
            </tr>
            <tr>
                <th>자기소개</th>
                <td>
                    <%--<textarea name="introduce">${sampleVO.introduce}</textarea>--%>
                    <form:textarea path="introduce"></form:textarea>
                </td>
            </tr>
        </table>
    </div>
    <div class="W500">
        <a href="javascript:fn_update();" class="floatR pl5">수정</a>
        <a href="javascript:fn_delete();" class="floatR pl5">삭제</a>
        <a href="javascript:fn_list();" class="floatR pl5">목록</a>
    </div>
</form:form>
</body>
</html>
