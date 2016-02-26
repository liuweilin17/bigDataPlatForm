package location.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Integer> findPro_idByU_id(int u_id) {
		// TODO Auto-generated method stub
		List<Integer> pro_idList = new ArrayList<Integer>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from admin where u_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_id);
			//System.out.println(username);
			rs = pstmt.executeQuery();
			while(rs.next()){
				pro_idList.add(rs.getInt("pro_id"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeResultSet(rs);
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		
		System.out.println("返回admin pro_id 数量的大小为："+pro_idList.size());
		return pro_idList;
	}

	@Override
	public boolean insertAdmin(int u_id, int pro_id, int role) {
		// TODO Auto-generated method stub
		boolean ret = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "insert into admin(u_id,pro_id,int role) values(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_id);
			pstmt.setInt(2, pro_id);
			pstmt.setInt(3, role);
			pstmt.executeUpdate();
			System.out.println("an admin has been inserted!");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		return ret;
	}

	@Override
	public int findRole(int u_id, int pro_id) {
		// TODO Auto-generated method stub
		int role = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from admin where u_id = ? and pro_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_id);
			pstmt.setInt(2, pro_id);
			//System.out.println(username);
			rs = pstmt.executeQuery();
			if(rs.next()){
				role = rs.getInt("role");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeResultSet(rs);
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		
		return role;
	}

}
