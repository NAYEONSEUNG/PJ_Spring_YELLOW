<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!-- 스프링 폼태그 쓸거면 이거 있어야 한다. -->
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/e272fd87da.js" crossorigin="anonymous"></script>
<link rel = "stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
			*{
			font-family: Dotum,'돋움',Helvetica,sans-serif;
			box-sizing: border-box;
		}
		body, h1, h3, h4, h5, h6, ul, p{
			margin: 0; padding: 0;			
		}
		body{ background-color: #f5f6f7; 
			  font-size: 12px;
		}
			
		ul{ list-style: none;}	
					
		a{
			text-decoration: none;
			color: inherit;
		}
		.wrap{
			width: 768px;			
			margin: 0 auto;
			
		}
		.header{
			padding: 62px 0px 20px;
			position: relative;
			
		}
		.n_logo{
			display: block;/* 마진으로 채우기 위해*/
			width: 216px;
			height: 44px;
			background: url("${path}/resources/image/img/sizechagejjin.png")0 -99px;
			margin: auto;/**/
		}
		.join_content{
			width: 460px;
			margin: 0 auto;
			
		}
		.row_group{
			overflow: hidden;
			width: 100%;
		}
		.join_title{
			margin: 19px 0 8px;
			font-size: 14px;
			font-weight: 700;
			color: black;
		}
		.ps_box{
			display: flex;
			align-items: center;
			position: relative;
			width: 100%;
			height: 51px;
			border-bottom: 2px solid #dadada;
			border-right: : 2px solid #dadada;
			padding: 10px 14px 10px 14px;
			background: #fff;
			vertical-align: top;
			border-radius: 10px;

		}
		.int_id{
			padding-right: 110px; 
		}
		.int_pass{
			padding-right: 40px;
		}
		.int{
			display: block;
			position: relative;
			width: 100%;
			height: 29px;
			padding-right: 25px;
			line-height: 29px;
			border: none;
			background: #fff;
			font-size: 15px;
			z-index: 10;
		}
		.step_url{
			position: absolute;
			right: 13px;
			font-size: 15px;
			color: #8e8e8e;
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
		.pw_lock{
			background-image: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
			background-repeat: no-repeat; 
			background-size: 125px 75px;
			cursor: pointer;
			width:24px;
			height: 24px;
			display: inline-block;
		}
		.pw_lock1{
			background-image: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
			background-repeat: no-repeat; 
			background-size: 125px 75px;
			cursor: pointer;
			width:24px;
			height: 24px;
			display: inline-block;
		}
		.repw_lock{
			background-image: url('https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png');
			background-repeat: no-repeat; 
			background-size: 125px 75px;
			cursor: pointer;
			width:24px;
			height: 24px;
			display: inline-block;
			background-position: -27px 0;
		}
		
		.btn-primary{
			color: white;
			background-color: #e9b616;
		}

		.btn_double_area{
			margin: 30px 0 9px;			
		}
		.btn_type{
			display: block;
			width: 100%;
			padding: 21px 0 17px;
			font-size: 20px;
			font-weight: 700;
			text-align: center;
			cursor: no-drop;
			border-radius:5px;
		}
	</style>
</head>
<body>
<form:form id="frm_member" modelAttribute="memberDTO" atuocomplete="on">
<div class="info_agree">
					<div class="join_content">
					<div class="row_group">

						<div class="join_row">
							<h3 class="join_title">

								<label for="id" >현재 비밀번호</label>							
							</h3>
							<span class="ps_box int_id join_info_box_content" >
								<input type="text" id="nowpw" name="id" class="join_info_box_input int" >
								<span class="step_url"><span class="pw_lock1"></span></span>
								<span class="step_url"></span>
							</span>
							<span class="join_err_msg">필수 정보입니다.</span>
						</div>
						 

						<div class="join_row">
							<h3 class="join_title">
							<label for="pswd1">수정할 비밀번호</label>
								
							</h3>
							<span class="ps_box int_pass join_info_box_content">
								<input type="text" id="upw" name="pw" class="int">
								<span class="step_url"><span class="pw_lock"></span></span>
							</span>
							<!-- <span class="join_err_msg">필수 정보입니다.</span> -->
						</div>

						<div class="join_row">
							<h3 class="join_title">
								<label for="pswd2">수정할비밀번호 재확인</label>								
							</h3>
							<span class="ps_box int_pass join_info_box_content">
								<input type="text" id="urpw" name="rpw" class="int">
								<span class="step_url"><span class="repw_lock"></span></span>
							</span>
							<span class="join_err_msg">필수 정보입니다.</span>
						</div>

					</div>
					<div class="btn_double_area">
							<button  type="button" id="btn_join" class="btn_type btn_agree">변경하기</button>
					</div>
					</div>
				</div>
</form:form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">

/* 	$(document).on('keyup', '#nowpw', function(){
		//console.log('ㅋㅋ');
		var nowpw = $(this).val();	
		//console.log('입력:'+ nowpw);
		var result = joinValidate.checkNowpw(nowpw);
		console.log("code:"+result.code);
		ckDesign(result.code, result.desc, 0, 0);
	}); */
	
	//$(document).ready(function(){//도큐멘트 레디펑션 안에 들어와있어야 쓸 수있다. 
	$(function(){// 약식으로 쓰는법 위랑 같다. 
		var pwFlag = false;
		
		var checkArr = new Array(2).fill(false);
		
		$('#nowpw').keyup(function(){
		
			//console.log('ㅋㅋ');
			var nowpw = $(this).val();	
			//console.log('입력:'+ nowpw);
			var result = joinValidate.checkNowpw(nowpw);
			console.log("code:"+result.code);
			ckDesign(result.code, result.desc, 0, 0);
			
			if(result.code == 100){
				checkArr[0] = true;
				$('.pw_lock1').css('background-position', '-54px 0');
			}else{
				checkArr[0] = false;
				$('.pw_lock1').css('background-position', '0 0');
			}
			
		});
		
		$('#upw').keyup(function(){// 전역변수를 만들었을때 공유할거냐 말거냐 
			//1. 사용자가 입력한 값 받기
			var nowpw = $.trim($('#nowpw').val());
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());
			// alert(pw+','+rpw);

			//2.유효성 체크하기
			var result = joinValidate.checkPw(nowpw, pw, rpw); //유효성체크는 joinValidate.checkPw여기서만 한다.
			if(result.code == 0 || result.code == 10 || result.code == 6){
				pwFlag = true;
			}else{
				pwFlag=false
			}
			ckDesign(result.code, result.desc, 1, 1);
			
			if(result.code == 10){
				checkArr[1] = true;
				$('.join_info_box_content:eq(2)').css('border', '2px solid #3885ca');				
			}else if(result.code == 6){
				checkArr[1] = false;
				$('.join_info_box_content:eq(2)').css('border', '2px solid #3885ca');				
			}else {
				checkArr[1] = false;
			}
			if(pwFlag){
				$('.pw_lock').css('background-position', '-54px 0');
			}else{
				$('.pw_lock').css('background-position', '0 0');
			}if(result.code == 10){
				$('.repw_lock').css('background-position', '-81px 0');
			}else{
				$('.repw_lock').css('background-position', '-27px 0');
			}
			
		});	
		//비밀번호 재확인 유효성 체크
		$('#urpw').keyup(function(){
			//var now = $.trim($('#nowpw').val());			
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());

			var result = joinValidate.checkRpw(pw, rpw, pwFlag);
			
			ckDesign(result.code, result.desc, 2, 1);
			if(result.code == 10){
				checkArr[1] = true;
				$('.join_info_box_content:eq(1)').css('border', '2px solid #3885ca');				
			}else if(result.code==6){
				checkArr[1] = false;
				$('.join_info_box_content:eq(1)').css('border', '2px solid #3885ca');				
			}else{
				checkArr[1] = false;
			}
			if(result.code == 10){
				$('.repw_lock').css('background-position', '-81px 0');
			}else{
				$('.repw_lock').css('background-position', '-27px 0');
			}
		});
		
		$('.int').keyup(function(){
			printCheckArr(checkArr);
			ckColorBtn();
		});
		
		function ckColorBtn(){
			var checkAll = true;
			for(var i = 0; i < checkArr.length; i++){
				if(!checkArr[i]){
					checkAll = false;
				}
			}
			if(checkAll){
				$('#btn_join').addClass('btn-primary');
				// $('#btn_join').prop('disabled', false);
				$('#btn_join').css('cursor', 'pointer');
			}else{
				$('#btn_join').removeClass('btn-primary');
				// $('#btn_join').prop('disabled', true);
				$('#btn_join').css('cursor', 'no-drop');
			} 
		}
		
		$('#btn_join').click(function(){
			//alert('클릭됨');
			var invalidAll = true;//invalidall이라는 변수 하나 만들어따. 트루값이 들어있다.
			for(var i = 0; i < checkArr.length; i++){
				if(!checkArr[i]){
					invalidAll = false;
					$('.join_err_msg:eq('+i+')').css('visibility','visible')
												.css('color','#d95339');
				}
			}
			if(invalidAll){
				$('#frm_member').submit();
			}else{
				alert('유효성체크를 진행해주세요!');
			}
		});
	});



	
 
	function ckDesign(code, desc, line, msg){//function은 독립된거니까 따로 나두어야 한다.
		if(code == 0 || code == 10 || code == 100){//통과O
			//테두리 색상변경
			$('.join_info_box_content:eq('+line+')').css('border', '2px solid #3885ca');//예) line이 2번
			//에러메시지출력
			$('.join_err_msg:eq('+msg+')').css('visibility', 'visible')//예) msg 1번
								    .text(desc)
								    .css('color','#3885ca');
			return true;
	
		}else{//0이면, 통과 O 
			//테두리색상변경
			$('.join_info_box_content:eq('+line+')').css('border', '2px solid #d95339');
			//에러메시지 
			$('.join_err_msg:eq('+msg+')').css('visibility', 'visible')
								    .text(desc)
								    .css('color','#d95339');
		   return false;
	
		}
	} 
	
   	//개발시 사용: 유효성체크 전체여부를 출력해주는 함수(true, false)
   	//재사용 하기 위해 메서드화 시킨것이다. 
	   function printCheckArr(checkArr){// 매개변수 보내주면 아래 배열로 해서 출력을 해준다. 
		   	for(var i=0; i<checkArr.length; i++){ // 자주 쓸거니까 메서드로 빼자.
				 console.log(i +'번지:' + checkArr[i]);
				}
		   }
			

</script>
</html>