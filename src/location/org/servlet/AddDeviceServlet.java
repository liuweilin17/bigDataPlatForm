package location.org.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import location.org.dao.Device;
import location.org.dao.DeviceDao;
import location.org.dao.DeviceDaoImpl;
import location.org.dao.FormatDao;
import location.org.dao.FormatDaoImpl;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class AddDeviceServlet
 */
//@WebServlet("/AddDeviceServlet")
public class AddDeviceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDeviceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		JSONObject obj = new JSONObject();
		int pro_id = Integer.parseInt(request.getParameter("pro_id"));
		String for_name = request.getParameter("for_name");
		boolean batch = Boolean.parseBoolean(request.getParameter("batch"));
		if(batch){
			System.out.println("batch!");
			String dev_name_prefix = request.getParameter("dev_name_prefix");
			//System.out.println("before:"+request.getParameter("dev_num"));
			int dev_num = Integer.parseInt(request.getParameter("dev_num"));
			//System.out.println("after");
			//根据pro_id,dev_name_prefix 判断设备名是否重复
			DeviceDao devicedao = new DeviceDaoImpl();
			for(int i=0;i<dev_num;i++){
				if(devicedao.findDeviceName(pro_id,dev_name_prefix+"_"+i)!=null){
					obj.put("ret","dev_name_prefix has existed!");
					response.getWriter().println(obj.toString());
					return;
				}
			}
			//创建名字为dev_name_prefix_i（i：0-dev_num）device
			for(int i=0;i<dev_num;i++){
				//访问数据库获取for_name对应for_id
				FormatDao formatdao = new FormatDaoImpl();
				int for_id = formatdao.findFormatByNameProject(for_name,pro_id).getFor_id();
				//访问数据库添加device
				if(!devicedao.insertDevice(new Device(0,dev_name_prefix+"_"+i,pro_id,for_id))){
					obj.put("ret", "error");
					response.getWriter().println(obj.toString());
					return;
				}
			}
			obj.put("ret", "success");
			response.getWriter().println(obj.toString());
		}else{
			System.out.println("single!");
			String dev_name = request.getParameter("dev_name");
			//根据pro_id,dev_name判断设备名是否重复
			DeviceDao devicedao = new DeviceDaoImpl();
			if(devicedao.findDeviceName(pro_id, dev_name)!=null){
				obj.put("ret","设备名已存在！");
				response.getWriter().println(obj.toString());
				return;
			}
			//访问数据库获取for_name对应for_id
			FormatDao formatdao = new FormatDaoImpl();
			int for_id = formatdao.findFormatByNameProject(for_name,pro_id).getFor_id();
			//访问数据库添加device
			
			if(devicedao.insertDevice(new Device(0,dev_name,pro_id,for_id))){
				obj.put("ret", "success");
			}else{
				obj.put("ret", "error");
			}
			response.getWriter().println(obj.toString());
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
