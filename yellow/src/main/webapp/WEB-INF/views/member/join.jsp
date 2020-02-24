<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 헤더추가 ㄴㄴ 디자인만 ㄱㄱ -->
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type="text/css" href="${path}/resources/css/common.css">
<script src="https://kit.fontawesome.com/e272fd87da.js" crossorigin="anonymous"></script>
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
		.bir_wrap{
			display: table;
			width: 100%;
		}
		.bir_mm, .bir_dd{
			padding-left: 10px;
		}
		.bir_yy, .bir_mm, .bir_dd{
			display: table-cell;
			table-layout: fixed;
			width: 147px;
			vertical-align: middle;
		}
		.sel{
			background: #fff url('https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif') 100% 50% no-repeat;
			background-size: 20px 8px;
			width: 100%;
			height: 29px;
			font-size: 15px;
			line-height: 18px;
			color: #000;
			border: none;
			-webkit-appearance: none;
		}
		.choice{
			font-size: 12px;
			font-weight: 400;
			color: #8e8e8e;
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
		/*.btn_agree{
			color: white;
			background-color: #e9b616;
		}*/
		.btn-primary{
			color: white;
			background-color: #e9b616;
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
		.daum_addr{						
			width: 100%;
			height: 51px;
			border: 1px solid #dadada;
			padding: 10px 14px 10px 14px;
			background: #fff;
			display:table;
		}
		.addr_num, .addr_search{
			display: table-cell;
			table-layout: fixed;
			width: 230px;
			/*vertical-align: middle;*/
		}

	</style>
</head>

<body>
	<div class="wrap">
	<header><div class="header">
		<h1 class="naver_logo"><a href="header2.html" class="n_logo"></a></h1>
	</div></header>

	<section>
		<!-- <form id="frm_member" name="frm_join" action="${path}/member/join" method="POST" > 액션이 생략되어있으면 기존에 있던 url을 그대로 집어넣어준다.  -->
		<form:form id="frm_member" modelAttribute="memberDTO" atuocomplete="on">
			<div class="container">
				<div class="join_content">
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="id">아이디</label>
								
							</h3>
							<span class="ps_box int_id join_info_box_content" >
								<input type="text" id="uid" name="id" class="int">
								
								<span class="step_url"></span>
							</span>
							<span class="join_err_msg">필수 정보입니다.</span>
						</div>
						 

						<div class="join_row">
							<h3 class="join_title">
							<label for="pswd1">비밀번호</label>
								
							</h3>
							<span class="ps_box int_pass join_info_box_content">
								<input type="text" id="upw" name="pw" class="int">
								<span class="step_url"><span class="pw_lock"></span></span>
							</span>
							<!-- <span class="join_err_msg">필수 정보입니다.</span> -->
						</div>

						<div class="join_row">
							<h3 class="join_title">
								<label for="pswd2">비밀번호 재확인</label>								
							</h3>
							<span class="ps_box int_pass join_info_box_content">
								<input type="text" id="urpw" name="urpw" class="int">
								<span class="step_url"><span class="repw_lock"></span></span>
							</span>
							<span class="join_err_msg">필수 정보입니다.</span>
						</div>

					</div>
					<div class="row_group">
						<div class="join_row">
							<h3 class="join_title">
								<label for="name">이름</label>								
							</h3>
							<span class="ps_box join_info_box_content">
								<input type="text" id="uname" name="name" class="int">								
							</span>
							<span class="join_err_msg">필수 정보입니다.</span>
						</div>

						<div class="join_row">
							<h3 class="join_title">
								<label for="email">본인 확인 이메일<span class="choice">(선택)</span></label>								
							</h3>
							<span class="ps_box join_info_box_content">
								<input type="text" id="uemail" name="email" class="int" placeholder="본인확인 이메일">

							</span>
							<span class="join_err_msg">필수 정보입니다.</span>
						</div>

						<div class="join_row">
							<h3 class="join_title">
								<label for="phone">휴대전화</label>								
							</h3>
							<span class="ps_box join_info_box_content">
								<input type="text" id="uphone" name="phone" class="int" placeholder="-없이 입력, 예)01012345678">								
							</span>
							<span class="join_err_msg">필수 정보입니다.</span>
						</div>


						<div class="join_row">
							<h3 class="join_title">
								<label for="uaddr">주소<span class="highlight"></span></label>
							</h3>
							<div class="addr_wrap">
								 <div class="postcode" style="display: flex;">
								    <span class="join_info_box_content ps_box addr_poc">
								    <input name="postcode" type="text" id="sample6_postcode" class="int addr_only" placeholder="우편번호"  >
								    </span>
								     <input type="button" id='btn_post' class='addr_poc_button' onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								</div>
								   <span class="join_info_box_content ps_box">
										<input name="addr1" type="text" id="sample6_address" class="int addr_only" placeholder="주소" ><br>
								   </span>
								   <span class="join_info_box_content ps_box">
										<input name="addr2" type="text" id="sample6_detailAddress" class="int" placeholder="상세주소">
										<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
										
								   </span>
							</div>
						<span class="join_err_msg">필수 정보입니다.</span>
						</div>
							
				

						<div class="btn_double_area">
							<button  type="button" id="btn_join" class="btn_type btn_agree btn-primary">가입하기</button>

						</div>

				</div>
			</div>	
			</div>
			
	<!-- </form> -->	
		</form:form>
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
<script src="../../js/daum_post.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">

   $(document).ready(function(){

   });

	$(function(){
		//비정상적인 접근인지 판단하는 flag
		//
		var flag = '${flag}';// '' 따옴표를 꼭 붙히자
		if(flag == 0) {
			location.href="${path}/member/constract";
		}
		
	
		//비밀번호가 유효한 값인지 체크해주는 Flag값
		var pwFlag = false;

		//유효성체크 여부를 알려주는 배열
		var checkArr = new Array(6).fill(false); // fill false값으로 다 채워주세요 라는 듯
		// printCheckArr(checkArr);
		
		//유효성체크 모두 통과 or 불통 여부를 알려주는 변수 
		var checkAll = true;

		//ID유효성체크:	
		$('#uid').keyup(function(){
			//사용자가 입력한 값의 좌우여백을제거하고 id에 입력
			var id = $(this).val().trim();//사용자가 입력한 값	
			//validation.js의 checkId로 유효성체크를 실행후
			//결과를 result에 담음(code, desc)		
			var result = joinValidate.checkId(id);

			if(result.code == 0){
				checkArr[0] = 'true';
			}else {
				checkArr[0] = 'flase';
			}
			// printCheckArr(checkArr);
			//유효성체크 결과로 테두리색과 err메시지를 출력하는
			//함수실행
			ckDesign(result.code, result.desc, 0, 0);
		});
		//비밀번호 유효성 체크
		$('#upw').keyup(function(){
			//1. 사용자가 입력한 값 받기
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());
			// alert(pw+','+rpw);

			//2.유효성 체크하기
			var result = joinValidate.checkPw(pw, rpw); //유효성체크는 joinValidate.checkPw여기서만 한다.
			if(result.code == 0 || result.code == 10 || result.code == 6){
				pwFlag = true;
			}else{
				pwFlag=false
			}
			if(result.code == 10){
				checkArr[1] = true;
				$('.join_info_box_content:eq(2)').css('border', '2px solid #3885ca');				
			}else if(result.code == 6){
				checkArr[1] = false;
				$('.join_info_box_content:eq(2)').css('border', '2px solid #3885ca');				
			}else {
				checkArr[1] = false;
			}
			printCheckArr(checkArr);

			//3. 체크 결과에 따라 디자인하기
			ckDesign(result.code, result.desc, 1, 1);
		});	

		//비밀번호 재확인 유효성 체크
		$('#urpw').keyup(function(){
			var pw = $.trim($('#upw').val());
			var rpw = $.trim($('#urpw').val());
			// console.log(pw+', '+rpw);

			var result = joinValidate.checkRpw(pw, rpw, pwFlag);
			// console.log(pw+', '+rpw);
			// alert(result.code+', '+ result.desc);
			if(result.code == 10){
				checkArr[1] = true;
				$('.join_info_box_content:eq(1)').css('border', '2px solid #3885ca');				
			}else if(result.code==6){
				checkArr[1] = false;
				$('.join_info_box_content:eq(1)').css('border', '2px solid #3885ca');				
			}else{
				checkArr[1] = false;
			}	
			printCheckArr(checkArr);		
			ckDesign(result.code, result.desc, 2, 1);
		});

		//이름 유효성체크
		$('#uname').keyup(function(){
			var name = $.trim($(this).val());
			// console.log(name);
			var result = joinValidate.checkName(name);

			if(result.code == 0){
				checkArr[2] = true;
			}else{
				checkArr[2] = false;
			}
		

			ckDesign(result.code, result.desc, 3, 2);
		});

		//전화번호 유효성체크
		$('#uphone').keyup(function(){
			var phone = $.trim($(this).val());
			var result = joinValidate.checkPhone(phone);

			if(result.code == 0){
				checkArr[3] = true;
			}else{
				checkArr[3] = false;
			}
			// printCheckArr(checkArr);
			// console.log(result.code+', '+ result.desc);
			ckDesign(result.code, result.desc, 5, 4);
		});

		//이메일 유효성 체크
		$('#uemail').keyup(function(){
			var email = $.trim($(this).val());
			
			//전화번호칸 입력시 문자열 길이를 읽어와 출력에시
			//$('.email_cnt').text(email.length);
			
			var result = joinValidate.checkEmail(email);

			if(result.code == 0){
				checkArr[4] = true;
			}else{
				checkArr[4] = false;
			}
			printCheckArr(checkArr);
			ckDesign(result.code, result.desc, 4, 3);
		});

		$('.addr_only').click(function(){//우편번호 버튼에다가 btn_post id로 주기
			//사용자가 우편번호 또는 주소 input을 클릭했을 때!
			$('#btn_post').click();
		});
		//상세주소를 클릭하면
		$('#sample6_detailAddress').click(function(){
			var addrPost = $('#sample6_postcode').val();
			if(addrPost == '' || addrPost.length == 0){
			// $('#btn_post').click();
			}
		});

		//주소 유효성체크
		$('#sample6_detailAddress').keyup(function(){
			var addrDetail = $.trim($(this).val());
			var addrPost = $('#sample6_postcode').val();
			// console.log('우편번호: '+addrPost+',상세주소: '+addrDetail);

			var result = joinValidate.checkAddr(addrDetail, addrPost);

			if(result.code == 3){//우편번호와 주소 없는경우
				ckDesign(result.code, result.desc, 6, 5);
				ckDesign(result.code, result.desc, 7, 5);
				checkArr[5]=false;
			}else if(result.code == 0){//성공
				checkArr[5]=true;
				ckDesign(result.code, result.desc, 6, 5);
				ckDesign(result.code, result.desc, 7, 5);
				ckDesign(result.code, result.desc, 8, 5);
			}else{//상세주소통과x한 모든경
				ckDesign(result.code, result.desc, 8, 5);
				checkArr[5]=false;
			}
			// printCheckArr(checkArr);
		});

		//버튼활성화!
	/* 	$('.int').blur(function(){ */
			$('.int').keyup(function(){
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
		});
		//회원가입 버튼 클릭!
		$('#btn_join').click(function(){
			var invalidAll = true;// 이거 없으면 하나라도 실패한 상태에서 다시 입력하면 절대 안된다.
			for(var i = 0; i < checkArr.length; i++){
				if(!checkArr[i]){
					invalidAll = false;
					$('.join_err_msg:eq('+i+')').css('visibility', 'visible')					
												.css('color', '#d95339');
				}
				
			}
			printCheckArr(checkArr);

			if(invalidAll){
				alert('회원가입 성공!');
				$('#frm_member').submit(); 
				// 아이디가 frm인것 서브밋 해라!, 폼태그 자체를 서버단으로 보내라는 말 , 
				//데이터 보낼때 서브밋하면 폼태그 안에있는 데이터들을 전송한다.
				//submit:form태그안에 있는 데이터들을 서버단으로 전송 
				//action: 목적지(MemberController '/join')
				//method: 방법(POST: 숨겨서)
			}else{	//하나라도 flase이면 
				alert('유효성체크를 진행해주세요!');
			}
		
			//유효성체크가 전부 true이면	
		});

	});

			function ckDesign(code, desc, line, msg){//
				if(code == 0 || code == 10 ){//통과O
					//테두리 색상변ㅇ경
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


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    </script>
</html>