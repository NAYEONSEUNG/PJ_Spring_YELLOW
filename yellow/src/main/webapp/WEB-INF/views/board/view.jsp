<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://kit.fontawesome.com/e272fd87da.js" crossorigin="anonymous"></script>
	<style type="text/css">
		#container{
			position: relative;
			max-width: 1100px;
			margin: 0 auto;
			z-index: 1;
			margin-top:50px;
		}
		#contents{
			display: block;
			line-height: 1.7;
			word-break: break-all;
			/* width: 100%; */
		}
		#contents .cont_top{
			display: block;
			position: relative;
			overflow: hidden;
			padding: 35px 0 30px;
		}
		#contents .cont_top .cont_tit{
			display: block;
			float: left;
			font-size: 35px;
			font-weight: bold;
			letter-spacing: -0.08em;
			font-family: "NanumSquare";
			line-height: 1;
		}
		.cnt{
			font-size: 14px;
		}
		/* 내용부분 (제목) */
		#contents #cont{
			display: block;
			margin:0 0 50px 0;
			min-height: 600px;
			position: relative;
		}
		#board-wrap{
			position: relative;
			margin-bottom: 10px;
			word-wrap: normal;
		}
		.board_view_head{
			position: relative;
		/* 	border: 1px solid #ddd; */
			border-top: 2px solid #696c75;
			border-bottom: 0;
		}
		.board_view_head .board_view_title{
			position: relative;
			width: 100%;
			background: #f9f9f9;
		}
		.board_view_head .vtitle{
			margin:0;
			text-align: left;
			color: #333;
			font-weight: 700;
			font-size: 14px;
			padding:18px 25px 10px;
			width: auto;
			word-break: break-all;
			line-height: 1.3;
			
		}
		.board_view_head .vtitle_winfo{
			padding:0 24px 18px;
			font-size: 12px;
			color: #666;
			line-height: 1.4;
		}
		.cnt{
			float: right;
		}
		.board_view_head .vtitle_winfo span:first-child{
			background: 0;
			margin:0;
			padding:0;
		}
		.board_view_head .vtitle_winfo span{
			padding-left: 10px;
			margin-left: 
		}
		.board_view_head .board_view_winfo{
			border-top: 1px solid #999;
		}
		.board_view_winfo{
			width: 100%;
			overflow: hidden;
		}
		.board_view_cont{
			display: block;
			position: relative;
			overflow-x: hidden;
			padding: 30px 20px 0;
			margin-left: 0px;
			margin-right: 0px;
			border-bottom: 1px solid #bac2ca;
			word-break: break-all;
		}
		.board_view_contents{
			display: block;
			position: relative;
			margin-left: 0px;
			margin-right: 0px;
			margin-bottom: 30px;
			overflow: hidden;
		}
		/* 버튼들 4개 */
		.board_write{
			float: right;
			margin-left: 5px;
			margin-top: 11px;
			border: 1px solid #000;
			text-decoration: none;
		}
		.btn_write{
			padding: 10px;
			font-weight: bold;
			line-height: 12px;
			font-size: inherit;
			text-align: center;
		}
		.black_btn{
			background: #000;
			color: #fff !important;
			border-radius: 5px;
		}
		/* 댓글창 */
		.table{
			font-size: 12px;
			line-height: 1.25em;
		}
		.reply_box{
			clear: both;
			width: 100%;
			line-height: 18px;
		/* 	height: 25px; */
			padding: 22px 0 0 0;
		}
		.re_btn{
			color: #666;
			font-size: 13px;
			font-weight: bold;

		}
		.box_reply2{
			margin: 0;
			padding: 11px 26px 16px 24px;
			background-color: #f9f9f9;
		}
		.reply_list {
			margin: 0px;
			padding: 0px;
		}
		.reply_info_zone, .repl_txt_zone{
			padding:0 24px 13px;
			font-size: 12px;
			color: #1f1313f5;
			/* line-height: 0.7; */

		}
		.repl_wrap{
			list-style: none;
			margin:15px;
		}
		.repl_name{
			font-weight: 700;
			font-size: 13px;
		}
		.reply_btn{
			margin: 3px 0 07px;
			padding-left: 10px;
			font-size: 11px;
			font-family: Dotum;
			color: #666;
		}
		.comm_write_wrap{
			padding: 10px;
			border-width: 1px;
			border-style: solid;
			background-color: #fff;
			width: 85%;
			border:1px solid #999;
		}
		.txt_box{
			overflow: hidden;
			line-height: 14px;
			height: 39px;
		}
		.comm_write_wrap .textarea{
			border: 0 !important;
		}
		.textarea{
			width: 100%;
			height: 100%;
			margin:0;
			padding:1px 0;
			resize: none;
		}
		.box_reply2{
			border-bottom: 2px solid #696c75;
			border-top: 1px solid #999;
		}
		.btnupload{
			display: inline-block;
			font-weight: 600;
			text-align:center;
			font-size: 15px; 
			border-radius: 5px;
			cursor: pointer;
			padding: 26px 32px;
			border:1px solid transparent;
			background-color:#776553;
			margin: 0 0 0 7px;
			color: white;
		}	
	</style>
