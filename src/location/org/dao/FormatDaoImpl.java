package location.org.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class FormatDaoImpl implements FormatDao{

	@Override
	public boolean insertFormat(Format form) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		boolean ret = false;
		try{
			conn = DbUtils.getConnection();
			String sql1 = "create table if not exists "+form.for_name+"_"+form.pro_id+"(id int auto_increment primary key,";
			String[] name_array = form.for_namelist.split(",");
			String[] type_array = form.for_typelist.split(",");
			int size = name_array.length;
			String name=null;
			String type=null;
			for(int i=0;i<size;i++){
				name = name_array[i];
				type = type_array[i];
				if(type.equals("varchar")){
					type+="(255)";
				}
				if(i!=size-1){
					sql1+=name+" "+type+",";
				}else{
					sql1+=name+" "+type;
				}			
			}
			sql1+=",pro_id int(11),dev_id int(11),foreign key(pro_id) references project(pro_id) on delete cascade,"
					+ "foreign key(dev_id) references device(dev_id) on delete cascade);";
			pstmt1 = conn.prepareStatement(sql1);
			System.out.println(pstmt1);
			pstmt1.executeUpdate();
			System.out.println("a new table is created!");
			
			String sql2 = "insert into format(for_name,for_namelist,for_typelist,pro_id) values(?,?,?,?)";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, form.getFor_name());
			pstmt2.setString(2, form.getFor_namelist());
			pstmt2.setString(3, form.getFor_typelist());
			pstmt2.setInt(4, form.getPro_id());
			pstmt2.executeUpdate();
			System.out.println("a format has been inserted!");
			ret = true;
		}catch(SQLException e){
			e.printStackTrace();
			ret = false;
		}finally{
			DbUtils.closeStatement(pstmt1);
			DbUtils.closeStatement(pstmt2);
			DbUtils.closeConnection();
		}
		return ret;
	}
	
	@Override
	public boolean deleteFormat(int for_id){
		boolean ret = false;
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		try{
			conn = DbUtils.getConnection();
			//删除for_name pro_id对应table
			Format format = this.findFormatById(for_id);
			String for_name = format.getFor_name();
			int pro_id = format.getPro_id();
			String sql1 = "drop table if exists "+for_name+"_"+pro_id;
			pstmt1 = conn.prepareStatement(sql1);
			System.out.println(pstmt1);
			pstmt1.executeUpdate();
			System.out.println("a new table is dropped!");
			
			//删除Format对应记录,由于外键约束，for_id对应device也会被删掉
			String sql2 = "delete from format where for_id = ?";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, for_id);
			pstmt2.executeUpdate();
			System.out.println("a format has been deleted!");
			ret = true;
		}catch(SQLException e){
			e.printStackTrace();
			ret = false;
		}finally{
			DbUtils.closeStatement(pstmt1);
			DbUtils.closeStatement(pstmt2);
			DbUtils.closeConnection();
		}
		return ret;
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
			DbUtils.closeResultSet(rs);
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
			//System.out.println(for_id);
			//System.out.println("1");
			rs = pstmt.executeQuery();
			//System.out.println("2");
			if(rs.next()){
				ret = new Format(rs.getInt("for_id"),rs.getString("for_name"),rs.getString("for_typelist")
					,rs.getString("for_namelist"),rs.getInt("pro_id"));
			}
			System.out.println("3");
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
	public Format findFormatByNameProject(String for_name,int pro_id) {
		// TODO Auto-generated method stub
		Format ret = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "select * from format where for_name = ? and pro_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, for_name);
			pstmt.setInt(2, pro_id);
			//System.out.println(for_name);
			//System.out.println("1");
			rs = pstmt.executeQuery();
			//System.out.println("2");
			if(rs.next()){
				ret = new Format(rs.getInt("for_id"),rs.getString("for_name"),rs.getString("for_typelist")
					,rs.getString("for_namelist"),rs.getInt("pro_id"));
			}
			//System.out.println("3");
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
	public String findTypeByName(int for_id, String name) {
		// TODO Auto-generated method stub
		String ret = "";
		String[] for_nameArray = findFormatById(for_id).getFor_namelist().split(",");
		String[] for_typeArray = findFormatById(for_id).getFor_typelist().split(",");
		int len = for_nameArray.length;
		for(int i=0;i<len;i++){
			if(for_nameArray[i].equals(name)){
				ret = for_typeArray[i];
				break;
			}
		}
		return ret;
	}

}
