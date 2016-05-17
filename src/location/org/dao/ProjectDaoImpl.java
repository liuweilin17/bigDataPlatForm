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
			String sql = "insert into project(pro_name,pro_info) values(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pro.getPro_name());
			pstmt.setString(2, pro.getInfo());
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
	public Project findProjectName(String pro_name) {
		Project project = null;
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
			if(rs.next()){
				project = new Project(rs.getInt("pro_id"),rs.getString("pro_name"),rs.getString("info")); 
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeResultSet(rs);
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		// TODO Auto-generated method stub
		return project;
	}

	@Override
	public List<Project> findProject(int u_id) {
		// TODO Auto-generated method stub
		List<Project> ret = new LinkedList<Project>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from project where pro_id in (select pro_id from admin where u_id = ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_id);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Project tmp = new Project(rs.getInt("pro_id"),rs.getString("pro_name")
						,rs.getString("pro_info"));
				ret.add(tmp);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeResultSet(rs);
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		
		System.out.println("返回project列表的大小为："+ret.size());
		return ret;
	}
	
}
