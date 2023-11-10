<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">  
<head> 
    <meta charset="UTF-8">
    <title>BDC_WEB</title>
    <link href="../../../resources/main/css/header.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
        	var code = $("#code").val();
        	if(code == 'SELLER') {
        		$('#agencyTab').hide();
        		$('#adOnlyTab').hide();
        	} else if(code == 'AGENCY') {
        		$('#sellerTab').hide();
        		$('#adOnlyTab').hide();
        	}
        	
            // 회원정보 수정
            $("#memUpdateBtn").on('click', function() {
                location.href="/member/updateCheck";
            });
            
            // 로그아웃
            $("#logoutBtn").on('click', function() {
                alert("로그아웃 되었습니다.")
                location.href="/member/logout";
            });
            
            // 클릭 이벤트 바인딩
            $("#agency").on('click', function() {
                var id = $("#id").val();
                var code = $("#code").val();
                checkAccessAgency(id, code, "/agency/agency");
            });

            $("#seller").on('click', function() {
                var id = $("#id").val();
                var code = $("#code").val();
                checkAccessAgency(id, code, "/agency/seller");
            });

            $("#settlementManagement").on('click', function() {
                var id = $("#id").val();
                var code = $("#code").val();
                checkAccessSeller(id, code, "/sellers/settlementManagement");
            });
            
            $("#agencyTotal").on('click', function() {
                var id = $("#id").val();
                var code = $("#code").val();
                checkAccessAdmin(id, code, "/adminOnly/agencyTotal");
            });
            
            $("#sellerTotal").on('click', function() {
                var id = $("#id").val();
                var code = $("#code").val();
                checkAccessAdmin(id, code, "/adminOnly/sellerTotal");
            });

         // 공통 함수: 로그인 여부 및 접근 권한 체크
            function checkAccessAgency(id, code, url) {
                if (id == null || id === "") {
                    var result = confirm("로그인 하세요.");
                    if (result) {
                        location.href = "/member/login";
                    } else {
                        alert("취소하였습니다.");
                        location.href = "/main";
                    }
                } else if (id !== null && id !== "" && code === 'SELLER') {
                    alert("판매자 회원은 해당 페이지에 접근할 수 없습니다.");
                    return;
                } else if (id !== null && id !== "" && (code === 'AGENCY' || code === 'ADMIN')) {
                    location.href = url;
                }
            }
            
            function checkAccessAdmin(id, code, url) {
                if (id == null || id === "") {
                    var result = confirm("로그인 하세요.");
                    if (result) {
                        location.href = "/member/login";
                    } else {
                        alert("취소하였습니다.");
                        location.href = "/main";
                    }
                } else if (id !== null && id !== "" && (code === 'SELLER' || code === 'AGENCY')) {
                    alert("관리자 페이지 입니다.");
                    return;
                } else if (id !== null && id !== "" && code === 'ADMIN') {
                    location.href = url;
                }
            }
            
            function checkAccessSeller(id, code, url) {
                if (id == null || id === "") {
                    var result = confirm("로그인 하세요.");
                    if (result) {
                        location.href = "/member/login";
                    } else {
                        alert("취소하였습니다.");
                        location.href = "/main";
                    }
                } else if (id !== null && id !== "" && code === 'AGENCY') {
                    alert("대리점 회원은 해당 페이지에 접근할 수 없습니다.");
                    return;
                } else if (id !== null && id !== "" && (code === 'SELLER' || code === 'ADMIN')) {
                    location.href = url;
                }
            }
        });
    </script>
    <script type="text/javascript">
	
	</script>
</head>
<body>

<!-- 헤더 -->
<div class="header">
    <table class="current-time">
        <tr>
            <c:if test="${member.id != null}">
                <td rowspan="2">
                    <b>${member.name}</b> 
                    님 환영합니다.
                </td>
                <td rowspan="2">
                    <button type="button" id="memUpdateBtn" class="pointer">
                        <img src="/resources/img/gear-100s-200px.png">
                    </button>
                    <button type="button" id="logoutBtn" class="pointer">
                        <img src="/resources/img/login-100s-200px.png">
                    </button>
                </td>
            </c:if>
            <c:if test="${member.id == null}">
                <td rowspan="2">
                    <a href="/member/login" style="text-decoration-line: none; color: white; text-align:center;"><b>Login</b></a>
                </td>
                <td rowspan="2">
                    <a href="/member/signup" style="text-decoration-line: none; color: white; text-align:center;"><b>SignUp</b></a>
                </td>
            </c:if>
            <td id="date"></td>
        </tr>
        <tr>
            <td id="time"></td>
        </tr>
    </table>
</div>
<!-- 사이드바 메뉴 -->
<div id="sidebarMenu">
    <div class="logo">
        <a href="/main"><img src="/resources/img/logo2.jpeg"></a>
        <h2><a id="main" style="text-decoration-line: none; color: black; text-align:center;" href="/main">BDC_</a></h2>
    </div>
	<input type="hidden" id="id" value="${member.id}">
	<input type="hidden" id="code" value="${member.code}">
    <ul class="sidebarMenuInner">
    
        <li id="agencyTab" >
	        <a href="#" class="ha">Agency<span></span></a>
	        <ul class="submenu">
	            <li><a id="agency">Agency<br></a></li>
	            <li><a id="seller">Seller<br></a></li>
	        </ul>
        </li>
 
        <li id= "sellerTab">
	        <a href="#" class="ha">Sellers<span></span></a>
	        <ul class="submenu">
	            <li><a id="settlementManagement">Settlement management<br></a></li>
	        </ul>
        </li>
              
        <li id="adOnlyTab">
	        <a href="#" class="ha">Admin Only<span></span></a>
	        <ul class="submenu">
	            <li><a id="agencyTotal">Agency Total<br></a></li>
	            <li><a id="sellerTotal">Seller Total<br></a></li>
	        </ul>
		</li>
	</ul>
</div>
</body>
</html>