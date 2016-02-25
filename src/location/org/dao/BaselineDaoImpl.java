package location.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class BaselineDaoImpl implements BaselineDao{

	@Override
	public void insertBaseline(Baseline bl) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "insert into baseline(m_name,r_name,u_name) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bl.getM_name());
			pstmt.setString(2, bl.getR_name());
			pstmt.setString(3, bl.getU_name());
			pstmt.executeUpdate();
			System.out.println("a baseline has been inserted!");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
	}

	@Override
	public List<Baseline> findBaseline(String username) {
		// TODO Auto-generated method stub
		List<Baseline> ret = new LinkedList<Baseline>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from baseline where u_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			//System.out.println(username);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Baseline tmp = new Baseline(rs.getDouble("bl_id"),rs.getString("m_name")
						,rs.getString("r_name"),rs.getString("u_name"));
				ret.add(tmp);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		
		System.out.println("返回baselin列表的大小为："+ret.size());
		return ret;
		
	}

	@Override
	public double findBaseline(Baseline bl) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		double flag = -1;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from baseline where m_name=? and r_name=? and u_name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bl.getM_name());
			pstmt.setString(2, bl.getR_name());
			pstmt.setString(3, bl.getU_name());
			rs = pstmt.executeQuery();
			if(rs.next()){
				flag= rs.getDouble("bl_id");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		return flag;
	}
	
}
