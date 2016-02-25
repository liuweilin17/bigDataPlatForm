package location.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao{

	@Override
	public void insertUser(User user) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = DbUtils.getConnection();
			String sql = "insert into user(u_name,u_password,u_identity) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getU_name());
			pstmt.setString(2, user.getU_password());
			pstmt.setInt(3, 2);
			pstmt.executeUpdate();
			System.out.println("a user has been inserted!");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		
	}

	@Override
	public void deleteUser(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean findUser(String username, String password, int role) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from user where u_name=? and u_password=? and u_identity=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setInt(3, role);
			rs = pstmt.executeQuery();
			if(rs.next()){
				flag= true;
			}
			else{
				flag = false;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeResultSet(rs);
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		return flag;
	}

	@Override
	public boolean findUsername(String username) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from user where u_name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if(rs.next()){
				flag= true;
			}
			else{
				flag = false;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeResultSet(rs);
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		return flag;
		
	}
	
}
