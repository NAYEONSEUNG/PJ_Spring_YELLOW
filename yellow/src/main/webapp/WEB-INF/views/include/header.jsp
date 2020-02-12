<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%><!-- 자바코드 쓸수있게 하는거/ include 해당파일을 실행시키라는 말 -->
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yellow:알약</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
		div.header_wrap{
			width: 100%;
			background-color: white;
			box-shadow: 0 0 1px 1px rgba(20, 23, 28, .1), 0 3px 1px 0 rgba(20, 23, 20, .1);
			z-index: 999;/*숫자가 크면 클수록 무조건 맨 앞에 오는놈*/
		}
		div.header_content{
			width: 1400px;
			margin: 0 auto;
			height: 90px;
			box-sizing: border-box;
			/*border-left: 1px solid red;
			border-right: 1px solid red;*/
			/*background-color: blue;    내용물이 들어올 공간*/
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		.header_content_logo{}
		.header_content_search {}
		.header_content_search_group{
			display: flex;
			align-items: center;
			background-color: #f2f3f5;
			border-radius: 2px;
		}
		.header_content_search_input{
			background-color: transparent;/*색깔을 투명으로 줬다.*/
			border-color: transparent;
			height: 44px;
			font-size: 13px;
			border-radius: 2px;
			padding: 10px 12px;
			outline: none; /*input태그 focus시 파랑테두리 삭제해준다.*/
		}
		.header_content_search_btn{
			border-color: transparent;
			background-color: transparent;
			width: 44px;
			height: 44px;
			cursor: pointer;
			color: #FCBE32;
			border-top-right-radius: 2px;/*돋보기에 커서올렸을때 오르쪽모서리만 둥글게 해주는기능*/
			border-bottom-right-radius: 2px;
		}
		.header_content_search_btn:hover{
			background-color: #FCBE32;
			color: white;
		}
		.header_content_nav{ /*파는 제품목록이 가로로 붙게하는 방법*/
			display: flex;
			align-items: center;
			justify-content: space-between;
			width: 280px;
		}
		.header_content_nav > div {/*w제품목록 빨간줄로 나누기*/
			/* border: 1px solid red; */
			padding: 10px 0;

		}
		.header_content_member{
			/*width: 160px;*/ /*주석처리하면 쇼핑카트 들어가도 로그인창이 안깨진다.*/
			display: flex;/*가로로 붙음 로그인과 회원가입이  플렉스는 디폴트가 가로*/
			justify-content: space-between;
			align-items:center;
			flex-direction: row;/*default(생략가능)*/
		}
		.header_content_member > div{
			padding: 10px 0px 10px 3px;
		}
		.header_content_dropdown_group{
			position: relative;
		}
	
		.header_content_dropdown_group > a{
			padding: 12px 15px;
			font-weight: 400;
			border: 1px solid transparent;
			border-radius: 2px;
			height: 45px;
			color: #506763;
			line-height: 19px;
			display: inline-block;
		}
	
		.header_content_dropdown_wrap:hover > div > a,/*호버 한번에 두개 주는법*/
		.header_content_member_cart:hover > a {
			background-color: rgba(20,23,28,.05);
			border-color: rgba(20,23,28,.05);
		}
		.header_content_dropdown_wrap:hover .header_dropdown{
			display: block;
		}
		.header_content_member_cart > a{
			display: inline-block;
			width: 45px;
			height: 45px;
			border-radius: 50%;
			color: #506763;
			border: 1px solid transparent;
			text-align: center;
			padding: 12px;
			line-height: 19px;
		}
		
		.header_content_logo_img{
			max-width: 90px;
			vertical-align: middle;
		}
		.header_content_logo_text{
			font-size: 25px;
			font-weight: bold;
			vertical-align: middle;
			font-family: 'Noto Sans KR', sans-serif;
		}
		.header_dropdown_menu{
			border-bottom-left-radius: 2px;
			border-bottom-right-radius: 2px;
			box-shadow: 0 4px 16px rgba(20,23,28,.25);
			background-color: white;
			padding: 10px 0;
		/*	display: none;  이거 있으면 마이페이지 꼬리만나오고 아래 창은 안나온다.*/

		}
		.header_dropdown_menu a{
			display: inline-block;
			font-size: 15px;
			color: #505763;
			text-align:center;
			padding: 5px 15px;
			font-weight: 400;
			width: 130px;
			position: relative;
			z-index: 100;
		}		
		.header_dropdown_menu a:hover{
			color: #007791;
			background-color: #f2f3f5;
		}
		.header_dropdown{
			position: absolute;
			top: 52px;
			left: 0;
			display: none;

		}
		.arrow{
			position: absolute;
			top:-5px;
			left: 4px;
			width:15px;
			height: 15px;
			transform: rotate(45deg);
			background-color: white;
			border-color: transparent transparent #fff transparent;
			z-index: 99;
		}
		
		/* 모달 로그인 창*/
		.modal_wrap{
			position: fixed;
			z-index: 1000;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width: 100%;
			height: 100%;
			display: flex;/* 이줄포함 밑 두줄 모달창 가운데로 오게 해준다.*/
			justify-content: center;
			align-items: center;
			display: none;
		}
		.modal_content{
			position: relative;
			width: 500px;
			height: 714.72px;
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
				0 4px 20px 0 rgba(0,0,0,0.19);
				border-radius: 2px;
				overflow: hidden;
				padding: 28px 0;
		}
		div#content_layout{
			width: 414px;
			margin: 0 auto;
		}
		div#header_div{
			width: 240px;
			margin: 62px auto;
		}
		div.div_input{
			background-color: white;
			border: 1px solid #badada;
			width: 408px;
			height: 46px;
			margin-bottom: 14px;
			padding: 10px 35px 10px 15px;
			position: relative;
		}
		span.input_box{
			display: block;
			overflow: hidden; /*사이즈를 정해놓고 그 이상 넘어버리면 숨기는것*/
		}
		input.input_login{
			border-width: 0px;
			width: 356px;
			padding:7px 0px 6px 0px;
		}
		a#btn_login{
			display: block;
			background-color: #747474;
			color: white;
			font-size: 22px;
			width: 408px;
			height: 59px;
			text-align: center;글자 가운데 정렬
			padding-top: 2px;
			line-height: 61px;
			text-decoration: none;
			margin: 30px 0px 13px 0px;
		}
		.btn_type{
			display: block;/*사이즈 줄수있는데 가로 다 내꺼*/
			background-color: #747474;
			color: white;
			font-size: 22px;
			width: 408px;
			height: 59px;
			text-align: center;/*글자 가운데 정렬*/
			padding-top: 2px;/*안쪽여백 윗쪽*/
			line-height: 61px;/*글자가 가운데 정렬된다.//heigt랑 같은값을 주면됨 (패딩 탑2 가 있어서 2를 더해서 준다.)*/
			text-decoration: none;
			margin: 30px 0px 13px 0px;/*시계방향으로 상우하좌*/
		}

		table{
			width: 100%;
		}
		#state{
			font-size: 13px;
			position: relative;
		}
		td{
			height: 26px;
		}
		#state > label{
			background:url('${path}/resources/image/NAVER/check_off.gif') no-repeat;
			display: block;
			height: 26px;
			line-height: 26px;
			padding-left: 30px;

		}
		#state > input{
			/*visibility: hidden;*/
			position: absolute;
			right: 1px;
			width: 331px;
			height: 22px;
			margin-top: 1px;
		}

		#state > input:checked + label{
			background-image: url('${path}/resources/image/NAVER/check_on.gif');
		}

		#secure{
			text-align: right;
			font-size: 12px;
		}

		#ip_ud{
			color: #747474;
		}
		/*#ip_ud:hover{
			text-decoration: none;
		}*/
		#off{
			display: inline-block;
			font-weight: bold;
			width: 22px;
			text-align: left;
			color: #747474;
			cursor:pointer;
		}
		.si{
			color: #d5d5d5;
		}
		#login_ud > a{
			text-decoration: underline;
			color: #747474;
		}
		#secure img{
			/*수직정렬
			: display가 inline 또는 inline-block일 때만 사용 가능
			: baseline, sub, super, middle, top, bottom 등*/
			vertical-align: bottom;

		}
		hr{
			width: 98%;
			margin: 20px auto;
			border: thin solid #eaeaea;
		}
		div#member{
			color: #8c8c8c;
			font-size: 12px;
			text-align: center;
		}
		
		
		img#naver_img{
			width: 460px;
			display: block;
			margin: 47px 0px 15px 0px;
		}
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
			color: #FCBE32;
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
			color: #FCBE32;
		}
		.title h1{
			display: block;
			clear: both;
			margin: 0 0 10px;
			font-size: 35px;
			text-align: center;
			font-weight: 400;
			color: #333;
			letter-spacing: -0.03em;
		}
		.title span{
			display: block;
			clear: both;
			margin: 0 0 30px;
			text-align: center;
			font-size: 12px;
			font-weight: 400;
			color: #999;
			letter-spacing: -0.03em;
		}
		a#btnface{
			display: block;
			background: #536fac;
			color: white;
			font-size:15px;
			width: 388px;
			height: 52px;
			text-align: center;
			padding-top: 1px;
			line-height: 61px;
			text-decoration: none;
			margin:30px 0px 13px 13px;
		}
		a#btnkaka{
			display: block;
			background: #fae100;
			color: black;
			font-size:15px;
			width: 388px;
			height: 52px;
			text-align: center;
			padding-top: 1px;
			line-height: 61px;
			text-decoration: none;
			margin:-7px 0px 13px 13px;
		}
		.login_close{
			position: absolute;
			top: 7px;
			right: 7px;
		}
		.login_close > button {
			color: rgb(142, 142, 142);
			border: none;
			background: white;
			font-size: 30px;
			cursor: pointer;
			outline: none;
		}
		.login_close > button:hover{
			color: #eba444;
		}
		.pw_eye{
			position: absolute;
			color: #aaa;
			font-size: 17px;
			top: 15px;
			right: 7px;
			cursor: pointer;
			height: 45px;
			line-height: 45px;
			width: 30px;
			text-align: center;
		}
		
	</style>

