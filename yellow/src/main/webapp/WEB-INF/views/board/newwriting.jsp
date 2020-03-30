<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../include/include.jsp" %>
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
		}
		.big_table{
			padding-top: 50px;

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
			border: 1px solid #a09d9d;
		}
		.file_ment{
			padding:0 24px 18px;
			font-size: 12px;
			color: #666;
			line-height: 1.4;
		}
		
	</style>
</head>
<body>
<div class="content">
		<table class="big_table">
			<tr>
				<h3 class="content_header">새 글 쓰기</h3>
			</tr>
			<tr>
				<table class="table2">
					<tr>
						<td>작성자</td>
						<td>mrblack</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>										
							<input type="text" name="subject" class="subject_input">				
						</td>
					</tr>
					<tr>
						<td>게시판 종류</td>
						<td>
							<div>	
								<select class="sel_board">
									<option>자유게시판</option>
									<option>질의응답</option>
									<option>구매후기</option>
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
							<textarea cols="93" rows="28" placeholder="게시글을 입력하세요"></textarea>
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
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
				<button type="button" class="tb_btn cancel_btn">등록</button>
			</div>
	</div>

</body>
</html>