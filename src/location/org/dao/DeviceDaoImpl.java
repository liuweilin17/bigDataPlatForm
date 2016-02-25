package location.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class DeviceDaoImpl implements DeviceDao{

	@Override
	public boolean insertDevice(Device dev) {
		// TODO Auto-generated method stub
		boolean ret = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "insert into device(dev_name,pro_id,for_id) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dev.getDev_name());
			pstmt.setInt(2, dev.getPro_id());
			pstmt.setInt(3, dev.getFor_id());
			pstmt.executeUpdate();
			System.out.println("a device has been inserted!");
			ret = true;
		}catch(SQLException e){
			e.printStackTrace();
			ret = false;
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		return ret;
	}
	@Override
	public boolean deleteDevice(int dev_id){
		//创建pro_id和dev_id外键约束，删掉对应数据类型
		boolean ret = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "delete from device where dev_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dev_id);
			pstmt.executeUpdate();
			System.out.println("a device has been deleted!");
			ret = true;
		}catch(SQLException e){
			ret = false;
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		return ret;
	}
	@Override
	public Device findDeviceName(int pro_id, String dev_name) {
		// TODO Auto-generated method stub
		Device ret = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from device where pro_id = ? and dev_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pro_id);
			pstmt.setString(2, dev_name);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Device tmp = new Device(rs.getInt("dev_id"),rs.getString("dev_name")
						,rs.getInt("pro_id"),rs.getInt("for_id"));
				ret=tmp;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeResultSet(rs);
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		return ret;
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
			DbUtils.closeResultSet(rs);
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		
		System.out.println("返回device列表的大小为："+ret.size());
		return ret;
	}
	@Override
	public Device findDeviceById(int dev_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Device ret = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from device where dev_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dev_id);
			//System.out.println(username);
			rs = pstmt.executeQuery();
			if(rs.next()){
				Device tmp = new Device(rs.getInt("dev_id"),rs.getString("dev_name")
						,rs.getInt("pro_id"),rs.getInt("for_id"));
				ret=tmp;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeResultSet(rs);
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		return ret;
	}
	@Override
	public String findDeviceData(String table_name, int dev_id, String[] for_name_array, String[] for_type_array) {
		// TODO Auto-generated method stub
		String ret = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int len = for_name_array.length;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from " + table_name + " where dev_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dev_id);
			//System.out.println(username);
			rs = pstmt.executeQuery();
			while(rs.next()){
				//String tmp = new Device(rs.getInt("dev_id"),rs.getString("dev_name")
						//,rs.getInt("pro_id"),rs.getInt("for_id"));
				String tmp="";
				for(int i=0;i<len;i++){
					if(for_type_array[i].equals("varchar")){
						tmp+=rs.getString(for_name_array[i])+":";
					}else if(for_type_array[i].equals("int")){
						tmp+=rs.getInt(for_name_array[i])+":";
					}else if(for_type_array[i].equals("float")){
						tmp+=rs.getFloat(for_name_array[i])+":";
					}else if(for_type_array[i].equals("double")){
						tmp+=rs.getDouble(for_name_array[i])+":";
					}else{
						System.out.println("there is new type!!");
						ret=null;
						break;
					}
				}
				ret+=tmp+",";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeResultSet(rs);
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		return ret;
	}
	@Override
	public String findChartData(String table_name, int dev_id, String name) {
		// TODO Auto-generated method stub
		String type = findTypeByName(dev_id,name);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String ret = "";
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from " + table_name + " where dev_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dev_id);
			rs = pstmt.executeQuery();
			
			
			if(type.equals("varchar")){
				List<String> data = new ArrayList<String>();
				while(rs.next()){
					data.add(rs.getString(name));
				}
				ret = data.toString();
			}else if(type.equals("int")){
				List<Integer> data = new ArrayList<Integer>();
				while(rs.next()){
					data.add(rs.getInt(name));
				}
				ret = data.toString();
			}else if(type.equals("float")){
				List<Float> data = new ArrayList<Float>();
				while(rs.next()){
					data.add(rs.getFloat(name));
				}
				ret = data.toString();
			}else if(type.equals("double")){
				List<Double> data = new ArrayList<Double>();
				while(rs.next()){
					data.add(rs.getDouble(name));
				}
				ret = data.toString();
			}else{
				System.out.println("there is new type!");
				return "";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeResultSet(rs);
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		return ret;
	}
	@Override
	public String findTypeByName(int dev_id, String name) {
		// TODO Auto-generated method stub
		// 找到name 对应 type
		String ret = "";
		
		int for_id = findDeviceById(dev_id).getFor_id();
		FormatDao formatdao = new FormatDaoImpl();
		ret = formatdao.findTypeByName(for_id,name);
		
		return ret;
	}
	
}
