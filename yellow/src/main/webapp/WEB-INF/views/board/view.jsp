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
								<fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd HH:mm:ss" var="regdate"/>
								<fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd HH:mm:ss" var="updatedate"/>
								<c:if test="${regdate != updatedate}">
									<span class="txt">수정날짜${one.updatedate}</span>
								</c:if>
								<span class="txt">등록날짜${regdate}</span>
								<span class="txt cnt">					
									<i class="far fa-eye">${one.viewcnt}</i>
									<i class="far fa-comment"><span class="replycnt">${one.replycnt}</span></i>
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
					<div class="board_view_btn" style="display: flex; justify-content: space-between; padding: 0 0 1px;">
						<div class="writer_btn">
							<a href="${header.referer}" class="board_write btn_write black_btn" >목 록</a><!-- 바로 전의 페이지를 보여주기위해서 referer쓰는데 이거는 헤더에 담겨온다. -->
							<a href="#" class="board_write btn_write black_btn">답 변</a>
						</div>
						<c:if test="${userid == one.writer}">
							<div class="btn_second">							
									<a href="${path}/board/update?bno=${one.bno}" class="board_write btn_write black_btn">수 정</a>
									<a href="#" class="board_write btn_write black_btn" id="delete_btn">삭 제</a>
							</div>
						</c:if>
					</div>
				</div>

				<!--댓글리스트-->
				<div id="listReply"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

		$(function(){
			//자바스크립트 내장함수
			setInterval(refreshReply,3000000);//300000시간에 한번씩refreshReply를 실행하라
			
			listReply();//화면단이 다 완료되면 이 메서드를 실행하라 이게 호출되면 아래 listreply가 실행 
			//삭제버튼 클릭시 모달창 Open
			$('#delete_btn').on('click',function(){
				$('.include_modal_wrap').css('display','flex');
			});
			
			//삭제알림 모달창에서 확인버튼 클릭 -> 게시글 삭제
			
			$('#include_btn_login').click(function(){
				location.href='${path}/board/delete?bno=${one.bno}';
			});
			
			//댓글 등록 버튼 
			$(document).on('click', '.btnupload',function(){// 문서에서 등록버튼 누르고 실행하면
				//2.리플텍스트라는 변수에 사용자가 입력한 댓글내용을 담음
				var reply_txt = $('.txt_box').val().trim();//.trim() 빈칸에 스페이스바 입력해도 인식을 안해준다.
				//alert(reply_txt);
				
		
				if(reply_txt == ''|| reply_txt.length == 0){
					$('.txt_box').focus();
					$('.board_err_msg').css('visibility','visible');
					return false;
				} // 이 if를 넘어갔다는것은 댓글 내용이 있다는것 
				
				$('.reply_bno').val('${one.bno}');
				$('.reply_type').val('${one.type}');
				$('.reply_writer').val('${userid}');//userid
				
				$.ajax({ // type, content, wirter, bno
					url:'${path}/reply/insert',
					//url:'${path}/repy/insert?bno = '+bno+&
					type:'POST',
					data: $('.frm_reply').serialize(),//serialize 직렬화, query스트링을 자동으로 만들어준다. 
					success:function(){
						alert('성공');
						listReply();
					}
				});
				
			});
			
			
		});
	//	$(document).on('click','.reply_delete_btn',function(){
			
			/* var rno = $(this).next().val(); */
	//		alert('이 댓글번호'+rno);
	//	}); 
		
		$(document).on('click','.reply_delete_btn',function(){
			var rno = $(this).attr('data_num');
			var bno = '${one.bno}'
			$.ajax({
				type:"POST",
				url: '${path}/reply/delete/',
				data: {'rno' : rno,'bno':bno},
				success:function(){
					listReply();
				},
				error:function(){
					alert('ㅠㅠ');
				}
			});
			
		});
		
		//댓글 목록  출력함수
		//$(function(){
		function listReply(){
			$.ajax({
				type:'get',
				async:false,// 동기방식, 순차적 실행을 한다.  기본값은 동기방식=true
				url: "${path}/reply/list?bno=${one.bno}",//bno값을 가지고 넘어가라 
				success:function(result){	//result가   board/commentlist.jsp 랑 bno 가지고있음 
					$('#listReply').html(result);  //div태그 listReply에 html을 띄워준다. 무엇을? result를 result= board/commentlist.jsp
					$('.replycnt').text($('.replyListCnt').val());  //replycnt 선택자에게 replyListCnt의 택스트를 넣어라
																	//상세: (뷰페이지 댓글카운트) replycnt에다 글자(숫자)를 띄울껀데 ,
																	//       (커멘트리스트.jsp) class="replyListCnt" 는 검색해서 나온 댓글 갯수를 뷰페이지에 적어줄꺼다
				}
			});
		
			//게시글 댓글수 수정
			
		}
		function refreshReply(){
			//alert('ㅋㅋㅋㅋ')
			listReply();
		}
		
	
</script>
</html>