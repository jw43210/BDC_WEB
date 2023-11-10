<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../../resources/feb/css/guideLines.css">
<title>Agency</title>
<link href="../../resources/img/logoicon.jpg" rel="shortcut icon" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../../../resources/feb/js/time.js"></script>
<script>

	var startTimeStamp;
	var startButtonClickTime;
	
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
		<h2>${member.department}점 판매내역</h2>
            <div class="flex items-center space-x-2">
	              <div>
	                <input type="date" id="startDateInputId" name="startDate" class="datepicker">
	                <input type="date" id="endDateInputId" name="endDate" class="datepicker">
	                <button onClick="fetchChartData('usingratio')" class="custom-btn btn-1">GET</button>
	                <button onClick="clearDatePicker()" class="custom-btn btn-1">CLEAR</button>
	              </div>
            </div>    
            <br></br>
		    <table id="agencyTable">
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
