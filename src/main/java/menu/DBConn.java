package menu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	
	//연결 문자열
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String dbUrl ="jdbc:oracle:thin:@localhost:1521:xe";
	private String dbId = "test";
	private String dbPw = "1234";
	
	private Connection conn = null;
	
	
	public Connection getConnection() {
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(dbUrl,dbId,dbPw); 
	}catch(ClassNotFoundException e) {
		System.out.println("드라이버 설정을 확인하세요");
		
	}catch(SQLException e) {
		e.printStackTrace();
		System.out.println("DB 연결이 잘못되었습니다.");
	}
		return conn;
	
	}
	
	//db연결
	
	

	
	
}
