package location.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ProjectDaoImpl implements ProjectDao{

	@Override
	public void insertProject(Project pro) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "insert into project(pro_name,pro_info,u_name) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pro.getPro_name());
			pstmt.setString(2, pro.getInfo());
			pstmt.setString(3, pro.getU_name());
			pstmt.executeUpdate();
			System.out.println("a project has been inserted!");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
	}

	@Override
	public boolean findProjectName(String pro_name) {
		boolean ret = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from project where pro_name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pro_name);
			rs = pstmt.executeQuery();
			System.out.println("in search!");
			System.out.println(rs.getFetchSize());
			if(!rs.next()){
				ret = false; 
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		// TODO Auto-generated method stub
		return ret;
	}

	@Override
	public List<Project> findProject(String username) {
		// TODO Auto-generated method stub
		List<Project> ret = new LinkedList<Project>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from project where u_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			//System.out.println(username);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Project tmp = new Project(rs.getInt("pro_id"),rs.getString("pro_name")
						,rs.getString("pro_info"),rs.getString("u_name"));
				ret.add(tmp);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		
		System.out.println("返回project列表的大小为："+ret.size());
		return ret;
	}
	
}
