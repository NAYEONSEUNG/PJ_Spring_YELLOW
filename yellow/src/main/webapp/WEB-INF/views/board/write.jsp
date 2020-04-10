<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
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
		.form-group{
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
							<textarea cols="93" rows="28" placeholder="게시글을 입력하세요" id="board_content" name="view_content" style="min-width:650px;">${one.view_content}</textarea>
							
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<div class="file_plus input_wrap form-group fileDrop">
								<div class="board_div">
									<span class="file_ment">첨부파일을 넣어주세요</span>
								</div>
							</div>
								<ul class="mailbox-attachments clearfix uploadedList" style="display:flex;"></ul> 	
						</td>
					</tr> 
<!-- 					<div class = "input_wrap form-group">
						<div class="board_div fileDrop">
							<p>첨부파일을 드래그</p>
						</div>
						<ul class="mailbox-attachments clearfix uploadedList"></ul> 
					</div> -->
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
<script id="fileTemplate" type="text/x-handlers-template">
	<li>
		<div class="mailbox-attachment-icon has-img">
			<center><img alt="Attachment" src="{{imgSrc}}" class="s_img"></center>
			
		</div>
	    <div class = "mailbox-attachment-info">
			<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
	   			<i class = "fa fa-paperclip"></i> {{originalFileName}}
			</a>
			<span class = "btn btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
				<i class="fas fa-times"></i>
			</span>
		</div>
	</li>
		
</script>
<script type="text/javascript">
	var flag = '${flag}';
	console.log('flag:' + flag);
	var fileTemplate = Handlebars.compile($("#fileTemplate").html());
	$(function(){
	//	alert('데이터: ' +${one}); // 공백으로 뜬다는거는 그 코드를 그대로 써도 된다는 것 
		//register ==> 게시글 등록과 게시글 수정
		//${one}에값이 있으면 수정페이지 로딩!
		//if('${one}' != ''){
		if(flag == 'update'){
			//수정페이지로 디자인 변경
			$('.content_header').text('글 수정');//글씨 바꾸는거 .text를 이용해서
			$('.up_btn').text('수정');
			//selectbox값으로 selected
			$('.board_type').val('${one.type}').attr('selected','selected');// 셀렉트박스에서 그녀석을 셀렉트해라
							//free인것을 셀렉트해주세요
			$('.up_time')	
		}else if(flag == 'answer'){
			$('.content_header').text('게시글 답글');// 글씨 바꾸는거 .text를 이용해서
			$('.up_btn').text('답글');
			$('.board_type').val('${one.type}').attr('selected', 'selected') // 셀렉트박스가 비활성화되면서 클릭이 안된다. 
											   .attr('onFocus','this.initialSelect = this.selectedIndex')
										       .attr('onChange','this.selectedIndex = this.initialSelect');
			$('.subject_input').val('${one.title}').attr('readonly', 'readonly');
		}
		
		//1.웹브라우저에 drag&drop시 파일이 열리는 문제(기본효과)
		//기본 효과 막음!
		$('.fileDrop').on('dragenter dragover',function(e){
			e.preventDefault();	
		});
		//2.사용자가 파일을 drop했을때
		$('.fileDrop').on('drop',function(e){
			e.preventDefault(); 
			
			var files=e.originalEvent.dataTransfer.files; //드래그에 전달된
			var file = files[0]; //그중 하나만 꺼내옴, 몇개를 넣든 한개만 뽑아온다. 
			
			var formData = new FormData(); // 폼 객체 생성
			formData.append('file',file); // 폼에 파일 1개 추가 !
			
			//서버에 파일 업로드
			$.ajax({
				url: '${path}/upload/uploadAjax',
				data: formData,
				datatype: "text",	//서버에서 내가 받는것, 서버단에서 화면단으로 받는것 ,생략을해도 문제가 없다.
				processData: false, //프로세스 타입을 펄스로 주면은 쿼리스트링 방식을 안쓴다., 쿼리스트링 방식 생성 x, false로 입력해주면 폼데이터인데 
				//																									그 폼데이터의 타입을 멀티파트로 보내겠다.
				contentType: false, // 갈때 데이터 정보(보내려고 하는것 ajax에서 서버로 보낼력고 하는것), 멀티파트 서버단으로 전송하는 데이터 타입(multipart)사진,영상같은것 	
																										//확장팩 개념이다. 
				type: 'POST', // 첨부파일같은 큰 파일들 보낼때는 무조건 타입은 POST로 한다. GET로는 절대 못받음. 
				success: function(data){
					console.log(data);
					//data: 업로드한 파일 정보와 http상태 코드
					printFiles(data);// 첨부파일 출력 메서드 호출
				}
			
			});
			
		});
		
		$('.uploadedList').on('click','.delBtn',function(event){
			var bno = '${one.bno}';
			var that = $(this);
		
			if(bno == ''){//게시글 등록
				$.ajax({
					url:'${path}/upload/deleteFile',
					type: 'POST',
					data: {fileName: $(this).attr('data-src')},//delBtn의 데타-src
					success:function(data){// success: data = 'deleted'
						if(data == 'deleted'){
							that.parents('li').remove(); /* // remove는 display: none; 과 같다.  */
						}
					}, error:function(){
						alert('system error');
					}
				});
				
			}else{// 게시글 수정
									    
			}
		});
					
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
	
		//스마트에디터의 값을 #board_content
			oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);
			var view_content = $('#board_content').val();
			console.log("view_content" + view_content);
			
			//정규식을 통ㅎ새 HTML태그를 제거 후 순수 Text만 추출
			var search_content = view_content.replace(/(<([^>]+)>)/ig, "").replace("&nbsp;", "");
			console.log('search_content:' + search_content);
			
			$('#frm_board').append('<textarea id="search_content" name="search_content"></textarea>');// 게시글 등록버튼 눌렀을때 폼태그의 맨 마지막에 추가 ㄱㄱ
			$('#search_content').val(search_content);
/* 			var search_content2 = $('#search_content').val();
			console.log('search_content2: ' + search_content2); */
			
			//서버로 전송
			$('#frm_board').submit();
			alert('서버로 이동');
		}
	});
	
	//파일 정보 처리
	function getFileInfo(fullName){
		var originalFileName;	//화면에 출력할 파일명
		var imgSrc;				//썸네일 or 파일아이콘 이미지 파일
		var originalFileUrl;	//원본파일 요청 url
		var uuidFileName;		//날짜경로를 제외한 나머지 파일명(UUID)
		var basicFileName =fullName;	//삭제시 값을 전달하기 위한
		if(checkImageType(fullName)){
			console.log("img");
		
			imgSrc = "${path}/upload/displayFile?fileName="+fullName;
			//썸네일 이미지 링크
			uuidFileName = fullName.substr(14);// 14번부터 끝까지 
			var originalImg =fullName.substr(0,12) + fullName.substr(14);
			//원본이미지 요청 링크
			originalFileUrl ="${path}/upload/displayFile?fileName="+originalImg;
		}else{
			console.log("file");
		
			imgSrc = "${path}/resources/image/file-icon.png"; //파일 아이콘 이미지 링크
			uuidFileName = fullName.substr(12);
			originalFileUrl = "${path}/upload/displayFile?fileName="+fullName;	//파일 다운로드 요청 링크
		}
		originalFileName = uuidFileName.substr(uuidFileName.indexOf("_")+1) //전체파일명의 크기가 14보다 작으면 그대로 이름 출력,
		if(originalFileName.length>14){
			
		
			var shortName = originalFileName.substr(0,10);
			var formatVal = originalFileName.split(".");
			var arrNum = formatVal.length -1;
			originalFileName = shortName+"..."+formatVal[arrNum];
		}
		return {originalFileName: originalFileName, imgSrc:imgSrc,originalFileUrl:originalFileUrl,fullName:fullName,basicFileName:basicFileName};
	}
		

	//첨부파일 출력
	function printFiles(data){
		//파일정보처리
		var fileInfo = getFileInfo(data);
		 console.log(fileInfo); 
		//Handlers 파일 템플릿에 파일 정보들을 바이딩하고 html 생성
		var html = fileTemplate(fileInfo);
		html += "<input type = 'hidden' class='file' value='+fileInfo.fullName+'>";
		//Handler파일 템플릿 컴파일을 통해 생성된 html을 dom에 주입
		$('.uploadedList').append(html);
		//이미지 파일인 경우 aaaaaaa파일 템플릿에 lightbox속성 추가
		if(fileInfo.fullName.substr(12, 2) === "s_"){
			//마지막 추가된 첨부파일 템플릿 선택자
			var that = $(".upladedList li").last();
		 //light속성추가
		 that.find(".mailbox-attachment-name").attr("data-lightbox", "uploadImages");
		 // 아이콘에서 이미지 아이콘으로 변경
		 that.find(".fa-paperclip").attr("class",".fa fa-camera");
		}
	}
	function getOriginalName(fileName){
		if(checkImageType(fileName)){//이미지 파일이면 skip
			return;
		}
		var idx=fileName.indexOf("_")+1; //uuid를 제외한 파일이름
		return fileName.substr(idx);
	}
	function getImageLink(fileName){
		if(!checkImageType(fileName)){// 이미지 파일이 아니면 스킵
			return;
		}
		var front=fileName.substr(0.12);// 년월일 경로
		var end=fileName.substr(14);//s_제거
		return front + end;
	}
	function checkImageType(fileName){
		var pattern=/jpg|gif|png|jpeg/i; //정규표현식(대소문자 무시)
		console.log(">>>>>>"+fileName.match(pattern));
		return fileName.match(pattern);//규칙에 맞으면 true
	}
	
	//첨부파일 리스트를 출력하는 함수
	function listAttach(){
		var listCnt = 0;
		$.ajax({
			type: "post",
			url:"${path}/board/getAttach/${one.bno}",
			async: false,
			success: function(list){
				//list: json
				//console.log(list);
				listCnt = list.length;
				/* console.log(list.length); */
/* 				jQuery each()는 반복문
				i와e는 index와 element로
				json에서 {0: "apple.png"}일 때
				index는 0, element는 apple.png가 됨 */
				$(list).each(function(i, e){
					/* console.lgo(list) */
					printFiles(e);
				});
				
			}
		});
		
	}
	
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