</head>
<body>
	<%@ include file="../include/modal.jsp"%>
	<div id="container">
		<div id="contents">
			<div class="cont_top">
				<h2 class="cont_tit">자유게시판</h2>				
			</div>
			<div id="cont" class="pg-">
				<div id="board_wrap">
					<div class="board_view_head">						
						<div class="board_view_title">
							<h4 class="vtitle">
								${one.title}
							</h4>
							<div class="vtitle_winfo">
								<span class="txt">${one.bno}</span>
								<span class="txt">${one.writer}</span>
								<span style="color:#ecec; margin:3px">|</span>
								<fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd HH:mm:ss" var="regdate"/>
								<span class="txt">${regdate}</span>
								<span class="txt cnt">					
									<i class="far fa-eye">${one.viewcnt}</i>
									<i class="far fa-comment">${one.replycnt}</i>
									<i class="far fa-thumbs-up">${one.goodcnt}</i>
								</span>
							</div>
						</div>
						<div class="board_view_winfo">					

						</div>						
					</div>
					<div class="board_view_cont">
						<div class="board_view_contents">
							<div id="boardContents">
								${one.content}
							</div>
						</div>						
					</div>
					<div>
						<div class="board_view_winfo">					
						</div>
					</div>
					<div class="board_view_btn" style="display: flex; justify-content: space-between;">
						<div class="writer_btn">
							<a href="${path}/board/list" class="board_write btn_write black_btn">목 록</a>
							<a href="#" class="board_write btn_write black_btn">답 변</a>
						</div>
						<c:if test="${userid == one.writer}">
							<div class="btn_second">							
									<a href="#" class="board_write btn_write black_btn">수 정</a>
									<a href="#" class="board_write btn_write black_btn" id="delete_btn">삭 제</a>
							</div>
						</c:if>
					</div>
				</div>
				<div class="reply_box">
					<div class="reply_cnt">
						<a href="#" class="re_btn" style="text-decoration:none !important;">댓글 2</a>
					</div>
				</div>
				<div class="box_reply2 bg_color u_cbox" style="display: block;">
					<!--댓글리스트-->
					<ul class="reply_list">
						<li class="repl_wrap" style="border-bottom: 1px solid #ecec; ">
							<div class="commnet_box">
								<div class="reply_info_zone">
									<span class="txt repl_name">나연승</span>
									<span style="color:#ecec; margin:5px">|</span>
									<span class="txt"> 2020-03-20</span>
									<span class="reply_btn"><a href="#" class="rebtn" style="text-decoration:none !important;"><i class="fas fa-comment"></i>답글</a></span>
									<span class="good_btn"><a href="#"><i class="far fa-thumbs-up"></i></a></span>
								</div>
								<div class="repl_txt_zone">
									<span>울릉도 동남쪽 뱃길따라 이백리 외로운 섬하나 새들의 고향</span>
								</div>	
							</div>
						</li>					
					</ul>
					<div style="display: flex; padding: 0 0 0 27px;">
						<div class="comm_write_wrap">
							<textarea class="textarea txt_box" cols="50" rows="2">						
							</textarea>
						</div>
						<div class="upload_btn">
							<button type="button" class="btnupload">등 록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

		$(function(){
			
			//삭제버튼 클릭시 모달창 Open
			$('#delete_btn').on('click',function(){
				$('.include_modal_wrap').css('display','flex');
			});
			
			//삭제알림 모달창에서 확인버튼 클릭 -> 게시글 삭제
			
			$('#include_btn_login').click(function(){
				location.href='${path}/board/delete?bno=${one.bno}';
			});
			
		});
	
</script>
</html>