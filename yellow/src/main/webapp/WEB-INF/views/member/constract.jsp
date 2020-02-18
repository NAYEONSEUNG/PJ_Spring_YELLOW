<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 헤더 추가할사람 -->


<!-- 헤더추가 ㄴㄴ 디자인만 ㄱㄱ -->
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/e272fd87da.js" crossorigin="anonymous"></script>
<link rel = "stylesheet" type="text/css" href="${path}../css/common.css">
	<style type="text/css">
		/*Common*/
		/*기본적으로 태그에 margin or padding*/
		*{
			box-sizing: border-box;
			font-family: Dotum,돋움, Helvetica, sans-serif;
		}
		body, ul, h1, h2, h3, h4, h5, h6{
			margin: 0;  padding: 0;
		}
		body{
			background-color: #f5f6f7;
		}
		ul{
			list-style: none;
		}
		a{
			text-decoration: none;
			color: inherit;
		}
		.wrap{
			width: 768px;
			margin: 0 auto;
		}


		/*Container*/
		#header{
			height: 169px;
			padding-top: 62px;
			position: relative;
			/*border: 1px solid red;*/
		}
		#container{
			position: relative;
			/*border: 1px solid blue;*/
		}
		#footer{
			height: 81px;
			text-align: center;
			padding: 30px 0px 15px 0px;
			/*border: 1px solid green;*/
		}
		.naver_logo{
			font-size: 2em;
		}
		.n_logo{
			display: block;
			width: 240px;
			height: 240px;
			background:url('../../img/[크기변환]사본 -레알본옐로_1.png') no-repeat;
			margin: 0 auto; 
		}
		.lang{
			position: absolute;
			top: 14px;
			right: 0px;
		}
		.langselect{
			font-size: 12px;
			font-weight:400;
			height: 30px;
			padding: 6px 8px 5px 7px;
			min-width: 98px;
			color: #333;
			border: 1px solid #ccc;
			
		}
		.lang > select{									
			background:url('../../Img/NAVER/sel_arr.gif') 100% 50% no-repeat;
			-webkit-appearance: none; /* 삼각형 모양 꺼브러*/
			background-color: white;
		}
		/*Container*/
		.join_content{
			width: 460px;
			margin: 0 auto;
		}
		.terms{
			margin-bottom: 20px;
			background-color: white;
			border: 1px solid #dadada;
		}
		.terms_span > input{
			position: absolute;
			right: 1px;
			top: 50%;
			width: 22px;
			margin-top: -11px;
			visibility: hidden;
		}
		.terms_p{
			display: block;
			padding: 15px;
			margin: 0px;
			position: relative;
		}
		.terms_span > label{
			background:url(../../img/체크킴.png)100% 50% no-repeat ;
			display: block;
			line-height: 20px;
			height: 50px;
			top: -1px;
			font-size:14px;
			font-weight:700;
		}
		.terms_span{
			position: relative;
			display: block;
			height: 58px;
		}
		.terms_span > input:checked +label{
			background-image: url('../../img/체크끔.png');
		}
		.terms_ul{
			padding-bottom: 7px;
		}
		.terms_ul_li1{
			border-top: 1px solid #f0f0f0;
		}
		ul.terms_ul > li{

			display:block;
			padding: 13px 15px 7px;
		}
		.ul_li_span{
			position: relative;
			display: block;
			height: 24px;
		}
	
		.label1{
			height: 26px;
			font-size: 14px;
			font-weight: 700;
			line-height: 24px;/*헤이트와 맞추면은 수직정렬*/
			position: absolute;
			color: #333;
			top: 0px;
			left: 0px;
			width: 100%;
		}
		.span_only{
			color: #e9b616;
			font-size: 12px;
			font-weight:400;
		}
		.ul_li_span > input{
			visibility: hidden;
			position: absolute;
			right: 1px;
			width: 22px;
			height: 22px;
			margin-top: -11px;
			top: 50%;

		}
		.ul_li_span > label {
			background:url('../../Img/체크킴.png') 100% 50% no-repeat;
			display: block;
		}
		.ul_li_span > input:checked +label{
			background-image: url('../../Img/체크끔.png');
		}
		.terms_box{
			position: relative;
			box-sizing: border-box;
			height: 88px;
			margin-top: 11px;
			padding: 8px 10px;
			border: 1px solid #f0f0f0;
			background-color: #f7f7f7;
			overflow: auto;
		}
		h3.article_title{
			font-size:12px;
			font-weight: 700;
			line-height: 16px;
			color: #666;
		}
		.article > p {
			display: block;
			font-size: 12px;
			line-height: 16px;
			color: #666;
		}
		.span_select{
			color: #969696;
			font-size:12px;
			font-weight:400;
		}
		.err_check_msg{
			height: 24px;
			font-size: 12px;
			/*font-weight: 700;*/
			line-height: 14px;
			color: #f46665;
			/*padding: 0px 15px;*/
			display: block;
			/*width: 428px;*/
			/*text-align: center;*/
			 
		}
		.err_check{
			display: none;
		}
		.btn_double_area{
			margin: 30px -5px 0px;
			overflow: hidden;
		}
		.btn_double_area > span {
			display: block;
			float: left;
			width: 50%;
		}
		.btn_type{
			width: auto;
			margin:0px 5px;
			font-size: 20px;
			font-weight: 600;
			line-height: 61px;
			display: block;
			box-sizing: border-box;
			height: 61px;
			padding-top: 1px;
			text-align: center;
		}
		.btn_default{
			color: #333;
			border: 1px solid #e7e7e7;
			background-color: #fff;
		}
		.btn_agree{
			color: #fff;
			border: 1px solid #e9b616;
			background-color: #e9b616;
		}
		.group_join{
			margin: 20px 0px 65px;
			text-align: center;
			color: #666;
			font-size: 12px;
		}
		.group_join > a{
			text-decoration: underline;
			color: #333;
		}
		/*fotter*/
		#footer{
			padding: 15px 0;/*상하 (두개일떄는)*/
		}
		#footer > ul{ 
			margin: 0 auto 9px;
			text-align: center;

		}
		#footer * {
			font-size: 11px;
			line-height: normal;
			list-style: none;
			color: #333;
		}
		#footer > ul > li{
			display: inline;/*인라인:사이즈 조절은 안하는데 내 옆으로 다 붙어라*/
			padding: 0 5px 0 7px;
			border-left: 1px solid #dadada;
		}
		#footer > ul > li a:hover{
			color: #e9b616;
			text-decoration: underline;
		}
		#footer ul li:first-child{/* first-child: 첫번째 자식만*/
			border-left: 0px!important;/* ! 느낌표 찍으면 가장 높은 레벨이니까 이놈만 먹음*/
		}
		#addr_logo{
			width: 63px;
			height: 11px;
		}
		#address{
			margin:0 auto;
			text-align: center;
		}
		#address * {
			font: 9px verdana;
		}
		#address a{
			font-weight: bold;
		}
		#address a: hover{
			color: #e9b616;
		}
		
	</style>

