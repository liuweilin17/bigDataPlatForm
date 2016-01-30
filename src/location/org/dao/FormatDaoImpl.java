package location.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class FormatDaoImpl implements FormatDao{

	@Override
	public void insertFormat(Format form) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Format> findFormat(int pro_id) {
		// TODO Auto-generated method stub
		List<Format> ret = new LinkedList<Format>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from format where pro_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pro_id);
			//System.out.println(username);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Format tmp = new Format(rs.getInt("for_id"),rs.getString("for_name"),rs.getString("for_typelist")
						,rs.getString("for_namelist"),rs.getInt("pro_id"));
				
				ret.add(tmp);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		
		System.out.println("返回format列表的大小为："+ret.size());
		return ret;
	}

	@Override
	public Format findFormatById(int for_id) {
		// TODO Auto-generated method stub
		Format ret = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from format where for_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, for_id);
			System.out.println(for_id);
			System.out.println("1");
			rs = pstmt.executeQuery();
			System.out.println("2");
			if(rs.next()){
				ret = new Format(rs.getInt("for_id"),rs.getString("for_name"),rs.getString("for_typelist")
					,rs.getString("for_namelist"),rs.getInt("pro_id"));
			}
			System.out.println("3");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		return ret;
	}

}