</head>
<body>
<body>
	<div class="modal_wrap">
		<div class="modal_content">
			<div class="login_close">
				<button><i class="fas fa-times"></i></button>
			</div>
			<div id="content_layout">
		<header>
			<div class="title">
			 <h1>LOGIN</h1>
			 <span>WELCOME BACK</span>
			<div id="header_div">
				
		    </div>
			</div>
		</header>
		<section>
			<form class=frm_login>
			<div class="div_input" id="naver_id">
				<span class="input_box">
					<input type="text" placeholder="아이디" id="login_id" class="input_login" required>
					
				</span>
			</div>
			<div class="div_input" id="naver_pw">
				<span class="input_box">
					<input type="password" placeholder="비밀번호" id="login_pw" class="input_login" required minlength="6" maxlength="18">
					<span class="pw_eye"><i class="fas fa-eye-slash"></i></span>
				</span>
				
			</div>
			
			<div>
				<!-- <a id="btn_login" href="#">로그인</a> -->
				<button type="submit" class="btn_type">로그인</button> <!--앵커태그 버튼으로 바꾸기-->
			</div>
			</form>
			<div>
				<table>
					<tr>
						<td id="state">
							<input type="checkbox" id="loginck">
							<label for="loginck" class="label1">
								&nbsp로그인상태유지
							</label>
						</td>
						<td id="secure">
							<span id="ip_ud"><a href="#">IP보안</a></span>
							<span id="off">OFF</span>&nbsp;<!--여백줄때 사용-->
							<span class="si">|</span>&nbsp;
							<span id="login_ud"><a href="#">일회용 로그인</a></span>&nbsp;
							<!-- <img src="../Img/NAVER/help.png"> -->
						</td>
					</tr>
				</table>
			</div>
			<div><hr></div>
			<div id="member">
				<a href="#">아이디 찾기</a>&nbsp;<span class="si"> | </span>&nbsp;
				<a href="#">비밀번호 찾기</a>&nbsp;<span class="si"> | </span>&nbsp;
				<a href="../include/yellow_join.html">회원가입</a>
				
			</div>
		</section>
		<aside>
			<div class="snsArea">
				<a id="btnface" href="#"><i class="fab fa-facebook-square"></i>
				페이스북 로그인</a>
				<a id="btnkaka" href="#"><i class="fas fa-comment"></i>


				카카오톡 로그인</a>			
			</div>
		</aside>
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
						<img id="addr_logo" src="${path}/resources/image/small-레알본옐로_1.png">
						</a>
					</span>
					<!-- <span>Copyright</span>
					<span>@</span>
					<span><strong><a href="#">NAVER Corp.</a></strong></span>
					<span>All Rights Reserved.</span>
				 -->
				</div>

			</div>
		</footer>
		
	</div>

			
	    </div>
	</div>







	<header>
		<div class="header_wrap">
			<div class="header_content">
				<div class="header_content_logo">
					<a href="#">
					<img class="header_content_logo_img" src="${path}/resources/image/노란알약찐.png">
					<span class="header_content_logo_text">노란알약</span>
					</a>
				</div>
				<div class="header_content_search">
					<form name="frm_search" action="" method="GET"  style="margin: 0px;">
						<div class="header_content_search_group">
							<input type="text" placeholder="제품명을 입력하세요" name="keyword" class="header_content_search_input">
							<button type="button" class="header_content_search_btn"><i class="fas fa-search"></i></button><!--돋보기모양 가져오기-->
						</div>
						
					</form>
			    </div>
				<div class="header_content_nav">
									
				
				
				<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
						  <a href="#">비타민</a>
						  <div class="header_dropdown">
						  	<div class="arrow"></div>
						    <ul class="header_dropdown_menu">
							   <li><a href="#">효모비타민</a></li>
						       <li><a href="#">비타민D</a></li>
							   <li><a href="#">마그네슘B6</a></li>
							   <li><a href="#">칼맥</a></li>							
						    </ul>
						  </div>
						</div>
					</div>

				<div class="header_content_dropdown_wrap">
					<div class="header_content_dropdown_group">
					  <a href="#">눈</a>
					  <div class="header_dropdown">
					  	<div class="arrow"></div>
					    <ul class="header_dropdown_menu">
						   <li><a href="#">루테인</a></li>
					       <li><a href="#">칸스토리</a></li>	
					       <li><a href="#">베타카로틴</a></li>													
					    </ul>
					  </div>
					</div>
				</div>
				
				<div class="header_content_dropdown_wrap">
					<div class="header_content_dropdown_group">
					  <a href="#">간</a>
					  <div class="header_dropdown">
					  	<div class="arrow"></div>
					    <ul class="header_dropdown_menu">
						   <li><a href="#">밀크씨슬</a></li>
					       <li><a href="#">마칸</a></li>													
					    </ul>
					  </div>
					</div>
				</div>

				<div class="header_content_dropdown_wrap">
				    <div class="header_content_dropdown_group">
				 	    <a href="#" class="magicline">커뮤니티</a>					
					    <div class="header_dropdown">
						    <div class="arrow"></div>
						    <ul class="header_dropdown_menu">
							   <li><a href="#">구매후기</a></li>
						       <li><a href="#">자유게시판</a></li>							   
							   <li><a href="#">질문게시판</a></li>							
						    </ul>
				        </div>
				    </div>
				</div>
				</div>
				
				<div class="header_content_member">
					<div class="header_content_dropdown_wrap">
						<div class="header_content_dropdown_group">
						  <a href="#">마이페이지</a>
						  <div class="header_dropdown">
						  	<div class="arrow"></div>
						    <ul class="header_dropdown_menu">
							   <li><a href="#">구매내역</a></li>
						       <li><a href="#">위시리스트</a></li>
							   <li><a href="#">회원정보수정</a></li>
							   <li><a href="#">고객센터</a></li>
							   <li><a href="#">탈퇴하기</a></li>							
						    </ul>
						  </div>
						</div>
					</div>
					<div>
						<div class="header_content_member_cart">
							<a href="#"><i class="fas fa-shopping-cart"></i></a>
						</div>
					</div>
					<div><button type="button" class="btn btn-basic login_open">로그인</button></div>
					<a href="../include/yellow_constract.html"><div><button type="button" class="btn btn-primary">가입하기</button></div></a>

				<!-- 	<a href="#">로그인</a>
					<a href="#">회원가입</a> -->
				</div>
			</div>
		</div>
	</header>
