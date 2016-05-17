package location.org.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import location.org.dao.DbUtils;
import location.org.dao.Device;
import location.org.dao.DeviceDao;
import location.org.dao.DeviceDaoImpl;
import location.org.dao.Format;
import location.org.dao.FormatDao;
import location.org.dao.FormatDaoImpl;

/**
 * Servlet implementation class ReceiveData
 */
//@WebServlet("/ReceiveData")
public class ReceiveData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiveData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setHeader("content-type", "text/html;charset=UTF-8");
		
        response.setCharacterEncoding("UTF-8");
		response.getWriter().println("数据插入成功！");
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//例如：http://localhost:8090/bigDataPlatform/ReceiveData?dev_id=2&lat=1&lon=1&time=1
		//获取设备id 判断设备id有效性
		String dev_id_str = request.getParameter("dev_id");
		if(dev_id_str == null||dev_id_str.equals("")){
			response.getWriter().append("设备名为空！empty");
			return;
		}
		int dev_id = Integer.parseInt(request.getParameter("dev_id"));
		System.out.println("dev_id:"+dev_id);
		
		DeviceDao devicedao = new DeviceDaoImpl();
		Device device = devicedao.findDeviceById(dev_id);
		if(device == null){
			response.getWriter().append("设备Id 不存在！");
			return;
		}
		//计算设备id 对应设备类型id 获取设备类型
		FormatDao formatdao = new FormatDaoImpl();
		Format format = formatdao.findFormatById(device.getFor_id());
		System.out.println("namelist:"+format.getFor_namelist());
		System.out.println("typelist:"+format.getFor_typelist());
		
		String[] namelist = format.getFor_namelist().split(",");
		String[] typelist = format.getFor_typelist().split(",");
		Map<String,String> paramlist = new HashMap<String,String>();
		//计算传参和设备类型是否匹配
		for(int i=0;i<namelist.length;i++){
			String tmp = request.getParameter(namelist[i]);
			if(tmp == null){
				response.getWriter().append("缺少参数："+namelist[i]);
				return;
			}
			paramlist.put(namelist[i], tmp);
		}
		//计算数据表名称插入
		String table_name = format.getFor_name()+"_"+device.getPro_id();
		System.out.println("table_name:"+table_name);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = DbUtils.getConnection();
			String sql = "insert into "+table_name+"("+format.getFor_namelist()+",pro_id,dev_id) values";
			String ques = "(";
			for(int i=0;i<namelist.length+2;i++){
				if(i == 0){
					ques+="?";
				}else{
					ques+=",?";
				}
			}
			ques+=")";
			sql+=ques;
			System.out.println("sql:"+sql);
			
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<namelist.length;i++){
				//String tmp = request.getParameter(namelist[i]);
				String type = typelist[i];
				if(type.equals("varchar")){
					pstmt.setString(i+1, paramlist.get(namelist[i]));
				}else if(type.equals("int")){
					pstmt.setInt(i+1, Integer.parseInt(paramlist.get(namelist[i])));
				}else if(type.equals("float")){
					pstmt.setFloat(i+1, Float.parseFloat(paramlist.get(namelist[i])));
				}else if(type.equals("double")){
					pstmt.setDouble(i+1, Double.parseDouble(paramlist.get(namelist[i])));
				}else{
					
				}
			}
			pstmt.setInt(namelist.length+1, device.getPro_id());
			pstmt.setInt(namelist.length+2,dev_id);
			System.out.println("pstmt:"+pstmt);
			
			pstmt.executeUpdate();
			System.out.println("data has been inserted!");
			response.getWriter().append("数据插入成功！");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtils.closeStatement(pstmt);
			DbUtils.closeConnection();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
