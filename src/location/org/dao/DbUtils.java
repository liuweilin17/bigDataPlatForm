package location.org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbUtils {
	private DbUtils(){}
	private static Connection conn = null;
	public static Connection getConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/bigdataplatform";
			String user = "root";
			String password = "";
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("ok"+conn);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return conn;
	}
	public static void closeConnection(){
		try{
			if(conn != null){
				conn.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public static void closeStatement(Statement stmt){
		try{
			if(stmt != null){
				stmt.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public static void closeResultSet(ResultSet rs){
		try{
			if(rs != null){
				rs.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
}
