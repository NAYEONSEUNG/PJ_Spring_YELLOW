	//파일 정보 처리
	function getFileInfo(fullName, path){
		var originalFileName;	//화면에 출력할 파일명
		var imgSrc;				//썸네일 or 파일아이콘 이미지 파일
		var originalFileUrl;	//원본파일 요청 url
		var uuidFileName;		//날짜경로를 제외한 나머지 파일명(UUID)
		var basicFileName =fullName;	//삭제시 값을 전달하기 위한
		if(checkImageType(fullName)){
			console.log("img");
		
			imgSrc = path+"/upload/displayFile?fileName="+fullName;
			//썸네일 이미지 링크
			uuidFileName = fullName.substr(14);// 14번부터 끝까지 
			var originalImg =fullName.substr(0,12) + fullName.substr(14);
			//원본이미지 요청 링크
			originalFileUrl = path+"/upload/displayFile?fileName="+originalImg;
		}else{
			console.log("file");
		
			imgSrc =  path+"/resources/image/file-icon.png"; //파일 아이콘 이미지 링크
			uuidFileName = fullName.substr(12);
			originalFileUrl = path+"/upload/displayFile?fileName="+fullName;	//파일 다운로드 요청 링크
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
	function printFiles(data, path){
		//파일정보처리
		var fileInfo = getFileInfo(data, path);
		 console.log(fileInfo); 
		//Handlers 파일 템플릿에 파일 정보들을 바이딩하고 html 생성
		var html = fileTemplate(fileInfo);
		html += "<input type = 'hidden' class='file' value='"+fileInfo.fullName+"'>";
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