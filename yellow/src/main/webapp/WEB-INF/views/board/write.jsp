<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">

		.content{
			border-top:2px solid #696c75;
			border-bottom:2px solid #696c75;
			position: : relative;
			max-width: 900px;
			margin: 0 auto;
			z-index: 1;
			margin-top: 100px;
		}
		.big_table{
			/* padding-top: 50px; */

		}
		.content_header{
			margin-top: 0;
			margin-bottom: 20px;
			color: #6f7275;
		}
		.subject_input{
			width: 70%;
			height: 21px;
			padding: 3px 0 0 3px;
			color: #8c8c8c;
			font-size: 12px;
			border: 1px solid #a7a7a7;
			border-bottom: 1px solid #d8d8d8;
			border-right: 1px solid #d8d8d8;
			background-color: #fbfbfb;
		}
		table.table2{
            border-collapse: separate;
            border-spacing: 1px;
            text-align: left;
           /* line-height: 1.5;*/
            border-top: 1px solid #ccc;
            margin : 20px 10px;
        }
        table.table2 tr {
            width: 50px;
            padding: 10px;
            font-weight: bold;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
        }
        table.table2 td {
            width: 100px;
            padding: 10px;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
        }
        .tb_btn {
			font-size: 14px;
			font-weight: bold;
			border-radius: 4px;
		    border: 1px solid #b6b6b6;
		    text-align: center;
		    background-color: #222;
		    color: white;
		    display: inline-block;
		    width: 142px;
		    min-width: 118px;
		    padding: 11px;
		    margin: 0 141px;
		}
		textarea{
			resize: none;

		}
		/*게시판 종류선택*/
		.sel_board{
			width: 70%;
			height: 27px;
		}
		/*첨부파일*/
		.file_plus{
			width: 673px;
			height: 100px;
			border: 2px dashed #a09d9d;
		}
		.file_ment{
			padding:0 24px 18px;
			font-size: 12px;
			color: #666;
			line-height: 1.4;
		}
		/* 에러메시지 */
		.join_err_msg{
			display: block;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: red;
			height: 15px;
			visibility: hidden;
		}
		
	</style>
</head>
<body>
<div class="content">
		<table class="big_table">
			<tr>
				<h3 class="content_header">새 글 쓰기</h3>
				<span class="up_time"></span>
			</tr>
			<tr>
			<form:form id="frm_board" >
				<table class="table2">
					<tr>
						<td>작성자</td>
						<td>${userid}</td>
						<input type = "hidden" value="${userid}"  name="writer" >
					</tr>
					<tr>
						<td>제목</td>
						<td>										
							<input type="text"  class="subject_input" name="title" value="${one.title}">				
						</td>
					</tr>
					<tr>
						<td>게시판 선택</td>
						<td>
							<div>	
								<select class="sel_board board_type" name="type">
									<option value="free">자유게시판</option>
									<option value="qna" >질의응답</option>
									<option value="buywhogi">구매후기</option>
								</select>
							</div>	
						</td>
					</tr>
<!-- 					<tr>
						<td>첨부파일</td>
						<td><div><i class="fas fa-paperclip"></div></i></td>
					</tr> -->
					<tr>
						<td>글 작성</td>
						<td>
							<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
							<textarea cols="93" rows="28" placeholder="게시글을 입력하세요" id="board_content" name="content" style="min-width:650px;">${one.content}</textarea>
						</td>
					</tr>
					<tr>
						<td><i class="fas fa-paperclip"></i></td>
						<td>
							<div class="file_plus">
								<span class="file_ment">첨부파일을 넣어주세요</span>
							</div>
						</td>
					</tr>
				</table>
			</tr>
		</table>
			<div style="padding-bottom: 15px;">
				<button type="button" class="tb_btn cancel_btn">취소</button>
				<button type="button" class="tb_btn up_btn">등록</button>
			</div>
			<span class="join_err_msg">제목을 입력하세요.</span>
			</form:form>
	</div>

</body>
<script type="text/javascript">
	$(function(){
	//	alert('데이터: ' +${one}); // 공백으로 뜬다는거는 그 코드를 그대로 써도 된다는 것 
		//register ==> 게시글 등록과 게시글 수정
		//${one}에값이 있으면 수정페이지 로딩!
		if('${one}' != ''){
			//수정페이지로 디자인 변경
			$('.content_header').text('글 수정');
			$('.up_btn').text('수정');
			//selectbox값으로 selected
			$('.board_type').val('${one.type}').attr('selected','selected');// 셀렉트박스에서 그녀석을 셀렉트해라
							//free인것을 셀렉트해주세요
			$('.up_time')	
		}
	});
	$(function(){
		
	});
	$(document).on('click', '.cancel_btn', function(){// 취소하면은  왔던곳으로 다시 돌려보낸다. 
		var referer = '${header.referer}';
		console.log('이전 URL: ' + referer);
		
		var index = referer.indexOf('/board/list');
		console.log('index:' + referer.indexOf('/board/list'));
		
		if(index == '-1'){
			
			location.href = '${path}/board/list';
			alert(index);
		}else{
			
			location.href = '${header.referer}';
			alert(index);
		}
	});
	$(document).on('click','.up_btn',function(){
		//유효성체크 제목
		var title = $('.subject_input').val();
		
		if(title == ''|| title.length == 0){
			//에러메시지 '제목을 입력해 주세요'
			$(".join_err_msg").css('display', 'bloack');
			alert('제목 입력해라');
			return false;
		}else{
		//서버로 전송
			oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);
			alert('서버로 보낼게')
			$('#frm_board').submit();
		}
	});
</script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "board_content",//텍스트area 아이디값
 sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});
</script>
</html>