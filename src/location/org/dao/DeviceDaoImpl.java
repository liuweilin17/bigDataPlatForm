package location.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class DeviceDaoImpl implements DeviceDao{

	@Override
	public void insertDevice(Device dev) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean findDeviceName(String dev_name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Device> findDevice(int pro_id) {
		// TODO Auto-generated method stub
		List<Device> ret = new LinkedList<Device>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from device where pro_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pro_id);
			//System.out.println(username);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Device tmp = new Device(rs.getInt("dev_id"),rs.getString("dev_name")
						,rs.getInt("pro_id"),rs.getInt("for_id"));
				ret.add(tmp);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		
		System.out.println("返回device列表的大小为："+ret.size());
		return ret;
	}
	
}
