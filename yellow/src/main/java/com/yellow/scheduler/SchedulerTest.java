package com.yellow.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SchedulerTest {
	
		//cron 표기법
		//@Scheduled(cron = "0 51 9 * * *") // 년월일 시분초 //  * 붙히면 매번 9시 46분에 로그가 뜬다. 
		public void cronTest() {
			log.info("welcome scheduling");
		}
}
