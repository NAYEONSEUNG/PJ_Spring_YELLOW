<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/e272fd87da.js" crossorigin="anonymous"></script>
<link rel = "stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
		div.contetn_wrap{
			width: 100%;
			/*height: 100%;*/
			background-color: white;
		}
		div.content{
			width: 1400px;
			margin: 92px auto 0;
			box-sizing: border-box;
			/*height: 1400px;*/ /*임시로 고정 나중에 삭제할것*/
			border: 1px solid red;
		}
		/* div{
			border: 1px solid red;
		} */
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
		  width: 1400px;
		  position: relative;
		  display:flex;
		}
		/*캐러셀 버튼*/
		.mySlideWrap{
		  width:400px;
		  height:387.64px;
		}
		.mySlidesBest{
		width:100%;
		height:33.33%;
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
			border: solid 1px #ececec;
			margin: 0 10px;
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
		/* 탑버튼 */
		.top_btn{
			bottom: 115px;
			background-color: #414d41;
			display: none;
			bottom: 95px;
		}
		.fix_btn{
			position: fixed;
			right: 50px;			
			color: white;
			height: 70px;
			width: 70px;			
			border-radius:50%;
			display: flex;
			justify-content: center;
			align-items: center;
			font-size: 25px;
			cursor: pointer;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
		}
		.fix_btn > i {
			transition: transform .3s;			
		}
		.fix_btn:hover > i{
			transform: scale(2);
		}
		
			
		

	</style>

</head>

<body>
<div class="top_btn fix_btn"><i class="fas fa-arrow-alt-circle-up"></i></div>
<div class="content_wrap">
		<div class="content">
			<div class="slideshow-container">

				<div class="mySlides fade">
				  <div class="numbertext">1 / 3</div>
				  <img src="${path}/resources/image/img/yellpharmacy-3087599_1280.jpg" style="width:100%">
				  <div class="text">Caption One</div>
				</div>

				<div class="mySlides fade">
				  <div class="numbertext">2 / 3</div>
				  <img src="${path}/resources/image/img/runners-635906_1280.jpg" style="width:100%">
				  <div class="text">Caption Two</div>
				</div>

				<div class="mySlides fade">
				  <div class="numbertext">3 / 3</div>
				  <img src="${path}/resources/image/img/people-821624_1280.jpg" style="width:100%">
				  <div class="text">Caption Three</div>
				</div>
				<div class="mySlideWrap">	
					<div class="mySlidesBest">Weekly BEST</div>
					<div class="mySlidesBest">MD CHOICE</div>
					<div class="mySlidesBest">레쓰고</div>
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
				
					<c:forEach items = "${BestPdt}" var="pdt">
					<div class="recommand_pdt ">
						<div class="recommand_pdt_img"><img src="${path}/resources/image/img/${pdt.p_img}"></div>
						<div class="recommand_pdt_name">${pdt.pname}</div>
						<div class="recommand_pdt_subname">	${pdt.pmemo}</div>
						<div class="recommand_pdt_price">
							<strong class="price">
									<span class="number"><fmt:formatNumber type="number" maxFractionDigits="3"  value="${pdt.price}"/></span>
									<span class="currency">원</span>
								</strong>

						</div>
					</div>
					</c:forEach>
				</div>
			</div>	
						<h4 class="title_home" title="주간베스트">
			<span class="inner">신상품</span>
			</h4>
			<div class="recommand_wrap">
				<div class="recommand">
				
					<c:forEach items = "${NewPdt}" var="pdt">
					<div class="recommand_pdt ">
						<div class="recommand_pdt_img"><img src="${path}/resources/image/img/${pdt.p_img}"></div>
						<div class="recommand_pdt_name">${pdt.pname}</div>
						<div class="recommand_pdt_subname">	${pdt.pmemo}</div>
						<div class="recommand_pdt_price">
							<strong class="price">
									<span class="number"><fmt:formatNumber type="number" maxFractionDigits="3"  value="${pdt.price}"/></span>
									<span class="currency">원</span>
								</strong>

						</div>
					</div>
					</c:forEach>
				</div>
			</div>
						<div class="recommand_wrap">
				<div class="recommand">
				
					<c:forEach items = "${NewPdt2}" var="pdt">
					<div class="recommand_pdt ">
						<div class="recommand_pdt_img"><img src="${path}/resources/image/img/${pdt.p_img}"></div>
						<div class="recommand_pdt_name">${pdt.pname}</div>
						<div class="recommand_pdt_subname">	${pdt.pmemo}</div>
						<div class="recommand_pdt_price">
							<strong class="price">
									<span class="number"><fmt:formatNumber type="number" maxFractionDigits="3"  value="${pdt.price}"/></span>
									<span class="currency">원</span>
								</strong>

						</div>
					</div>
					</c:forEach>
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

$(window).scroll(function(){   //스크롤이 움직이면 
	   if(document.body.scrollTop > 80 || document.documentElement.scrollTop > 80){
		   $('.top_btn').fadeIn().css("display","flex");	
	   
	}else{
		$('.top_btn').fadeOut();
	}
	});	

	$('.top_btn').click(function(){
		$('html, body').animate({scrollTop : 0},800);
	});
		
</script>
</html>