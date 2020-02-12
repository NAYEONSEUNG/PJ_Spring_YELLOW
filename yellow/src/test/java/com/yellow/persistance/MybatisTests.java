package com.yellow.persistance;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//JUnit Test Case로 만든 클래스
//JUnit 4 버전으로 테스트
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations=
{"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MybatisTests {
	
	//로깅을 위한 변수]
	private static final Logger logger=
			LoggerFactory.getLogger(MybatisTests.class);
	
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void textFactory() {
		logger.info("SqlFactory:"+sqlFactory);
	}
	@Test
	public void textSession() {
		try (SqlSession sqlSession = sqlFactory.openSession()){
			logger.info("SqlSession:"+sqlSession);
			logger.info("Mybatis 연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
