package com.yellow.persistence;

import java.util.List;

import com.yellow.domain.ProductDTO;

public interface ProductDAO {

//	@Select("SELECT COUNT(*) FROM tbl_pdt")
//	public int getCount();
//	
//	public int getCount2();
	
	public List<ProductDTO> bestPdtList();
}
