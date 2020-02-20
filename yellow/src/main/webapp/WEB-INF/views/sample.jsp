<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample.jsp</title>
</head>
<body>				<!-- 물음표 뒤는 데이터 영역 -->
	<a href="${path}/sample/view?user=배뚱&pass=1234">GET</a>
	
	<form action="${path}/sample/view"  method="post">
		<!-- input, textarea, selecet,radio,check... -->
		<input type="text" name="user"><!-- 네임만 받을수 있다. id값은 못받음 절대로  -->
		<input type="password" name="pass">
		<button type="submit" >POST</button>
	</form>
	
	<img src="${path}/resources/image/img/southcrill.png" style="width:500px; height:500px;">
	
	<a href="${path}/sample/sync?name=배뚱아">동기방식</a>
	<button type="button" id="ajax_btn">비동기방식(AJAX)</button>	
	<br>
	<div><span>동기: ${name}</span></div>
	<div><span>비동기: <span id="ajax_txt"></span></span></div>
	
</body>
<script type="text/javascript">

	//type: GET or POST
	//URL: 서버단 목적지 (RequestMapping으로 받는 요청)
	//contentType: 서버단으로 전송하는 데이터의 타입
	//data: 서버로 전송하는 실제 데이터
	//dataType: 서버단에서 View단으로 전송하는 데이터타입(생략: String) // 자바스크립트는 문자열이든 숫자든 var로 받으니까 신경 쓰지맙시다.
	//SUCCESS: AJAX 성공했을때 작업(DATA: AJAX 서버단 Return 값)
	//error: AJAX 실패했을때 작업
	//Json= {Key:value, key:value, key:value} 데이터 전송하는 방식
	$('#ajax_btn').on('click', function(){//버튼을 클릭하면 에이젝스를 타는데 페이지 전환이 없다(인덱스페이지 갔다가 돌아나온다. 못나오면 오류난다.)		
	$.ajax({ // 아작스 쓰겠따 명시해놓은것
		type: 'POST',
		url: '${path}/sample/ajax',//url은 요청을 처리하는것
		//url: '${path}/sample/ajax?name=뚱깐징어',data : {name: '뚱깐징어'} 이거없이 쿼리스트링으로 해도 가능하다. 
		/* contextType: 'application/json', */
		data : {name: '뚱깐징어'},// 네임이라는 것에 뚱깐징어를 보내겠다. {key: value}
		success: function(data){ //()안에 아무거나 써도 된다. 이거하나로 리스트, dto 다 받을수 있다. /데이터에 샘플컨트롤러에서 반환받은 네임  뚱깐징어 들어가있음
			console.log(data);
			$('#ajax_txt').text(data); 
		},
		error: function(){
			alert('System ERROR :(');
		}		
	});
});
</script>
</html>