</body>


<script type="text/javascript">
		//jQuery문법
		//$('선택자'). 옵션();
		//$('#test').css('color', 'green');
		//$=jquery
		//('#test')= 선택자(id가 test)
		//.css()=옵션(글자색을 녹색);

		//jquery이벤트 문법(클릭, 포커스, 블러 등)
		//$(document).on('이벤트','선택자', function(){
		//		이벤트 발생시 동작할 내용들...	
		//});
		//$(document).on('click', '#test', funtion(){
		//  $(this).css('color', 'blue');
		//});
		//$(document).on() = 문서 전체에서~
		//('click') 	   = 클릭 이벤트가 발생하면
		//('#test')		   = 아이디가 test인
		//fuction(){}	   =익명함수(이름이 없는 함수)
		//$(this)		   =나 자신(여기서는 #test)
		//해석: 문서 전체에서 id가 test인 택르가 클릭되면
		//	나를(#test)글자색을 blue 로 변경해라!

		//로그인 input(id,pw)에 focus 되면 테두리색 변경
		// $(document).on('focus', '.div_input',function(){
		// 	$(this).css('border','1.5px solid #3885ca');
		// });
		// $(document).on('blur', '.div_input',function(){
		// 	$(this).css('border','1.5px solid transparent');
		// });

	//로그인 버튼 클릭시 모달창 열림
	$(document).on('click', '.login_open', function(){
		$('.modal_wrap').css('display', 'flex');
		$('#login_id').focus();

	});
	//모달창의 x버튼을 클릭하면 모달창 close
	$(document).on('click', '.login_close', function(){
		$('.modal_wrap').css('display', 'none');
		// $('.div_input').val('');
		$('.frm_login')[0].reset();
		$('.pw_eye').prev().attr('type', 'password');
		$('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
				   .css('color', '#aaa');

	});
	//login modal창 암호 보이기 또는 숨기기

	//값을 가져오는 방법
		//<span class = "aaa">동토리</span>
		//<input type = "text" class = "dobby">동비</input>
		//
		//input태그 값 가져오는 방법 
		//$('/dobby').val();
		//input태그 값 넣는 방법
		//$('.dobby'). val('메롱');

		//input태그 이외의 값 가져오는 방법
		//$('.aaa').text();
		//input태그 이외의 값 넣는 방법
		//$('.aaa').text('뭐시여?');

		//태그의 옵션(attribute)을 가져오고 싶을때
		//$('.dobby').attr('type');
		//$('.dobby').attr('class');

	$(document).on('click','.pw_eye', function(){
		var code = $(this).prev().attr('type');
		
		if(code == 'password'){
			$(this).prev().attr('type', 'text');
			$(this).html('<i class="fas fa-eye"></i>')
				   .css('color', '#666');
		}else{
			$(this).prev().attr('type', 'password');
			$(this).html('<i class="fas fa-eye-slash"></i>')
				   .css('color', '#aaa');
		}

	});
</script>

</body>
</html>