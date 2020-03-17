<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
		p{
		margin:0;
		vertical-align:center;
		}
		
		table, caption, tbody, tfoot, thead, tr, th, td{
			outline: 0;
			background: transparent;
			font-size: 100%;
		}
		#board-wrap{
			position: relative;
			margin-bottom: 10px;
			word-wrap: normal;
		}
		/* 상단검색 */
		.top_search{
			display: inline-block;
			width: 100%;
			margin:0 0 13px 0;
		}
		.top_search .search_box{
			text-align: right;
		}
		.top_search .srarch_select, 
		.top_search .search_input,
		.top_search .srch_btn{
			display: inline-block;
		}
		.top_search .srarch_select .choice_sel{
			width: auto;
			height: 40px;
			border: 1px solid #d9d9d9;
			font-size: 15px;
			line-height: 38px;
			padding: 5px;
		}
		.top_search .search_input{
			padding: 0 3px;
		}
		.top_search .search_input input{
			height: 40px;
			line-height: 40px;
			border: 1px solid #d9d9d9;
			text-indent: 10px;
			min-width: 300px;
		}
		/* 게시글 조회 */
		.list_sort{
			list-style: none;
			padding: 0;
			margin: 10px 0 0 5px;
		}
		.list_sort li{
			float: left;
			margin-right: 20px;
			font-weight: bold;
			font-size: 12px;
		}
		.top_sort ul li:hover{
			text-decoration: underline;
			

		}
	

		/* 글등록 */
		.top_search a.board_write{
			float: right;
			margin-left: 5px;
			margin-top: 11px;
			border: 1px solid #000;
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
		}

		/* 리스트 */
		.board-list-wrap{
			border-top: 2px solid #696c75;
			width: 100%;
		}
		.board-list-table{
			width: 100%;
			border-collapse: collapse;
			text-align: center;

		}
		table caption{
			width: 0;
			height: 0;
			font-size: 0;
			line-height: 0;
			z-index: -1;
		}
		.board-list-table .num{
			width: 7%;
			text-align: center;
			font-size: 12px;
		}
		.board-list-table .subject{
			width: auto;
			text-align: left;
			padding-left: 2%;
			padding-right: 2%;
			font-style: 14px;
		}
		.board-list-table .writer{
			width: 15%;
			font-size: 13px;
			word-wrap: break-word;
		}
		.board-list-table .date{
			width: 14%;
			font-size: 12px;
		}
		.board-list-table .cnt{
			width: 8%;
			font-size: 12px;
		}
		.board-list-table th{
			border: 1px solid #e6e6e6;
			border-bottom: 1px solid #999;
			border-top: 0;
			background: #f9f9f9;
			padding: 14px 0 15px;
			font-size: 13px;
		}
		.board-list-table .subject{
			width: auto;
			text-align: left;
			padding-left: 2%;
			padding-right: 2%;
			font-size: 14px;
		}
		.board-list-table td{
			border: 1px solid #ddd;
			padding: 12px 3px;
		}
		.board-list-table td .stitle{
			display: block;
			width: 100%;
			float: left;
			font-size: 0;
		}
		.board-list-table .date{
			width: 14%;
			font-size: 12px;
		}
		.board-list-table tr:hover td{
			background-color: #ececec; 
		}
		.board-list-table .cnt{
			width: 8%;
			font-size: 12px;
		}
		.board-list-table .file{
			width: 6%;
			font-size: 12px;
		}
		.pagination ul li:hover{
			
			background-color: #ececec;
		}
		.search_btn:hover{
			background-color: #fcbe32;
			color: white;
		}
		.search_btn{
			border-color: transparent;
			width: 44px;
			height: 44px;
			cursor: pointer;
			border-top-right-radius: 2px;
			border-bottom-right-radius: 2px;
		}
		.board-list-paging{
			margin-top: 20px;
			text-align: center;
			clear: both;
			width: 100%;
		}
		.pagination{
			clear: both;
			text-align: center;
			padding: 25px 0;
		}
		.pagination ul{
			margin: 0;
			padding: 0;
		}
		.pagination ul li{
			display: inline-block;
			vertical-align: top;
			margin: 3px;
			padding: 0;
		}
	    .pagination ul li a{
	    	display: block;
	    	width: 30px;
	    	height: 34px;
	    	border: #e2e2e2 solid 1px;
	    	line-height: 32px;
	    	font-size: 12px;
	    	font-weight: 400;
	    }
	    a{
	    	color: #333;
	    	text-decoration: none;
	    }
	    .big_wrap{	
			max-width: 1200px;
			margin: 0 auto;
			box-sizing: border-box;
	    }
	    /* footer */
	    .#footer{
	    	width: 100%
	    	padding: 20px 50px 10px;
	    }
	</style>