</head>
<body>
<div class="wrap">
		<header>
			<div id="header"> 	
				<h1 class="naver_logo">
					<a href="../include/header2.html" class="n_logo"></a>
				</h1>		
				<div class="lang">
					<select class="langselect">
						<option>한국어</option>
						<option>English</option>
						<option>中文(简体)</option>
						<option>中文(台灣)</option>

					</select>
				</div>
			</div>
		</header>
		<section>
			<div id = "container">
				<form class="join_content" name="" action="" method="" >
					<div class="terms">
						<p class="terms_p">
							<span class="terms_span">
								<input type="checkbox" id="cbox">
								<label for="cbox">
									이용약관, 개인정보 수집 및 이용,<br>
									위치정보 이용약관(선택), 프로모션 안내<br>
									메일 수신(선택)에 모두 동의합니다.									
								</label>
								
							</span>
							
						</p>

						<ul class="terms_ul">
							<li class="terms_ul_li1">
								<span class="ul_li_span">
									<input type="checkbox" id="li1box" class="ckboxs">
									<label for="li1box" class="label1">네이버이용약관동의<span class="span_only">(필수)
									</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										<h3 class="article_title">여러분을 환영합니다.</h3>
										<p>노란알약 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본<br> 
										약관은 다양한 노란알약 서비스의 이용과 관련하여 노란알약 서비스를 제공<br> 
										하는 노란알약 주식회사(이하 노란알약)와 이를 이용하는 노란알약 서비스<br> 
										회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의<br>  
									    노란알약 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다</p>													
									</div>									
								</div>
							</li>

							<li class="terms_ul_li2">
								<span class="ul_li_span">
									<input type="checkbox" id="li2box" class="ckboxs">
									<label for="li2box" class="label1">개인정보 수집 및 이용에 대한 안내<span class="span_only">(필수)
									</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										
										<p>정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 
										항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 
									    읽은 후 동의하여 주시기 바랍니다</p>
									    <h3 class="article_title">1. 수집하는 개인정보</h3>													
									</div>									
								</div>
							</li>

							<li class="terms_ul_li3">
								<span class="ul_li_span">
									<input type="checkbox" id="li3box" class="ckboxs">
									<label for="li3box" class="label1">위치정보 이용약관 동의<span class="span_select">(선택)
									</span>
									</label>
								</span>
								<div class="terms_box">
									<div class="article">
										
										<p>위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신</strong> 등을 포함하는 노란알약 위치기반 서비스를 이용할 수 있습니다.</p>
									    <h3 class="article_title">제 1 조 (목적)</h3>													
									</div>									
								</div>
							</li>

							<li class="terms_ul_li4">
								<span class="ul_li_span">
									<input type="checkbox" id="li4box" class="ckboxs">
									<label for="li4box" class="label1">이벤트 등 프로모션 알림 메일 수신<span class="span_select">(선택)
									</span>
									</label>
								</span>								
							</li>
						</ul>
						
					</div>

					<div class="err_check">
						<span class="err_check_msg">네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
					</div>

					<div class="btn_double_area">
						<span><a href="../include/header2.html" class="btn_type btn_default">취소</a></span>
						<span><a href="../include/yellow_join.html" class="btn_type btn_agree">확인</a></span>						
					</div>
				</form>

				<div class="group_join">
					회사, 동아리 등 단체에서 사용할 ID가 필요하세요?<a href="#">단체 회원 가입</a>
					
				</div>
			</div>
		</section>
			<footer>
				<div id="footer">
					<ul>
						<li><a href="#">이용약관</a></li>
						<li><strong><a href="#">개인정보처리방침</a></strong></li>
						<li><a href="#">책임의 한계와 법적고지</a></li>
						<li><a href="#">회원정보 고객센터</a></li>
					</ul>
				
					<div id="address">
						<span>
							<a href="../include/header2.html">
							<img id="addr_logo" src="../../img/small-레알본옐로_1.png">
							</a>
						</span>
						<span>Copyright</span>
						<span>@</span>
						<span><strong><a href="#">YELLOW Corp.</a></strong></span>
						<span>All Rights Reserved.</span>
					
					</div>

				</div>
		</footer>
	</div>
</body>
</html>