<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../../resources/bdc/css/guideLines.css">
<title>Energy Simulation</title>
<link href="../../resources/img/logoicon.jpg" rel="shortcut icon" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../../../resources/bdc/js/time.js"></script>
<script>
	
	var id = $("#id").val();
	var code = $("#code").val();
	
	if(id == null || id =="") {
	    alert("로그인하세요.");
	}
	if(code == 'SELLER') {
	    alert("비정상적인 접근입니다.");
	    location.href="/main";
	}

    function clearDatePicker() {
        $("#startDateInputId").val("");
        $("#endDateInputId").val("");
    }
    
</script>
</head>
<body>

<div class="container">
	<h2>${member.department} 판매사원별 내역</h2>
           <div class="flex items-center space-x-2">
             <div>
           	<input type="text" id="sellerName" placeholder="검색어">
               <input type="date" id="startDateInputId" name="startDate" class="datepicker">
               <input type="date" id="endDateInputId" name="endDate" class="datepicker">
       		<button onclick="addItem()" class="custom-btn btn-1">검색</button>
               <button onClick="clearDatePicker()" class="custom-btn btn-1">CLEAR</button>
             </div>
           </div>    

	    <br></br>
	    <form id="searchForm" action="/issue/list/search" method="get">
        	<select id="searchType" name="searchType" size="1" >
   				<option value="title"<c:if test="${searchType == 'title'}">selected</c:if>>품목명</option>
   				<option value="content" <c:if test="${searchType == 'content'}">selected</c:if>>판매자</option>
   				<option value="author" <c:if test="${searchType == 'author'}">selected</c:if>>판매등록일</option>
			</select>
			<input type="text" id="keyword" name="keyword" value="${keyword}" placeholder="검색어 입력" <c:if test="${searchType == 'regDate'}">style="display:'none;'"</c:if>>
			
			<!-- 작성일 검색 시 -->
			<div id="searchDate">
				<input type="text" class="date" id="startDate" name="startDate" value="${startDate}" placeholder="검색 시작 날짜"/>
				<input type="text" class="date" id="endDate" name="endDate" value="${endDate}" placeholder="검색 종료 날짜"/>
            </div>
            
            <button type="button" id="searchBtn" class="custom-btn btn-1">검색</button>
            <button type="button" id="searchClearBtn" class="custom-btn btn-1">초기화</button>
        </form>
	    
	    <table id="sellerTotalTable">
	        <tr>
	            <th>판매자</th>
	            <th>품목이름</th>
	            <th>수량</th>
	            <th>금액</th>
	            <th>Total</th>
	        </tr>
		</table>
</div>
</body>
</html>
