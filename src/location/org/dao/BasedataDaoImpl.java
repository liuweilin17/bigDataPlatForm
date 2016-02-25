package location.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class BasedataDaoImpl implements BasedataDao{

	@Override
	public void insertBasedata(Basedata bd) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "insert into basedata(bl_id,b_time,b_prec,b_lat,b_lon,b_x,b_y,b_z) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, bd.getBl_id());
			pstmt.setString(2, bd.getB_time());
			pstmt.setDouble(3, bd.getB_prec());
			pstmt.setString(4, bd.getB_lat());
			pstmt.setString(5, bd.getB_lon());
			pstmt.setDouble(6, bd.getB_x());
			pstmt.setDouble(7, bd.getB_y());
			pstmt.setDouble(8, bd.getB_z());
			pstmt.executeUpdate();
			System.out.println("a basedata has been inserted!");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
	}

	@Override
	public boolean findBasedata(Basedata bd) {
		// TODO Auto-generated method stub
		//由于在插入basedata会先插入baseline,baseline插入时护肩测是否重复插入，因此basedata插入时可以不必考虑重复插入问题
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		boolean flag = false;
//		try{
//			conn = DbUtils.getConnection();
//			String sql = "select * from basedata where bl_id=? and r_name=? and u_name=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, bl.getM_name());
//			pstmt.setString(2, bl.getR_name());
//			pstmt.setString(3, bl.getU_name());
//			rs = pstmt.executeQuery();
//			if(rs.next()){
//				flag= true;
//			}
//			else{
//				flag = false;
//			}
//		}catch(SQLException e){
//			e.printStackTrace();
//		}finally{
//			DbUtils.closeStatement(pstmt);
//			DbUtils.closeConnection();
//		}
//		return flag;
		return false;
	}

	@Override
	public List<Basedata> findBasedata(double bl_id) {
		// TODO Auto-generated method stub
		List<Basedata> ret = new LinkedList<Basedata>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from basedata where bl_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1,bl_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Basedata tmp = new Basedata(rs.getDouble("bd_id"),rs.getDouble("bl_id"),
						rs.getString("b_time"),rs.getDouble("b_prec"),
						rs.getString("b_lat"),rs.getString("b_lon"),
						rs.getDouble("b_x"),rs.getDouble("b_y"),rs.getDouble("b_z"));
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
	public void deleteBasedata(double bl_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		try{
			conn = DbUtils.getConnection();
			String sql1 = "delete from baseline where bl_id=?";
			String sql2 = "delete from basedata where bl_id=?";
			pstmt1 = conn.prepareStatement(sql1);
			pstmt2 = conn.prepareStatement(sql2);
			pstmt1.setDouble(1, bl_id);
			pstmt2.setDouble(1, bl_id);
			pstmt1.executeUpdate();
			pstmt2.executeUpdate();
			System.out.println(""+bl_id+"baseline and basedata has been deleted");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt1);
			DbUtils.closeStatement(pstmt2);
			DbUtils.closeConnection();
		}
	}

}
