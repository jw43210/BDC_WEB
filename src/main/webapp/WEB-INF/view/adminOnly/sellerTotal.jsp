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
	if(code == 'AGENCY') {
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
	<h2>판매자별 내역</h2>
        <div class="flex items-center space-x-2">
          <div>
        	<input type="text" id="sellerName" placeholder="판매자명">
            <input type="date" id="startDateInputId" name="startDate" class="datepicker">
            <input type="date" id="endDateInputId" name="endDate" class="datepicker">
    		<button onclick="addItem()" class="custom-btn btn-1">검색</button>
            <button onClick="clearDatePicker()" class="custom-btn btn-1">CLEAR</button>
            <button onClick="clearDatePicker()" class="custom-btn btn-1">전체보기</button>
          </div>
        </div>    

	    <br></br>
	    
	    <table id="sellerTotalTable">
	        <tr>
	            <th>대리점</th>
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
