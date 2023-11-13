<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html> 
<html lang="kor"> 
<head> 
    <meta charset="UTF-8">
    <title>MainPage</title>
    <link rel="stylesheet" href="../../resources/main/css/main.css?after">
    <script src="../../../resources/feb/js/time.js"></script>
    <script>
    
    function loadHTMLFile(targetSelector, url, callback) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.querySelector(targetSelector).innerHTML = this.responseText;
                if (typeof callback === 'function') {
                    callback();
                }
            }
        };
        xhttp.open("GET", url, true);
        xhttp.send();
    }
    
        // 메인콘텐츠
	    document.addEventListener('DOMContentLoaded', function () {
	        const frontSlideItems = document.querySelectorAll('.front-slide-item');
	        let delay = 0;
	    
	        frontSlideItems.forEach((item) => {
	            setTimeout(() => {
	                item.classList.add('active');
	            }, delay);
	            delay += 500;
	        });
	    });
      
    // 페이지가 로드될 때 헤더와 사이드바 파일을 불러와 삽입
    window.addEventListener('load', updateTime);
    </script>
</head>
<body>
<!-- 메인 이너 -->
    <div class="main">
        <section class="cover cover_fullpage">
            <div class="cover-background">
                <img src="/resources/img/logo.png">
            </div>
            <div class="cover-inside">
                <div class="l_wrapper">
                    <div class="front">
                        <div class="front-contents">
                            <div class="front-slide">
                                <div class="front-slide-item">
                                    <div class="front-box">
                                    <img class="front-box-cover" src="http://wizcore.co.kr/wp-content/themes/wizcore/statics/home/images/front-icon-03.png">
                                        <h2>Innovative</h2>
                                        <hr>
                                        <p></p>
                                    </div>
                                </div>
                                <div class="front-slide-item">
                                    <div class="front-box">
                                        <img class="front-box-cover" src="http://wizcore.co.kr/wp-content/themes/wizcore/statics/home/images/front-icon-02.png">
                                        <h2>Intelligent</h2>
                                        <hr>
                                        <p></p>
                                    </div>
                                </div>
                                <div class="front-slide-item">
                                    <div class="front-box">
                                        <img class="front-box-cover" src="http://wizcore.co.kr/wp-content/themes/wizcore/statics/home/images/front-icon-01.png">
                                        <h2>Insightful</h2>
                                        <hr>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>

