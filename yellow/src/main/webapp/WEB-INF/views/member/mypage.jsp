<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		/* Header */
		div.header_wrap {
			width: 100%;
			background-color: white;
			/*box-shadow: 0 0 1px 1px rgba(20,23,28,.1), 0 3px 1px 0 rgba(20,23,28,.1);*/
			z-index: 999;
		}
		div.section_wrap {
			width: 800px;
		    display: block;
		    text-align: center;
		    margin: 70px auto 20px auto;
		    position: relative;
		}
		div.header_content {
			width: 100%;
			height: 60px;
			margin: 0 auto;
			padding-left: 80px;
			padding-right: 20px;
			box-sizing: border-box;
			border-top: 4px solid #FF8C94;
			border-bottom: 1px solid #d4d4d4;
			display: flex;
			justify-content: space-between; /* 가로여백 똑같이 맞추겠다 */
			align-items: center; /* 세로 가운데 맞추겠다(수평병렬) */
		}
		div.section_content_title {
			text-align: left;
			border-bottom: 1px solid #d6d6d6;
		}
		.header_content_title > h1, .section_content_title > h1 {
			font-weight: normal;
			font-size: 18px;
		}
		.header_content_search_group {
			display: flex;
			align-items: center;
			background-color: #f2f3f5;
			border-radius: 2px;
		}
		.header_content_search_input {
			background-color: transparent;
			border-color: transparent;
			height: 44px;
			font-size: 13px;
			border-radius: 2px;
			padding: 10px 12px;
			outline: none; /* input태그 Focus시 파랑테두리 */
		}
		.header_content_search_btn {
			border-color: transparent;
			background-color: transparent;
			width: 44px;
			height: 44px;
			cursor: pointer;
			color: #FCBE32;
			border-top-right-radius: 2px;
			border-bottom-right-radius: 2px;
		}
		.header_content_search_btn:hover {
			background-color: #FCBE32;
			color: white;
		}
		.header_content_nav {
			display: flex;
			align-items: center;
			justify-content: space-between;
			width: 220px;
		}
		.header_content_member {
			/* width: 160px; */
			display: flex;
			align-items: center;
			justify-content: space-between; /* margin으로 미는것보다 flex로 미는게 더 쉽다 */
			flex-direction: row; /* default(생략가능) */
		}
		.header_content_member > div {
			padding: 10px 6px 10px 6px;
		}
		.header_content_nav > div {
			padding: 10px 0;
		}
		.section_wrap {
			line-height: 1.5;
			font-family: '맑은 고딕','Malgun Gothic','Apple SD Gothic Neo',sans-serif,'돋움',dotum;
			color: #1e1e1e;
			font-size: 14px;
			letter-spacing: -1px;
		}
		.section_content_secession {
			text-align: center;
    		padding-top: 20px;
		}
		.section_container > h1 {
			font-weight: normal;
			font-size: 24px;
		}
		.main_info_wrap {
			display: flex;
			justify-content: center;
		}
		.sub_info_box {
			display: flex;
			justify-content: space-between;
		}
		.tb_pic_box {
			width: 100px;
			height: 100px;
			margin-right: 50px;
		}
		.tb_pic {
			background-image: url("../../yellow/img/닥트리오.png");
			background-repeat: no-repeat;
			width: 100px;
			height: 100px;
			position-position: center center;
			background-size: 100%;
			border-radius: 50%;
		}
		.info_title {
			margin-top: 10px;
			margin-bottom: 5px;
			text-align: left;
		}
		.tb_id {
			margin-top: 10px;
			width: 272px;
			height: 22px;
			font-weight: bold;
			line-height: 100%;
			text-align: left;
		}
		.tb_info_box {
			margin-left: 10px;
			/*margin: 0px auto;*/
			width: 304px;
			height: 40px;
			line-height: 40px;
			padding: 0 15px;
			border-bottom: 1px solid #d4d4d4;
			/*border-radius: 3px;*/
			text-align: left;
		}
		.tb_pw_input {
			margin-top: 8px;
			border: none;
			outline: none;
			background-color: #f5f6f7;
			width: 272px;
			height: 22px;
		}
		.section_footer {
			display: flex;
			justify-content: center;
			margin-top: 33px;
			padding-top: 30px;
			border-top: 1px solid #d4d4d4;
		}
		.tb_btn {
			font-size: 14px;
			font-weight: bold;
			border-radius: 4px;
		    border: 1px solid #b6b6b6;
		    text-align: center;
		    background-color: #fafafa;
		    color: #222;
		    display: inline-block;
		    width: 142px;
		    min-width: 118px;
		    padding: 11px;
		}
		.cancel_btn {
			margin-right: 10px;
		}
		.cancel_btn:hover {
			text-decoration: underline;
		}
		.confirm_btn {
			color: white;
			background-color: #FCBE32;
		}
		.confirm_btn:hover {
			text-decoration: underline;
			background-color: #FCBE32;
		}
		div.section_footer > a {
			border: 1px solid #b6b6b6;
		}
	</style>
</head>
<body>
<div class="wrap">
		<header>
<!-- 			<div class="header_wrap"> wrap이나 container가 가장 큰 박스를 말함
	<div class="header_content"> header_ 쓰는이유: include할 때 충돌 안나라고(디자인 다 깨짐)
		<div class="header_content_title">
			<h1>
				<a href="https://accounts.kakao.com/weblogin/account" id="kakaoServiceLogo" class="link_logo">
		     					<span class="service_kakao">계정</span>
		    				</a>
			</h1>
		</div>
		<div class="header_content_member">
			<div>
				<a href="https://cs.kakao.com/helps?service=52&amp;locale=ko" class="link_help">도움말</a>
			</div>
			<div>
				<a href="https://cs.kakao.com/requests?locale=ko" class="link_help">문의하기</a>
			</div>
		</div>
	</div>
</div> -->
		</header>
		<section>
			<div class="section_wrap">
				<div class="section_content">
					<div class="section_content_title">
						<h1>내 정보</h1>
					</div>
					<div class="section_content_secession">
						<!-- <div class="section_container">
							<h1>회원님의 소중한 정보 보호를 위해 현재 비밀번호를 확인해 주세요.</h1>
						</div> -->
						<form>
							<div class="main_info_wrap">
								<div class="tb_pic_box">
									<div class="tb_pic"></div>
								</div>
								<div class="main_info_box">
									<div class="sub_info_box">
										<div class="info_title">아이디</div>
										<div class="tb_info_box">
											<span>mrblack</span>
										</div>
									</div>
									
									<div class="sub_info_box">
										<div class="info_title">이름</div>
										<div class="tb_info_box">
											<span>나연승</span>
										</div>
									</div>

									<div class="sub_info_box">
										<div class="info_title">전화번호</div>
										<div class="tb_info_box">
											<span>010-3791-5216</span>
										</div>
									</div>

									<div class="sub_info_box">
										<div class="info_title">이메일</div>
										<div class="tb_info_box">
											<span>blackpulv@gmail.com</span>
										</div>
									</div>

									<div class="sub_info_box">
										<div class="info_title">주소</div>
										<div>
											<div class="tb_info_box">
												<span>62298</span>
											</div>
											<div class="tb_info_box">
												<span>광주광역시 광산구 신가동</span>
											</div>
											<div class="tb_info_box">
												<span>975-3</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="section_footer">
								<div><button type="button" class="tb_btn cancel_btn">회원정보수정</button></div>
								<div><button type="button" class="tb_btn confirm_btn">비밀번호변경</button></div>
								<div><button type="button" class="tb_btn confirm_btn">회원탈퇴</button></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>