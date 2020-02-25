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
			display: flex;
			justify-content: center;
			align-items: center;
			
		}
		.include_modal_content{
			position: relative;
			width: 400px;
			height: 225px;
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
			font-size: 30px;
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
			    	<h1>정말 탈퇴 하시겠습니까?</h1>			    
			    <div id="include_header_div">					    		
			   	</div>			   
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

		//모달창의 x버튼을 클릭하면 모달창 close
	$(document).on('click', '.include_login_close', function(){
		$('.include_modal_wrap').css('display', 'none');
		// $('.div_input').val('');
		$('.include_frm_login')[0].reset();
		$('.include_pw_eye').prev().attr('type', 'password');
		$('.include_pw_eye').html('<i class="fas fa-eye-slash"></i>')
				   .css('color', '#aaa');

	});
</script>
</html>