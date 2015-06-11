<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AxisJ 게시판 수정</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/AXJ/AXJ.min.css'/>" />
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sampleAXJ.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/AXJ/AXJ.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//성별
		$("#gender").bindSelect();
		
		//게시글 수정
		$("#btn_update").click(function() {
			var json = {
					id	 		: $("#id").val(), 
					name 		: $("#name").val(), 
					department  : $("#department").val(),
					gender  	: $("#gender").val(),
					introduce  	: $("#introduce").val()
				}
			//json을 string형식으로 변환
			var param = JSON.stringify(json);
			
			//jQuery ajax API참고
			$.ajax({
				contentType:"application/json; charset=utf-8",
				type:"POST",
				dataType: "text",
			    url:"/axisjBoardUpdate.do",
			    data: param,
				async: true,    
			    cache: false,    
			    processData:false,
			    success:function (isSucess){
			    	//등록 성공시
			    	if(isSucess) {
			    		dialog.push({body:'<b>수정성공!</b>\n 수정이 완료되었습니다.', onConfirm:function() {
			    			$("#btn_list").click();
			            }});
			    	} 
			    	//등록 실패시
			    	else {
			    		dialog.push({body:'<b>수정실패!</b>\n 수정되지 않았습니다...ㅠㅠ', type:'Warning'});
			    	}
			    },
			    error: function(xhr, status, error){
			    	toast.push({body:'<b>Caution</b> 비동기에러 !!!', type:'Caution'});
				}
			});
		});
		
		//목록으로 이동
		$("#btn_list").click(function() {
			$("#frm").attr('action','<c:url value="/axisjBoardList.do"/>').submit();
		});
	});
</script>
</head>
<body>
	<form:form commandName="searchVO" id="frm" name="frm" method="post">
        <!-- 검색조건유지 -->
        <%-- <input type="hidden" name="searchCondition" value="${searchVO.searchCondition}"/>
        <input type="hidden" name="searchKeyword" value="${searchVO.searchKeyword}"/> --%>
        <form:hidden path="searchCondition"/>
        <form:hidden path="searchKeyword"/>
	</form:form>
    <div class="W300 right">
        <table>
            <tr>
                <th>아이디</th>
                <td><input type="text" id="id" name="id" class="AXInput W100 readonly" value="${sampleVO.id}" readonly="readonly"/></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" id="name" name="name" class="AXInput W100" value="${sampleVO.name}"/></td>
            </tr>
            <tr>
                <th>부서명</th>
                <td><input type="text" id="department" name="department" class="AXInput W100" value="${sampleVO.department}"/></td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <select id="gender" name="gender" class="AXSelect W100">
                        <option value="">[선택]</option>
                        <option value="M" ${sampleVO.gender eq 'M' ? 'selected' : ''}>남성</option>
                        <option value="F" ${sampleVO.gender eq 'F' ? 'selected' : ''}>여성</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>자기소개</th>
                <td>
                    <textarea id="introduce" name="introduce" class="AXTextarea W100">${sampleVO.introduce}</textarea>
                </td>
            </tr>
        </table>
    </div>
    <div class="W300 pt10">
        <ul class="sub_buttons">
        	<li>
        		<button type="button" id="btn_list" class="AXButton floatR"><i class="fa fa-align-justify fa-lg"></i> 목록</button>
        	</li>
        	<li>
        		<button type="button" id="btn_update" class="AXButton Green floatR"><i class="fa fa-hand-o-up fa-lg"></i> 수정</button>
        	</li>
        	<li>
        		<button type="button" id="btn_delete" class="AXButton Red floatR"><i class="fa fa-trash-o fa-lg"></i> 삭제</button>
        	</li>
        </ul>
    </div>
</body>
</html>