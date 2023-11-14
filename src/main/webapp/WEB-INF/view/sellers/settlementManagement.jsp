<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../../resources/bdc/css/guideLines.css">
<title>settlementManagement</title>
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

    function addItem() {
        var itemName = document.getElementById("itemName").value;
        var price = parseFloat(document.getElementById("price").value);
        var quantity = parseInt(document.getElementById("quantity").value);

        if (itemName && !isNaN(price) && !isNaN(quantity)) {
            var table = document.getElementById("salesTable");
            var row = table.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            cell1.innerHTML = itemName;
            cell2.innerHTML = price;
            cell3.innerHTML = quantity;
            cell4.innerHTML = "1%"; // 고정된 커미션 값

            var total = (price * quantity) * 0.01; // 1%를 0.01로 표현
            cell5.innerHTML = total;

            document.getElementById("itemName").value = "";
            document.getElementById("price").value = "";
            document.getElementById("quantity").value = "";
        }
    }

</script>
</head>
<body>
    
<div class="container">
	<h2>${member.department} 판매등록</h2>
    
    <input type="text" id="itemName" placeholder="품목 이름">
    <input type="number" id="price" placeholder="금액">
    <input type="number" id="quantity" placeholder="수량">
    <button onclick="addItem()">추가</button>
    
    <br></br>

    <table id="salesTable">
        <tr>
            <th>품목 이름</th>
            <th>금액</th>
            <th>수량</th>
            <th>커미션(임의값)</th>
            <th>Total</th>
        </tr>
 	</table>
</div>
</body>
</html>
