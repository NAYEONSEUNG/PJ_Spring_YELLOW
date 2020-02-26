package com.yellow.service.mail;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.yellow.persistence.MemberDAO;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	JavaMailSender mailsender;

	@Autowired
	private SqlSession sqlSession;

	private MemberDAO mDao;

	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}

	// 이메일 난수 생성 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();//StringBuffer 를 안쓰고 걍 string만 써도 작업은 가능. 
		//왜 스트링버퍼를썼냐면 문자열을 처리하는 효율성 때문에 사용함 ,,스트링버퍼는 힙영역이 아닌 버퍼영역(임시저장소)에 넣어두었다가 한번에 최종적으로 보내겠다는 것.
		int num = 0;
		do {//두 와일은 두를 한번실행하고 그다음으로 가는것 
			num = ran.nextInt(75) + 48; //랜덤객체의 함수를 한번실행 
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);//어펜드는 기존값 맨 뒤에다가 붙히는것, 차는 문자하나를 체크
			} else {
				continue;
			}
		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();//투스트링은 문자그대로를 주라는 말
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {//(false, 20 )이 들어감
		this.lowerCheck = lowerCheck;//인스턴스에 있는 전역변수  
		this.size = size;
		return init();
	}
	// 회원가입 발송 이메일(인증키 발송)
	@Override
	public void mailSendUser(String email, String id, HttpServletRequest request) {		
			String key = getKey(false, 20);//길이 20의 난수 생성, 첫번째작업이 난수를 만드는 것
			//getkey메서드를 호출 
			mDao.getKey(id,key);
			MimeMessage mail = mailsender.createMimeMessage();//mime은 타입중의 하나(사진, 영상, 소리등을 형변환해주는것)
			String htmlTxt = "<h2>안녕하세요 노란알약입니다.</h2><br><br>"						
						+ "<h3>"+id+"님</h3>" + "<p>인증하기 버튼을 누리시면 노란알약 사이트 활동이 가능합니다."
						+ "<a href='http://localhost:8081" + request.getContextPath()+"/member/keyauth?id="+id+"&key=" +key+"'>인증하기</a></p>"
						+ "(YELLOW에 가입한적이 없다면 무시하셔도 됩니다)";
				try {
					mail.setSubject("[본인인증] Yellow님의 인증메일입니다", "utf-8");//메일의 제목을 주겠다.
					mail.setText(htmlTxt, "utf-8", "html"); //메일 내용, 형식은 html형식 
					mail.addRecipient(RecipientType.TO, new InternetAddress(email));//수신인 쓰는곳
					mailsender.send(mail);//메일발송
				} catch (MessagingException e) {
					e.printStackTrace();
			
				}	
	}	

	@Override
	public int keyAuth(String id, String key) {
		return mDao.alterKey(id, key);
	}
	
}
