<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
		.include_modal_wrap{
			position: fixed;
			z-index: 1000;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width: 100%;
			height: 90%;
			display: none;
			justify-content: center;
			align-items: center;
			
		}
		.include_modal_content{
			position: relative;
			width: 400px;
			/* height:250px; */
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
						0 4px 20px 0 rgba(0,0,0,0.19);
			border-radius: 2px;
			overflow: hidden;
			padding: 28px 0;
			border-radius: 25px;
		}
		.include_title h1{
			display: block;
			clear: both;
			margin: 30px 0 10px;
			font-size: 20px;
			text-align: center;
			font-weight: 400;
			color: #333;
			letter-spacing: -0.03em;
		}
		.include_login_close{
			position: absolute;
			top: 7px;
			right: 7px;
		}
		.include_login_close > button {
			color: rgb(142, 142, 142);
			border: none;
			background: white;
			font-size: 30px;
			cursor: pointer;
			outline: none;
		}
		.include_login_close > button:hover{
			color: #eba444;
		}
		#include_btn_login{
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
		.include_btn_double_area{
			display: flex;
			align-items: center;
			justify-content: center;
		}
		.include_title p{
		display: block;
			clear: both;
			margin: 30px 0 10px;
			font-size: 15px;
			/* text-align: center; */
			font-weight: 400;
			color: #333;
			letter-spacing: -0.03em;
		}
		
</style>
</head>
<body>
	<div class="include_modal_wrap">
		<div class="include_modal_content">
			<div class="include_login_close">
				<button><i class="fas fa-times"></i></button>
			</div>
			<div id="include_content_layout">
				<div class="include_title">
			    	<h1 id="modal_msg_main_txt">가입성공</h1>			    
			   
		    	</div>	
		    	<div class="include_title">
		    	<p id="modal_msg_sub_txt"></p>
		    	</div>	
	    	</div>
	    	<div>	    	
				<button type="button" id="include_btn_login" >완료</button>				
			</div>
    	</div>
	</div>


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	
		$(function(){
			var id='${id}';
			var email='${email}';
			var key='${key}';
			
			var join_main_txt = id+'님 회원가입을 축하드립니다';
			var join_sub_txt = email + '으로 인증메일을 보냈습니다. 인증하세요';
			var auth_main_txt = id+ '님 이메일 인증되셨습니다.';
			var auth_sub_txt = '지금부터 사이트 활동이 가능합니다. 감사합니다.';
			
			if(key == 'join'){
				$('#modal_msg_main_txt').text(join_main_txt);//메인 텍스트
				$('#modal_msg_sub_txt').text(join_sub_txt);//서브텍스트
				$('#modal_msg_cancle').css('display','none');//취소버튼 제거
				$('.include_modal_wrap').css('display', 'flex');//모달창 출력
			}else if(key=='auth'){
				$('#modal_msg_main_txt').text(auth_main_txt);
				$('#modal_msg_sub_txt').text(auth_sub_txt);
				$('#modal_msg_cancle').css('display', 'none');
				$('.include_modal_wrap').css('display', 'flex');
			}
			$('#include_btn_login').on('click',function(){
				$('.include_modal_wrap').css('display', 'none');
			});
			$('.include_login_close').on('click',function(){
				$('.include_modal_wrap').css('display', 'none');
			});
		});
</script>
</html>