package com.yellow.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Data 굳이 필요없는 생성자까지 만들어 버리니까 사용하지말자
@NoArgsConstructor // 디폴트 생성자 만들어준다.
@AllArgsConstructor //변수 전체다 포함하고있는 생성자 만들어준다.
@Getter
@Setter
@ToString
public class TestDTO {
	String name;
	int score;
}
