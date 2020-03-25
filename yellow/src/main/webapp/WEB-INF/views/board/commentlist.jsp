<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
	
					<div class="box_reply2 bg_color u_cbox" style="display: block;">
					<div class="reply_cnt">
						<a href="#" class="re_btn" style="text-decoration:none !important;">댓글 ${list.size()}</a>
					</div>
					<ul class="reply_list">
					
					<c:forEach items="${list}" var="reply"> 
						<li class="repl_wrap" style="border-bottom: 1px solid #ecec; ">
							<div class="commnet_box">
								<div class="reply_info_zone">
									<span class="txt repl_name">${reply.writer}</span>
									<span style="color:#ecec; margin:5px">|</span>
									<span class="txt time"> 										
										${reply.regdate}
									</span>
									<span class="reply_btn"><a href="#" class="rebtn" style="text-decoration:none !important;"><i class="fas fa-comment"></i>답글</a></span>
									<span class="good_btn"><a href="#"><i class="far fa-thumbs-up"></i></a></span>
								</div>
								<div class="repl_txt_zone">
									<span>${reply.content}</span>
								</div>	
							</div>
						</li>
					</c:forEach>					
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
				</div><!--댓글창 닫는거  -->
</body>
</html>