</head>
<body>
	<div id="big_content" class="big_wrap">
		<div>
			<h3>자유게시판</h3>
		</div>
	<div id="board-wrap">

			<div class="top_search">
				<div class="search_box">
					<div class="srarch_select">
						<select class="choice_sel" id="srch_column" name="srch_column">
							<option value="select_title">제목</option>
							<option value="select_writer">작성자</option>
						</select>
					</div>
					<div class="search_input">
						<input type="text" id="srch_wrd" name="srch_wrd" placeholder="검색어를 입력하세요">
					</div>
					<div class="srch_btn">
						<button type="button" class="search_btn" style="cursor: pointer;"><i class="fas fa-search"></i></button>
					</div> 
				</div>
					<div class="top_sort">
 						<ul class="list_sort pull_left">
							<li>
								<a href="#">최신순</a>
							</li>
							<li>
								<a href="#">조회순</a>
							</li>
							<li>
								<a href="#">댓글순</a>
							</li>
							<li>
								<a href="#">추천순</a>
							</li>
						</ul> 
					</div>
					<div class="writer_btn">
					<a href="#" class="board_write btn_write black_btn">글쓰기</a>
					</div>
			</div>

	

		<div class="board-list-wrap">
			<table class="board-list-table">
				<colgroup>
					<col class="num">
					<col class="subject">
					<col class="writer">
					<col class="date">
					<col class="cnt">
					<col class="file">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일자</th>
						<th scope="col">조회수</th>
						<th scope="col">첨부파일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="num">01</td>					
						<td class="subject">
							<a href="#">GOGogogoGOGOGOogo</a>
						</td>
						<td class="writer">오키</td>
						<td class="date">2020-03-05</td>
						<td class="cnt">7</td>
						<td class="file"></td>
					</tr>
					<tr>
						<td class="num">01</td>					
						<td class="subject">
							<a href="#">GOGogogoGOGOGOogo</a>
						</td>
						<td class="writer">오키</td>
						<td class="date">2020-03-05</td>
						<td class="cnt">7</td>
						<td class="file"></td>
					</tr>
					<tr>
						<td class="num">01</td>					
						<td class="subject">
							<a href="#">GOGogogoGOGOGOogo</a>
						</td>
						<td class="writer">오키</td>
						<td class="date">2020-03-05</td>
						<td class="cnt">7</td>
						<td class="file"></td>
					</tr>
					<tr>
						<td class="num">01</td>					
						<td class="subject">
							<a href="#">GOGogogoGOGOGOogo</a>
						</td>
						<td class="writer">오키</td>
						<td class="date">2020-03-05</td>
						<td class="cnt">7</td>
						<td class="file"></td>
					</tr>
					<tr>
						<td class="num">01</td>					
						<td class="subject">
							<a href="#">GOGogogoGOGOGOogo</a>
						</td>
						<td class="writer">오키</td>
						<td class="date">2020-03-05</td>
						<td class="cnt">7</td>
						<td class="file"></td>
					</tr>
					<tr>
						<td class="num">01</td>					
						<td class="subject">
							GOGogogoGOGOGOogo
						</td>
						<td class="writer">오키</td>
						<td class="date">2020-03-05</td>
						<td class="cnt">7</td>
						<td class="file"></td>
					</tr>
				</tbody>
			</table>
			<div class="pagination"> 
				<ul>
					<li>
						<a href="#" class="first"><<</a>
					</li>
					<li>
						<a href="#" class="prev"><</i></a>
					</li>
					<li>
						<a href="#" class="active">1</a>
					</li>
					<li>
						<a href="#" class="active">2</a>
					</li>
					<li>
						<a href="#" class="active">3</a>
					</li>
					<li>
						<a href="#" class="active">4</a>
					</li>
					<li>
						<a href="#" class="next">></a>
					</li>
					<li>
						<a href="#" class="last">>></i></a>
					</li>
				</ul>
			</div>
			
		</div>
	</div>
	</div>
</body>
</html>