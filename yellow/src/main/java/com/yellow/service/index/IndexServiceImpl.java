package com.yellow.service.index;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yellow.domain.ProductDTO;
import com.yellow.persistence.ProductDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IndexServiceImpl implements IndexService {

	//기존에는 DAO -> Mybatyis -> DB(Oracle) 순자적으로
	//동작해서 비효율적이던 실행방법을 다음과 같이
	//DAO + Mapper를 결합해서 사용하는 방식을 사용
	
	//SqlSession을 사용하기 위한 의존성 주입
	// : root-context.xml에서 생성된 sqlSession 빈즈를 주입 받음!
	@Autowired
	private SqlSession sqlSession;

	
	ProductDAO pDao; //전역변수  값이 없으면 null로초기화
	@Autowired
	public void newProductDAO() {
		pDao = sqlSession.getMapper(ProductDAO.class);
	}
	@Override
	public List<ProductDTO> bestPdtList() {
		//비즈니스로직
		//:best상품 5건을 조회해서 view(메인)단에  출력
//		log.info("@을 사용한 방법: " + pDao.getCount());
//		log.info("xml을 사용한 방법: " + pDao.getCount());
//		List<ProductDTO> list = pDao.bestPdtList();
		
//		for(ProductDTO productDTO : list) {
//			log.info(productDTO.toString());
//		}
		
		//베스트 상품을 4건 출력
	
		
		//신상품을 4건 출력
		
		
		return pDao.bestPdtList();
	}
	@Override
	public List<ProductDTO> newPdtList(){
		// 비즈니스로직을 처리
		//신상품 5건을 출력 => db작업
		//: db작업은 MODEL단 시킴
		
		//db작업위해 model단으로 이동
		// Model(ProductDAO + Mapper) 인터페이스의 newPdtList() 인터페이스의 newPdtList()메서드를 실행하고 return받음 !
		//Model(ProductDAO + Mapper) 인터페이스의 newPdtList()
		
//		pDao.newPdtList(); //newpdtlist 실행하라고 
		return pDao.newPdtList();
	}
	public List<ProductDTO> newPdtList2(){
		// 비즈니스로직을 처리
		//신상품 5건을 출력 => db작업
		//: db작업은 MODEL단 시킴
		
		//db작업위해 model단으로 이동
		// Model(ProductDAO + Mapper) 인터페이스의 newPdtList() 인터페이스의 newPdtList()메서드를 실행하고 return받음 !
		//Model(ProductDAO + Mapper) 인터페이스의 newPdtList()
		
//		pDao.newPdtList(); //newpdtlist 실행하라고 
		return pDao.newPdtList2();
	}

}
