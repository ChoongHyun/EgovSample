<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AxisJ 게시판 샘플</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/AXJ/AXJ.min.css'/>" />
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sampleAXJ.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/AXJ/AXJ.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//그리드 초기화
		var grid = new AXGrid();
		grid.setConfig({
			targetID : "grid",
            theme : "AXGrid",
            height:500,
            colHeadAlign: "center",
            colGroup : [
                {key:"ID", label:"아이디", width:"80", align:"right"},
                {key:"NAME", label:"이름", width:"80", align:"center"},
                {key:"DEPARTMENT", label:"부서", width:"80", align:"center"},
                {key:"GENDER", label:"성별", width:"80", align:"center", formatter : function() {
                	return this.item.GENDER == 'M' ? '남성' : '여성';
                }},
                {key:"REGUSER", label:"등록자", width:"80", align:"center", formatter : function() {
                	return this.item.REGUSER == 'manager' ? '관리자' : '기타인물';
                }},
                {key:"INTRODUCE", label:"자기소개", width:"*", align:"left"}
            ],

            body : {
                onclick: function(){
                    var selectedId = grid.getSelectedItem().item.ID;
                    $("#selectedId").val(selectedId);
                    $("#frm").attr('action','/axisjBoardUpdate.do').submit();
                }
            },
            page:{
                display:true,
            }
		});
		
		//검색조건
		$("#searchCondition").bindSelect();
		
		//검색버튼 클릭
		$("#btn_search").click(function() {
			
			var json = {
						searchCondition: $("#searchCondition").val(), 
						searchKeyword  : $("#searchKeyword").val()
						}
			//json을 string형식으로 변환
			var param = JSON.stringify(json);
			
			//jQuery ajax API참고
			$.ajax({
				contentType:"application/json; charset=utf-8",
				type:"POST",
				dataType: "text",
			    url:"/getBoardList.do",
			    data: param,
				async: true,    
			    cache: false,    
			    processData:false,
			    success:function (result){
			    	var jsonRslt = $.parseJSON(result);
			    	grid.setList(jsonRslt);
			    },
			    error: function(xhr, status, error){
			    	toast.push({body:'<b>Caution</b> 비동기에러 !!!', type:'Caution'});
				}
			});
		});
		
		//등록버튼
		$("#btn_insert").click(function() {
            $("#frm").attr('action','/axisjBoardRegister.do').submit();
		});
		
		$("#btn_search").click();
	});
</script>
</head>
<body>
	<!-- 검색조건 -->
	<div class="sub_contents">
		<form id="frm">
		<input type="hidden" id="selectedId" name="selectedId" />
		<ul class="sub_search">
			<li>
				<select id="searchCondition" name="searchCondition" class="AXSelect W80">
					<option value="">[선택]</option>
		            <option value="id" ${searchVO.searchCondition eq 'id' ? 'selected' : ''}>아이디</option>
		            <option value="name" ${searchVO.searchCondition eq 'name' ? 'selected' : ''}>이름</option>
				</select>
			</li>
			<li>
				<input type="text" id="searchKeyword" name="searchKeyword" class="AXInput W200" 
				placeholder="검색어를 입력하세요" value="${searchVO.searchKeyword}"/>
			</li>
			<li>
				<button type="button" id="btn_search" class="AXButton Classic" onclick="return;"><i class="fa fa-search fa-lg"></i> 검색</button>
			</li>
		</ul>
		</form>
	</div>
	
	<!-- 그리드 -->
	<div id="grid"></div>
	
	<!-- 등록 -->
	<div class="pt10 floatR">
		<button id="btn_insert" class="AXButton"><i class="fa fa-pencil fa-lg"></i> 등록</button>
	</div>
</body>
</html>