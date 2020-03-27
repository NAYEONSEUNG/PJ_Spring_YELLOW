<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#reply_id_login_btn{
		color: tomato;
		font-weight: bold;
	}
	.board_err_msg{
		display: block;
		margin: 9px 26px -2px;
		font-size: 12px;
		line-height: 14px;
		color: tomato;
		height: 15px;
		/*display: none;*/
		visibility: hidden;
		}
		.reply_delete_btn{
			background-color: tomato;
			color:white;
			cursor: pointer;
		}
	</style>
	
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
	
					<div class="box_reply2 bg_color u_cbox" style="display: block;">
					<div class="reply_cnt">
						<input type="hidden" class="replyListCnt" value="${list.size()}">
						<a href="#" class="re_btn" style="text-decoration:none !important;">댓글 ${list.size()}</a>
						<button type="button" class="new_reply">새로고침</button>
					</div>
					<c:forEach items="${list}" var="reply"> 
						<ul class="reply_list">
						
							<li class="repl_wrap" style="border-bottom: 1px solid #ecec; ">
								<div class="commnet_box">
									<div class="reply_info_zone">
										<span class="txt repl_name">${reply.writer}</span>
										<span style="color:#ecec; margin:5px">|</span>
										<%-- <fmt:formatDate value="${reply.updatedate}" pattern="yyyy-MM-dd HH:mm:ss" var="regdate"/>	 --%>			 					
										<span class="txt time"> 
											${reply.regdate}
										</span>
										<span class="reply_btn"><a href="#" class="rebtn" style="text-decoration:none !important;"><i class="fas fa-comment"></i>답글</a></span>
										<span class="good_btn"><a href="#"><i class="far fa-thumbs-up"></i></a></span>
										 <c:if test="${userid == reply.writer}">
											<button type="button" class="reply_delete_btn" data_num="${reply.rno}">댓글삭제</button><!-- 속성값을 임의로 집어 넣음  -->
											<%-- <input type="hidden" value="${reply.rno}"> --%>
										 </c:if> 
										<!-- <span class="reply_btn"><a href="#" class="rebtn" style="text-decoration:none !important;">새로고침</a></span> -->
									</div>
									<div class="repl_txt_zone">
										<span>${reply.content}</span>
									</div>	
								</div>
							</li>
						</ul>
					</c:forEach>	
					<c:if test="${list.size() == 0}">
						<ul class="reply_list">
							<li class="repl_wrap" style="border-bottom: 1px solid #ecec; ">
								<div class="commnet_box">
									<div class="reply_info_zone">
										<span class="txt repl_name">관리자 연승</span>
										<span style="color:#ecec; margin:5px">|</span>
										<span class="txt time"> 										
											${reply.regdate}
										</span>
										<span class="reply_btn"><a href="#" class="rebtn" style="text-decoration:none !important;"><i class="fas fa-comment"></i>답글</a></span>
										<span style="color:#ecec; margin:5px">|</span>
										<span class="good_btn" style="margin:0 5px;"><a href="#"><i class="far fa-thumbs-up"></i></a></span>
										<span></span>
									</div>
									<div class="repl_txt_zone">
										<span>등록된 게시글이 없습니다. </span>
									</div>	
								</div>
							</li>
						</ul>
					</c:if>		
					<!-- 댓글 쓰기 -->
					<c:choose>
						<c:when test="${empty userid}">
							<div class="repl_txt_zone">
								<span class="reply_login_btn"><a href="#" id="reply_id_login_btn"> 로그인</a></span>을 하셔야 댓글 등록이 가능합니다.
							</div>
						</c:when>		
						<c:otherwise>
							<form class="frm_reply">
								<input type="hidden" name="bno" class="reply_bno">
								<input type="hidden" name="type" class="reply_type">
								<input type="hidden" name="writer" class="reply_writer">
									<div style="display: flex; padding: 0 0 0 27px;">
										<div class="comm_write_wrap">
											<textarea class="textarea txt_box" name="content"  cols="50" rows="2">						
											</textarea>
										</div>
										<div class="upload_btn">
											<button type="button" class="btnupload">등 록</button>
										</div>
									</div>
							</form>
										<span class="board_err_msg">내용을 입력해주세요.</span>
						</c:otherwise>
					</c:choose>
				</div><!--댓글창 닫는거  -->
</body>
<script type="text/javascript">
	$(function(){
		$('#reply_id_login_btn').on('click',function(){
			$('.modal_wrap').css('display','flex');
		});
	});

</script>
</html>