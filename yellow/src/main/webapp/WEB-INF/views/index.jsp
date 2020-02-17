<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type="text/css" href="${path}../css/common.css">
	<style type="text/css">
		div.contetn_wrap{
			width: 100%;
			/*height: 100%;*/
			background-color: white;
		}
		div.content{
			width: 1400px;
			margin: 0 auto;
			box-sizing: border-box;
			/*height: 1400px;*/ /*임시로 고정 나중에 삭제할것*/
			border: 1px solid red;
		}
		div{
			border: 1px solid red;
		}
		body, input{
			font-family: 나눔고딕, "Nanum Gothic", 나눔스퀘어, "Nanum Square", "Apple SD Gothic Neo","돋움","sans-serif";			
			line-height: 1.5em;
		}
		
		/*캐러셀*/		
		* {box-sizing: border-box;}
		body {font-family: Verdana, sans-serif;}
		.mySlides {display: none;}
		img {vertical-align: middle;}

		/* Slideshow container */
		.slideshow-container {
		  max-width: 1000px;
		  position: relative;
		  margin: auto;
		}

		/* Caption text */
		.text {
		  color: #000000;
		  font-size: 15px;
		  padding: 8px 12px;
		  position: absolute;
		  bottom: 8px;
		  width: 100%;
		  text-align: center;
		}

		/* Number text (1/3 etc) */
		.numbertext {
		  color: #f2f2f2;
		  font-size: 12px;
		  padding: 8px 12px;
		  position: absolute;
		  top: 0;
		}

		/* The dots/bullets/indicators */
		.dot {
		  height: 15px;
		  width: 15px;
		  margin: 0 2px;
		  background-color: #bbb;
		  border-radius: 50%;
		  display: inline-block;
		  transition: background-color 0.6s ease;
		}

		.active {
		  background-color: #717171;
		}

		/* Fading animation */
		.fade {
		  -webkit-animation-name: fade;
		  -webkit-animation-duration: 1.5s;
		  animation-name: fade;
		  animation-duration: 1.5s;
		}

		@-webkit-keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}

		@keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}

		/* On smaller screens, decrease text size */
		@media only screen and (max-width: 300px) {
		  .text {font-size: 11px}
		}
		/*캐러셀 끝*/

		/*주간베스트*/
	    .title_home{
			text-align: center;
			margin: 70px auto 0;
			padding-bottom: 30px;
		}
		.title_home{
			width: 1280px;
		}
		.title_home .inner{
			font-size: 30px;
			line-height: 31px;
		}


		.recommand_wrap{
			width: 1400px;
			height: 500px;

		}
		.recommand{
			width: 100%;
			height: 100%;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		.recommand_pdt{
			width: 25%;
			height: 100%;
		}
		.recommand_pdt_img{
			width: 100%;
			height: 70%;
			padding-top: 50px;
		}
		.recommand_pdt_name{
			width: 100%;
			height: 10%;
			text-align: center;
		}
		.recommand_pdt_subname{
			width: 100%;
			height: 10%;
			line-height: 50px;
			text-align: center;
			overflow: hidden;
		}

		.recommand_pdt_price{
			width: 100%;
			height: 10%;
			line-height: 50px;
			text-align: center;
		}
		.recommand_pdt_name{
			font-size:17px;
			text-align: center;
			line-height: 50px;
			overflow: hidden;
			text-align: center;
		}
		.extend_cancel{
			padding-right: 5px;
			font-size:14px;
			color: #888;
		}
		.number{
			font-weight: bold;
			font-size: 18px;
		}
		.number2{
			font-size: 14px;
			font-weight: normal;
			text-decoration: line-through;
		}
		.blind{
			position: absolute;
			clip: rect(0 0 0 0);
			width: 1px;
			margin: -1px;
			overflow: hidden;
		}
		.recommand_pdt_img{
			display:block;
			text-align: center;
		}
		#about{
			
			width: 100%;
			min-width: 1290px;
			height: 1070px;
		}
		.about_title{
			background: url(../img/texture-1504364_1280.jpg);				
			overflow: hidden;

			text-align: center;
			padding-top: 178px;
		}

		.about_title h2{
			font-size: 100px;
			font-weight: 100;
		}


	</style>

</head>

