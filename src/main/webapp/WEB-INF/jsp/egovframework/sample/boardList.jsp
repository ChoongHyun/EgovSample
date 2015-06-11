<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<html>
<head>
    <title>게시판 샘플</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script type="text/javascript" src="<c:url value='/js/jquery/jquery-1.11.1.min.js'/>"></script>
    <script>
    	
        //글 등록
        function fn_insert() {
            $("[name=frm]").attr('action','<c:url value="/boardRegister.do"/>');    /*document.frm.action = '<c:url value="/boardRegister.do"/>';*/
            document.frm.submit();
        }

        //글 수정
        function fn_update(id) {
            $("#selectedId").val(id);   /*document.frm.selectedId.value = id;*/
            $("#frm").attr('action','<c:url value="/boardUpdate.do"/>');
            $("#frm").submit();
        }

        //검색
        function fn_search() {
            /*
              document.frm.action = '<c:url value="/boardList.do"/>';
              document.frm.submit();
             */
            $("#frm").attr('action','<c:url value="/boardList.do"/>').submit();
        }

        //페이지
        function fn_page(pageNo){
            document.frm.pageIndex.value = pageNo;
            document.frm.action = '<c:url value="/boardList.do"/>';
            document.frm.submit();
        }
        
    </script>
</head>
<body>
<form id = "frm" name="frm" method="get">
<input type="hidden" id = "selectedId" name="selectedId" />
    <%--검색조건--%>
    <div class="W500">
        <select id = "searchCondition" name="searchCondition">
            <option value="">[선택]</option>
            <option value="id" ${searchVO.searchCondition eq 'id' ? 'selected' : ''}>아이디</option>
            <option value="name" ${searchVO.searchCondition eq 'name' ? 'selected' : ''}>이름</option>
        </select>
        &nbsp;
        <input type="text" name="searchKeyword" value="${searchVO.searchKeyword}"/>
        &nbsp;
        <a href="javascript:fn_search()">검색</a>
    </div>
    <div class="pt10"></div>
    <%--목록--%>
    <div class="W500">
        <table class="mytable">
            <tr>
                <th width="50">아이디</th>
                <th width="50">이름</th>
                <th width="50">부서명</th>
                <th width="50">성별</th>
                <th width="150">자기소개</th>
                <th width="50">등록자</th>
            </tr>
            <c:forEach var="list" items="${sampleList}">
                <tr>
                    <td class="right">
                        <a href="javascript:fn_update('${list.id}');">
                            ${list.id}
                        </a>
                    </td>
                    <td class="center">${list.name}</td>
                    <td class="center">${list.department}</td>
                    <td class="center">
                        ${list.gender eq 'F' ? '여성' : '남성'}
                    </td>
                    <td class="left">${list.introduce}</td>
                    <td class="center">
                        <c:if test="${list.reguser eq 'manager'}"> <%--equals--%>
                            관리자
                        </c:if>
                        <c:if test="${list.reguser ne 'manager'}"> <%--not equals--%>
                            기타인물
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <%--페이징--%>
    <div class="pt10"></div>
    <div class="W500">
        <div id="paging" class="tac">
            <ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_page" />
            <input type="hidden" name="pageIndex" value="${searchVO.pageIndex}"/>
        </div>
    </div>
    <%--버튼--%>
    <div class="pt10"></div>
    <div class="W500">
        <a href="javascript:fn_insert()" class="floatR">등록</a>
    </div>
</form>
</body>
</html>
