<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		body, input{
			font-size: 12px;
			font-family: '돋움',dotum,sans-serif;
			line-height: 1.5;
			color: #333;
		}
		em{
			font-style: normal;
			font-weight: normal;
		}
		#daumContent{
			width: 978px;
			overflow: hidden;
			margin: 0 auto;
		}
		.intro_out .cont_intro{
			padding-top: 53px;
		}
		.myinfo_intro .cont_intro{
			float: left;
			/*padding-top: 37px;*/
		}
		.myinfo_intro{
			width: 100%;
			overflow: hidden;
			height: 147px;
		}
		.intro_out .bg_intro{
			width: 130px;
			background-position: -160px -600px;
		}
		.myinfo_intro .bg_intro{
			float:left;
			width: 154px;
			height: 147px;
		}
		.intro_out .tit_outagree{
			width: 620px;
			background-position: 0 -1565px;
		}
		.myinfo_intro .tit_comm{
			height: 34px;
			margin-bottom: 28px;
		}
		.tit_comm{
			display: block;
			overflow: hidden;
			background:url(../../img/비번확인.png);
			text-indent: -9999px;
		}
		.info_agree{
			padding: 42px 50px 29px;
			overflow: hidden;
			border-top: 1px solid #e1e1e1;
			border-bottom: 1px solid #e1e1e1;
			background-color: #fbfbfb;
		}
		.info_agree .info_user{
			position: relative;
			width: 793px;
			margin-bottom: 20px;
			padding: 27px 37px 40px 45px;
			overflow: hidden;
			border: 1px solid #dfdfdf;
			background-color: #fff;
			color: #444;
		}

		.btn_type{
			width: auto;
			margin:0px 5px;
			font-size: 17px;
			font-weight: 600;
			line-height: 61px;
			/*display: block;*/
			box-sizing: border-box;
			height: 61px;
			/*padding: 16px 16px;*/
			text-align: center;
			text-decoration: none;
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
		.join_title{
			margin: 18px;
			font-size: 14px;
			font-weight: 700;
			color: black;
		}
		.ps_box{
			display: flex;
			align-items: center;
			position: relative;
			width: 30%;
			height: 9px;
			border: 1px solid #dadada;
			padding: 10px 14px 10px 14px;
			background: #fff;
			vertical-align: top;

		}
		.int{
			display: block;
			position: relative;
			width: 100%;
			height: 21px;
			padding-right: 25px;
			line-height: 29px;
			border: none;
			background: #fff;
			font-size: 15px;
			z-index: 10;
		}
		.wrap_btn{
			width: : 100%;
			padding: 23px 0 70px;
			overflow: hidden;
			text-align: center;
		}
		.wrap_btn .btn_default{
			width: 110px;
			height: 61px;
			margin-right: 2px;
			background-position: -100px -360px;
			border-radius:6px;
			cursor: pointer;
		}
		.wrap_btn .btn_agree{
			width: 110px;
			height: 61px;
			border-radius:6px;
			cursor: pointer;
		}

		.idpw{
			display:flex;
			align-items: center;
			justify-content: center;
		}
		.join_title{
			margin: 18px;
			font-size: 14px;
			font-weight: 700;
			color: black;
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
		.modal_wrap{
			position: fixed;
			z-index: 1000;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width: 100%;
			height: 80%;
			display: none;/* 이줄포함 밑 두줄 모달창 가운데로 오게 해준다.*/
			justify-content: center;
			align-items: center;
			
		}
		.modal_content{
			position: relative;
			width: 400px;
			height: 190.72px;
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
						0 4px 20px 0 rgba(0,0,0,0.19);
			border-radius: 2px;
			overflow: hidden;
			padding: 28px 0;
			border-radius: 25px;
		}
		.title h1{
			display: block;
			clear: both;
			margin: 30px 0 10px;
			font-size: 30px;
			text-align: center;
			font-weight: 400;
			color: #333;
			letter-spacing: -0.03em;
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
		a#btn_login{
			display: block;/*사이즈 줄수있는데 가로 다 내꺼*/
			background-color: #eba444;
			color: white;
			font-size: 17px;
			width: 190px;
			height: 59px;
			text-align: center;/*글자 가운데 정렬*/
			padding-top: 2px;/*안쪽여백 윗쪽*/
			line-height: 61px;/*글자가 가운데 정렬된다.//heigt랑 같은값을 주면됨 (패딩 탑2 가 있어서 2를 더해서 준다.)*/
			text-decoration: none;
			margin: 52px 0px 13px 105px;/*시계방향으로 상우하좌*/
			border-radius:6px;
		}
		.btn_double_area{
			display: flex;
			align-items: center;
			justify-content: center;
		}

	</style>
</head>
<body>
		<div class="modal_wrap">
		<div class="modal_content">
			<div class="login_close">
				<button><i class="fas fa-times"></i></button>
			</div>
			<div id="content_layout">
				<div class="title">
			    	<h1>정말 탈퇴 하시겠습니까?</h1>
			    
			    <div id="header_div">					    		
			   	</div>			   
		    	</div>		
	    	</div>
	    	<div>
				<a id="btn_login" href="../include/header2.html">탈퇴완료</a>
			</div>
    	</div>
	</div>






	<div id="daumContent" role="main">
		<div class="myinfo_intro intro_out">
			<span class="bg_intro"></span>
			<div class="cont_intro">
				<h3 class="tit_comm tit_outagree">회원탈퇴에 앞서 유의사항 및 안내를 반드시 읽고 진행해 주세요!</h3>				
			</div>
		</div>

		<form action="frm_withdrawal" action="" method="post">
			<div class="info_agree">
				<div class="info_user">
					<span class="ul_li_span">
						<strong class="tit_agree">비밀번호 확인 후 아이디는 즉시 탈퇴됩니다.</strong>						
							<span class="txt_agree">
								탈퇴 후에는 동일 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없으니 신중하게 선택해 주세요.
								<em class="emph_g"></em>											
							</span>						
					</span>
				</div>
				<div class="idpw">
					<h3 class="join_title">
						<label for="id">아이디</label>								
					</h3>
						<span class="ps_box int_id">
							<input type="text" id="id" name="id" class="int">
							 <span class="step_url"></span>
						</span>
					<h3 class="join_title">
						<label for="pswd1">비밀번호</label>
									
					</h3>
					<span class="ps_box int_pass">
						<input type="password" id="pswd1" name="pswd1" class="int">
						<span class="step_url">
							<span class="pw_lock"></span>
						</span>						
					</span>	
			   </div>	
			</div>	
		</form>	
		<div class="wrap_btn">
					<div class="btn_double_area">											
						<!-- <span><a href="../include/header2.html" class="btn_type btn_default">뒤로가기</a></span> -->

						<button type="button" class="btn_type btn_default btn_back ">뒤로가기</button>

						<!-- <span><a href="#" class="btn_type btn_agree">탈퇴하기</a></span> -->
						<button type="button" class="btn_type btn_agree btn_bye">탈퇴하기</button>
					</div>
			</div>						
	</div>
			
       	
 
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
</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

		//모달창의 x버튼을 클릭하면 모달창 close
	$(document).on('click', '.login_close', function(){
		$('.modal_wrap').css('display', 'none');
		// $('.div_input').val('');
		$('.frm_login')[0].reset();
		$('.pw_eye').prev().attr('type', 'password');
		$('.pw_eye').html('<i class="fas fa-eye-slash"></i>')
				   .css('color', '#aaa');

	});

		//로그인 버튼 클릭시 모달창 열림
	$(document).on('click', '.btn_bye', function(){
		$('.modal_wrap').css('display', 'flex');
		$('#login_id').focus();

	});

	//뒤로가기 누르면 헤더로 가기
	$(document).on('click','.btn_back' ,function(){
		location.href='../include/yellow_withdrawal.html';
	});
</script>
</html>