<body>
<div class="content_wrap">
		<div class="content">
			<div class="slideshow-container">

				<div class="mySlides fade">
				  <div class="numbertext">1 / 3</div>
				  <img src="${path}/resources/image/img/repill-1884777_1280.jpg" style="width:100%">
				  <div class="text">Caption One</div>
				</div>

				<div class="mySlides fade">
				  <div class="numbertext">2 / 3</div>
				  <img src="${path}/resources/image/img/swimming-388910_1280.jpg" style="width:100%">
				  <div class="text">Caption Two</div>
				</div>

				<div class="mySlides fade">
				  <div class="numbertext">3 / 3</div>
				  <img src="${path}/resources/image/img/manwoman-3694475_1920.jpg" style="width:100%">
				  <div class="text">Caption Three</div>
				</div>

			</div>
				<br>

				<div style="text-align:center">
				  <span class="dot"></span> 
				  <span class="dot"></span> 
				  <span class="dot"></span> 
				</div>
			
			<h4 class="title_home" title="주간베스트">
			<span class="inner">주간베스트</span>
			</h4>
			<div class="recommand_wrap">
				<div class="recommand">
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"><img src="${path}/resources/image/img/multivita.png"></div>
						<div class="recommand_pdt_name">파이토 락토 철분</div>
						<div class="recommand_pdt_subname">	화학적부형제 제로! 여성을 위한 맞춤 설계 종합비타민</div>
						<div class="recommand_pdt_price">
							<strong class="price">
									<span class="number">40,000</span>
									<span class="currency">원</span>
								</strong>
								<strong class="price extend_cancel">
									<span class="number2">50,000</span>
									<span class="currency">원</span>
									<span class="blind">취소</span>
								</strong>
						</div>
					</div>
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"><img src="${path}/resources/image/img/fishcolla.png"></div>
						<div class="recommand_pdt_name">(4Free)저분자 피쉬콜라겐 대용량 1통[100포]+양태반 마스크팩 5장</div>
						<div class="recommand_pdt_subname">	흡수율 높은 저분자 피쉬콜라겐</div>
						<div class="recommand_pdt_price">
							<div class="recommand_pdt_price">
							<strong class="price">
									<span class="number">42,000</span>
									<span class="currency">원</span>
								</strong>
								<strong class="price extend_cancel">
									<span class="number2">50,000</span>
									<span class="currency">원</span>
									<span class="blind">취소</span>
								</strong>
						    </div>
						</div>
					</div>
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"><img src="${path}/resources/image/img/dailyguronsan.png"></div>
						<div class="recommand_pdt_name">데일리 히알루론산</div>
						<div class="recommand_pdt_subname">물광피부 상피세포 성장발달에 필요</div>
						<div class="recommand_pdt_price">
						<div class="recommand_pdt_price">
							<div class="recommand_pdt_price">
							<strong class="price">
									<span class="number">38,000</span>
									<span class="currency">원</span>
								</strong>
								<strong class="price extend_cancel">
									<span class="number2">85,000</span>
									<span class="currency">원</span>
									<span class="blind">취소</span>
								</strong>
						    </div>
						</div>
						</div>
					</div>
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"><img src="${path}/resources/image/img/southcrill.png"></div>
						<div class="recommand_pdt_name">남극크릴오일 1세트</div>
						<div class="recommand_pdt_subname">국내 최대 함량 아스타잔틴 300mg/kg 고순도 크릴오일100%</div>
						<div class="recommand_pdt_price">
							<div class="recommand_pdt_price">
							<div class="recommand_pdt_price">
								<strong class="price">
									<span class="number">75,000</span>
									<span class="currency">원</span>
								</strong>
								<strong class="price extend_cancel">
									<span class="number2">90,000</span>
									<span class="currency">원</span>
									<span class="blind">취소</span>
								</strong>
						    </div>
						    </div>
						</div>
					</div>
				</div>

				<div id="about">
					<div class="about_title">
						<span>오직 건강식품만 취급</span>
						<h2 class="about_big">ABOUT
							<span style="color: #76ca00; font-weight: 700">NANANAN</span>
						</h2>
						<p class="long_ment">
							"어렵게 검색을 통해 노란알약 건강식품을 찾는 이유가 뭘까요?"
							<br>
							"청정지역에서 생산된 깨끗한 제품의 가치 때문입니다."
							<br>
							"노란알약은  오클랜드에 위치해 있습니다."
						</p>
					</div>
				</div>
			


			<h4 class="title_home" title="주간베스트">
			<span class="inner">추천상품</span>
			</h4>
			<div class="recommand_wrap">
				<div class="recommand">
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"></div>
						<div class="recommand_pdt_name"></div>
						<div class="recommand_pdt_subname"></div>
						<div class="recommand_pdt_price"></div>
					</div>
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"></div>
						<div class="recommand_pdt_name"></div>
						<div class="recommand_pdt_subname"></div>
						<div class="recommand_pdt_price"></div>
					</div>
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"></div>
						<div class="recommand_pdt_name"></div>
						<div class="recommand_pdt_subname"></div>
						<div class="recommand_pdt_price"></div>
					</div>
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"></div>
						<div class="recommand_pdt_name"></div>
						<div class="recommand_pdt_subname"></div>
						<div class="recommand_pdt_price"></div>
					</div>
				</div>
					<div class="recommand">
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"></div>
						<div class="recommand_pdt_name"></div>
						<div class="recommand_pdt_subname"></div>
						<div class="recommand_pdt_price"></div>
					</div>
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"></div>
						<div class="recommand_pdt_name"></div>
						<div class="recommand_pdt_subname"></div>
						<div class="recommand_pdt_price"></div>
					</div>
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"></div>
						<div class="recommand_pdt_name"></div>
						<div class="recommand_pdt_subname"></div>
						<div class="recommand_pdt_price"></div>
					</div>
					<div class="recommand_pdt">
						<div class="recommand_pdt_img"></div>
						<div class="recommand_pdt_name"></div>
						<div class="recommand_pdt_subname"></div>
						<div class="recommand_pdt_price"></div>
					</div>
				</div>
				
			</div>

				
		</div>			
	</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}

</script>
</html>