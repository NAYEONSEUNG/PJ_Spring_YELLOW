<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더추가 ㄴㄴ 디자인만 ㄱㄱ -->
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/e272fd87da.js" crossorigin="anonymous"></script>
<link rel = "stylesheet" type="text/css" href="${path}/resources/css/common.css">
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
			height: 29px;
			margin-bottom: 28px;
		}
		.tit_comm{
			display: block;
			overflow: hidden;
			background:url(../../img/유의사항11.gif);
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
			background: url(../../img/체크킴.png) 100% 50% no-repeat;
			display: block;
			line-height: 20px;
			height: 50px;
			top:-1px;
			font-size: 14px;
			font-weight: 700;
		}
		.info_user > input:checked + label{
			background-image: url(../../img/체크끔.png)
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
			background: url(../../img/체크킴.png) 100% 50% no-repeat;
			display: block;
			line-height: 20px;
			height: 50px;
			top:-1px;
			font-size: 14px;
			font-weight: 700;
		}
		.ul_li_span > input:checked + label{
			background-image: url(../../img/체크끔.png)
		}
		.btn_double_area{
			margin: 30px -5px 0px;
			overflow: hidden;
			max-width:888px;
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
	/*	.int_id{
			padding-right: 110px; 
		}*/
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
		.idpw{
			display:flex;
			align-items: center;
			justify-content: center;
		}

	</style>
</head>
<body>
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
						<input type="checkbox" id="cbox">
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
					<input type="checkbox" id="cbox2">
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
						<input type="checkbox" id="cbox3">
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
				<div class="btn_double_area">
						<span><a href="../include/header2.html" class="btn_type btn_default">뒤로가기</a></span>
						<span><a href="../include/repw1.html" class="btn_type btn_agree">다음단계</a></span>
				</div>	
			</div>								
		</form>	
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
</html>