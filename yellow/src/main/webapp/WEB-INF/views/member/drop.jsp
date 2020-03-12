<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type="text/css" href="${path}/resources/css/common.css">
<script src="https://kit.fontawesome.com/e272fd87da.js" crossorigin="anonymous"></script>
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
			background:url(${path}/resources/image/비번확인.png);
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
			/* background-color: #e9b616; */
			 cursor: no-drop; 
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
			height: 20px;
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
			cusor: no-drop;
		}
		.wrap_btn .btn_agree{
			width: 110px;
			height: 61px;
			border-radius:6px;
			/* cusor: no-drop; */
		}

		.idpw{
			/* display:flex; */
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
		/* 주의사항 */
			.info_agree{
			padding: 42px 50px 29px;
			overflow: hidden;
			border-top: 1px solid #e1e1e1;
			border-bottom: 1px solid #e1e1e1;
			background-color: #fbfbfb;
			margin-bottom: 20px;
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
		.info_user .tit_agree{
			display: block;
			margin-right: 30px;
			padding-top: 13px;
			font-size: 14px;
			line-height: 24px;
			letter-spacing: -1px;
		}
		.info_user .txt_agree{
			line-height: 22px;
		}
		.info_user .emph_g{
			color: #f56a4f;
		}
		.info_agree .check_notice{
			position: absolute;
			top: 32px;
			right: 37px;
		}
		.check_notice{
			position: relative;
			overflow: hidden;
		}

		.info_agree .tf_check{
			width: 30px;
			height: 30px;
		}
		.check_notice .tf_check{
			position: absolute;
			z-index: -1;
			top: 0;
			left: 0;
			width: 16px;
			height: 16px;
			border: 0; 
			opacity: .01;
		}
		.info_agree .tf_check{
			width: 30px;
			height: 30px;
		}
		.info_agree .lab_check{
			display: block;
			width: 30px;
			padding: 35px 0 0 0;
			overflow: hidden;
			text-align: center;			
		}
		.check_notice .lab_check{
			display: inline-block;
			padding-left: 26px;
			cursor: pointer;
		}
		.info_agree .ico_check{
			display: block;
			width: 30px;
			height: 30px;
			background-position: 0 -700px;
		}
		.lab_check .ico_comm{
			position: absolute;
			top: 0;
			left: 0;
			width: 16px;
			height: 16px;
			background-position: 0 300px;
		}
	
		.info_user > input{
			position: absolute;
			right: 1px;
			top: 50%
			width:22px;
			margin-top: -11px;
			visibility: hidden;
		}
		.info_user > label{
			background: url(${path}/resources/image/체크킴.png) 100% 50% no-repeat;
			display: block;
			line-height: 20px;
			height: 50px;
			top:-1px;
			font-size: 14px;
			font-weight: 700;
		}
		.info_user > input:checked + label{
			background-image: url(${path}/resources/image/체크끔.png)
		}
		.ul_li_span > input{
			position: absolute;
			right: 1px;
			top: 50%
			width:22px;
			margin-top: -11px;
			visibility: hidden;
		}
		.ul_li_span > label{
			background: url(${path}/resources/image/체크킴.png) 100% 50% no-repeat;
			display: block;
			line-height: 20px;
			height: 50px;
			top:-1px;
			font-size: 14px;
			font-weight: 700;
		}
		.ul_li_span > input:checked + label{
			background-image: url(${path}/resources/image/체크끔.png)
		}
		.join_err_msg{
			display: block;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: red;
			height: 15px;
			/*display: none;*/
			visibility: hidden;
		}


	</style>
</head>
<body>

<!-- 	<div class="modal_wrap">
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
	</div> -->
<%@ include file="../include/modal.jsp"%>
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
						<strong class="tit_agree">Yellow아이디는 재사용 및 복구 불가안내</strong>
						<input type="checkbox" id="cbox" class="ckboxs">
						<label for="cbox">
							<span class="txt_agree">
								회원탈퇴 진행 시 본인을 포함한 타인 모두
								<em class="emph_g">아이디 재사용이나 복구가 불가능합니다.</em>
								<br>
								      신중히 선택하신 후 결정해 주세요.					
							</span>
						</label>
					</span>
				</div>
				
				<div class="info_user">
					<strong class="tit_agree">내정보 및 개인형 서비스이용 기록 삭제 안내</strong>
					<input type="checkbox" id="cbox2" class="ckboxs">
					<label for="cbox2">
					<span class="txt_agree">
						내정보 및 개인형 서비스 이용기록이 모두 삭제되며,
						<em class="emph_g">삭제된 데이터는 복구되지 않습니다.</em>
						<br>
						      삭제되는 서비스를 확인하시고, 필요한 데이터는 미리 백업을 해주세요.					
					</span>
					</label>
				</div>

				<div class="info_user">
					<span class="ul_li_span">
						<strong class="tit_agree">게시판형 서비스에 등록한 게시글 삭제 불가 안내</strong>
						<input type="checkbox" id="cbox3" class="ckboxs">
						<label for="cbox3">
						<span class="txt_agree">
							삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.
							<br>
							탈퇴후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어,
							<br>
							<em class="emph_g">게시글을 임의로 삭제해드릴 수 없습니다.</em>							
						</span>
						</label>
					</span>

				</div>
				<!-- <span class="join_err_msg">필수 정보입니다.</span> -->
			</div>
				
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
<!-- 					<h3 class="join_title">
						<label for="id">아이디</label>								
					</h3>
						<span class="ps_box int_id">
							<input type="text" id="id" name="id" class="int">
							 <span class="step_url"></span>
						</span> -->
					<h3 class="join_title">
						<label for="pswd1">비밀번호</label>
									
					</h3>
					<span class="ps_box int_pass">
						<input type="text" id="pswd1" name="pswd1" class="int">
					</span>	
					<span class="join_err_msg">필수 정보입니다.</span>			
			   </div>	
			</div>	
		</form>	
		<span class="join_err_msg">필수 정보입니다.</span>	
		<div class="wrap_btn">
					<div class="btn_double_area">											
						<!-- <span><a href="../include/header2.html" class="btn_type btn_default">뒤로가기</a></span> -->

						<button type="button" class="btn_type btn_default btn_back ">뒤로가기</button>

						<!-- <span><a href="#" class="btn_type btn_agree">탈퇴하기</a></span> -->
						<button type="button" class="btn_type btn_agree btn_bye" id="drop_yes">탈퇴하기</button>
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
							<img id="addr_logo" src="${path}/resources/image/small-레알본옐로_1.png">
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
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">

/* 		//모달창의 x버튼을 클릭하면 모달창 close
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
	}); */
	
	//$(document).on('keyup', '#pswd1', function(){
	$(function(){
		
		/* var checkArr = false; //체크박스 없으면 이렇게 하기 */
		var checkArr= new Array(2).fill(false);	
	
		$('#pswd1').keyup(function(){  // 이 스크립트는 이 페이지 안에서만 동작이 가능하다. 페이지 이동 안하게 뒷문으로 몰래갔다가 다시오게 해야한다.
			var pw = $(this).val();
			//console.log(pw);
			//return 4개 중에 1개(0, 1, 6, 100)
														// var result에 담아준다.
			var result = joinValidate.checkNowpw(pw)   //joinvalidate사용할거고 checknowpw메서드 호출 메서드 가서 보니까 매개변수 pw를 달라고 한다 그래서 적는다 괄호안에
			console.log(result.code + ","+result.desc)
			
			var color = '';
			if(result.code == 100){
				color = '#3885ca';
				checkArr[0] = true;
				/* checkArr = true;//체크박스 없을때 */
			}else{
				color = '#d95339'
				checkArr[0] = false;
				/* checkArr = false;//체크박스 없을때 */
			}
			$('.join_err_msg:eq(0)').css('visibility','visible')
												.text(result.desc)
												.css('color',color);
			ckColorBtn();  // 버튼색깔 쓸수있게 호출
		});	
		
		$('.ckboxs').click(function(){
				var ckLen = $('.ckboxs:checkbox:checked').length;
				if(ckLen == 3){
					checkArr[1] = true;
					$('.join_err_msg:eq(1)'). css('visibility','hidden');
				}else{
					checkArr[1] = false;
				}
				ckColorBtn();
			});
		
	/* 버튼 불들어오게 */
		function ckColorBtn(){
				var checkAll = true;
				for(var i = 0; i < checkArr.length; i++){
					if(!checkArr[i]){
						checkAll = false;
					}
				}
				if(checkAll){
					$('#drop_yes').addClass('btn-primary');
					// $('#btn_join').prop('disabled', false);
					$('#drop_yes').css('cursor', 'pointer');
				}else{
					$('#drop_yes').removeClass('btn-primary');
					// $('#btn_join').prop('disabled', true);
					$('#drop_yes').css('cursor', 'no-drop');
				} 
			}
			$('#drop_yes').click(function(){
				
/* 				if(checkArr == false){
					$('.join_err_msg:eq(0)').css('visibility', 'visible')
				}else {
					//모달창 온
				} */
/* 				for(var i = 0; i < checkArr.length; i++){
					if(!checkArr [i]){
						checkAll = false;
					}
				}
				if(checkAll){
					alert('탈퇴하자');
				}else{
					alert('유효성체크 하소');
				} */
				var checkAll = true;
				for(var i=0; i < checkArr.length; i++){
					if(checkArr[i] == false){
						$('.join_err_msg:eq('+i+')'). css('visibility','visible');
						checkAll = false;
					}
				}
				if(checkAll){
					$('.include_modal_wrap').css('display','flex');
				}else{
					return false;
				}
		
		});		
			$('#include_btn_login').click(function(){
				location.href='${path}/member/dropAction';			
			});
	});
	


</script>
</html>