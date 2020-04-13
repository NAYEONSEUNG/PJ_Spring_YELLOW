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
			height: 39px;
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
			width: 12%;
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
			width: 12%;
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
		.search_btn {
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
			margin-top: 100px;
	    }
	    /* 새 게시글 효과 */
	    .twincle_eff{
	    	animation-name: twinkle;
	    	animation-duration: 1.2s;
	    	animation-iteration-count: infinite;
	    }
	    @keyframes twinkle{
	    	0% {opacity:0;}
	    	100%{opacity:1;}
	    }
	    .new_color{
	    	/* border: 1px solid tomato; */
	    	color: tomato;
	    	padding: 3px 5px;
	    	margin-left: 7px;
	    	font-weight: bold;
	    	font-size: 12px;
	    }
	    #check_color{
	    	border: 1px solid #ececec;
	    	background-color: #ececec;
	    	color: #333;
	    }
	    .clear_box{
	    	display: inline-block;
	    	background-color: #ececec;
	    	font-weight: bold;
	    }
	    .clear_btn:hover{
			background-color: #fcbe32;
			color: white;
		}
		.clear_btn {
			border-color: transparent;
			width: 44px;
			height: 44px;
			cursor: pointer;
			border-top-right-radius: 2px;
			border-bottom-right-radius: 2px;
		}
		#map_keyword{
			font-weight: bold;
			color: tomato;
		}
/* 		#search_result{
			display: none;
		} */

	</style>

</head>
<body>

	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<div id="big_content" class="big_wrap">
		<div>
			<h2>자유게시판</h2>
		</div>
	<div id="board-wrap">

			<div class="top_search">
				<div class="search_box">
						<form action ="${path}/board/list" method="GET">
							<div class="search_input">
								<input type="text" id="srch_wrd" name="keyword" class="input_search" placeholder="검색어를 입력하세요" value="${map.keyword}">
							</div>
							<div class="srch_btn">
								<button type="submit" class="search_btn" style="cursor: pointer;"><i class="fas fa-search"></i></button>
							</div> 
<!-- 							<div class="clear_box">
								<button type="button" class="clear_btn" style="cursor: pointer;"><i class="fa fa-times-circle"></i></button>
							</div> -->
						</form>
						
						
				</div>
					<div class="top_sort">
 						<ul class="list_sort pull_left">
							<li><a href="${path}/board/list?sort_option=new&keyword=${map.keyword}" id="sort_new">최신순</a></li>
							
							<li><a href="${path}/board/list?sort_option=cnt&keyword=${map.keyword}" id="sort_cnt">조회순</a></li>
							
							<li><a href="${path}/board/list?sort_option=reply&keyword=${map.keyword}" id="sort_reply">댓글순</a></li>
							
							<li><a href="${path}/board/list?sort_option=good&keyword=${map.keyword}" id="sort_good">추천순</a></li>
						</ul> 
					</div>
					<div class="writer_btn">
					<a href="${path}/board/write" class="board_write btn_write black_btn">글쓰기</a>
					</div>

			</div>
			
			<!-- 검색결과 알림출력 -->
				<c:if test="${!empty map.keyword}">
					<span id="search_result"><span id= "map_keyword">"${map.keyword}"</span> 검색결과<span id= "map_keyword"> "${map.count}"</span>건 입니다.
						<span class="clear_box">
			 			<!-- 	 <button type="button" class="clear_btn" style="cursor: pointer;"></button>  -->
								<a href="${path}/board/list" class="clear_btn">처음으로</a> 
						</span>
					</span>	
				</c:if>	

	

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
					<c:forEach items = "${map.list}" var="list">
					  
					  <fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="regdate"/><!-- 작성시간을 바꿈  -->
						<tr>
							<td class="num">${list.bno}</td>					
							<td class="subject">
								<c:if test="${list.re_level != 0}">
									<c:forEach begin="1" end="${list.re_level}">
										<i class="fas fa-hand-point-right"></i>
									</c:forEach>
									re:
								</c:if>
								<a href="${path}/board/view/${list.bno}">${list.title}</a>
								<c:if test="${today == regdate}">
									<span class="new_color twincle_eff">N</span> <!-- 오늘쓴 게시글 막 ㅈㄴ N 뜨면서 깜빡거리는거 -->
								</c:if>
							</td>
							<td class="writer">${list.writer}</td>
							<td class="date">
								<c:choose>
									<c:when test="${today == regdate}">
										<fmt:formatDate value="${list.updatedate}" pattern="HH:mm:ss"/>
									</c:when>
									<c:otherwise>
										<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd"/>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="cnt"> 
								<i class="far fa-eye">${list.viewcnt}</i>
								<i class="far fa-comment">${list.replycnt}</i>
								<i class="far fa-thumbs-up">${list.goodcnt}</i>
							</td>
							<td class="file">
								<c:choose>
									<c:when test="${list.filecnt != 0}">
										<span>O</span>
									</c:when>
									<c:otherwise>
										<span>X</span>
									</c:otherwise>
								</c:choose>
							
								<%-- <c:if test="${list.filecnt != 0}">
									<span>O</span>
								</c:if> --%>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pagination"> 
				<ul>

					<c:if test ="${map.pager.curBlock > 1}">
						<li><a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="page_left"><</a></li>
						<li><a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=${map.keyword}"  class="">1</a></li>
						<li><span>...</span></li>
					</c:if>
					<c:forEach var ="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
					 	<c:when test="${num == map.pager.curPage}">
							<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}"  class="active" id="check_color">${num}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}">${num}</a></li>
						</c:otherwise>	
					</c:choose>
					</c:forEach>
					
					<c:if test="${map.pager.curBlock < map.pager.totBlock}">
						<li><span>...</span></li>
						<li><a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="">${map.pager.totPage}</a></li>
						<li><a href="${path}/board/list?curPage=${map.pager.blockEnd+1}&sort_option=${map.sort_option}&keyword=${map.keyword}"  class="page_right">></a></li>
					</c:if>

				</ul>
			</div>
			
		</div>
	</div>
	</div>
</body>

<script type="text/javascript">
	$(function(){
		var sort_option = '${map.sort_option}';
		$('#sort_'+sort_option).css('color','tomato');
		
 	});

	
	/*
	
 	if(!('${map.keyword}'=='')){
		$('#search_result').css('display','block');
	}else {
		$('#search_result').css('display', 'hidden');
	} 
 */



</script>
</html>