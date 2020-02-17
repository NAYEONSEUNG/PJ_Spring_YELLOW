package com.yellow.service.index;

import java.util.List;

import com.yellow.domain.ProductDTO;

//인터페이스 안에는 상수와 추상메서드만 온다. 
//추상메서드는 실체가 없는 메서드 
public interface IndexService {
	
	//베스트 상품을 5건 출력
	public List<ProductDTO> bestPdtList();
}
