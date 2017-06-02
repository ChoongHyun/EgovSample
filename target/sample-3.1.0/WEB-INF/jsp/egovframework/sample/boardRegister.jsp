<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>등록</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script type="text/javascript" src="<c:url value='/js/jquery/jquery-1.11.1.min.js'/>"></script>
    <script>
        //글 등록
        function fn_insert() {
            /*
            document.frm.action = '<c:url value="/boardRegister.do"/>';
            document.frm.submit();
            */
            $("#frm").attr('action','<c:url value="/boardRegister.do"/>').submit();
        }

        //목록
        function fn_list() {
            /*
            document.frm.action = '<c:url value="/boardList.do"/>';
            document.frm.submit();
            */
            $("#frm").attr('action','<c:url value="/boardList.do"/>').submit();
        }
    </script>
</head>
<body>
    <form id="frm" name="frm" method="post">
        <!-- 검색조건유지 -->
        <input type="hidden" name="searchCondition" value="${searchVO.searchCondition}"/>
        <input type="hidden" name="searchKeyword" value="${searchVO.searchKeyword}"/>
        <input type="hidden" name="pageIndex" value="${searchVO.pageIndex}"/>
        <div class="W500">
            <table class="mytable">
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="name"/></td>
                </tr>
                <tr>
                    <th>부서명</th>
                    <td><input type="text" name="department"/></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                        <select name="gender">
                        	<option value="">[선택]</option>
                            <option value="M">남성</option>
                            <option value="F">여성</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>자기소개</th>
                    <td>
                        <textarea name="introduce"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <div class="W500">
            <a href="javascript:fn_insert();" class="floatR pl5">등록</a>
            <a href="javascript:fn_list();" class="floatR pl5">목록</a>
        </div>
    </form>
</body>
</html>
