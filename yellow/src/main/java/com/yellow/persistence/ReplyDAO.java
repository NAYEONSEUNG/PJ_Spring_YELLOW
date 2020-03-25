package com.yellow.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yellow.domain.ReplyDTO;

public interface ReplyDAO {

	public List<ReplyDTO> list(@Param("bno") int bno);// @Param("bno") 이거 없으면 꺼낼때 int bno로 꺼내야 한다. 근데 붙어있으니까 bno만 꺼낸다. 

}
