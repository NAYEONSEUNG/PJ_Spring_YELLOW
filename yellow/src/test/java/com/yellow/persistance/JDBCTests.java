package com.yellow.persistance;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTests {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test //테스트할건데 이 메서드 실행해봐! 라는 뜻  
	public void textConnection() {
		try (Connection conn =
			DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:XE",
			"java",
			"1234")) {
				System.out.println(conn);
					
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

}
