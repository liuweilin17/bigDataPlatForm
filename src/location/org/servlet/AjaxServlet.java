package location.org.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import location.org.api.ParseLonLat;
import location.org.dao.AdminDao;
import location.org.dao.AdminDaoImpl;
import location.org.dao.Device;
import location.org.dao.DeviceDao;
import location.org.dao.DeviceDaoImpl;
import location.org.dao.Format;
import location.org.dao.FormatDao;
import location.org.dao.FormatDaoImpl;
import location.org.dao.Project;
import location.org.dao.ProjectDao;
import location.org.dao.ProjectDaoImpl;
import location.org.dao.Type;
import location.org.dao.TypeDao;
import location.org.dao.TypeDaoImpl;
import net.sf.json.JSONObject;




/**
 * Servlet implementation class DataServlet
 */
//@WebServlet("/AjaxServlet")
public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String flag = request.getParameter("flag");
		//1--处理projectTable数据请求
		if(flag.equals("1")){
			int u_id = (Integer)request.getSession().getAttribute("u_id");
			ProjectDao projectdao = new ProjectDaoImpl();
			List<Project> projectList = projectdao.findProject(u_id);
			JSONObject obj = new JSONObject();
			obj.put("aaData", projectList);
			//System.out.println("ajax:"+obj.toString());
			response.getWriter().println(obj.toString());
		//2--处理deviceTable数据请求
		}else if(flag.equals("2")){
			int pro_id = Integer.parseInt((String)request.getParameter("pro_id"));
			DeviceDao devicedao = new DeviceDaoImpl();
			List<Device> deviceList = devicedao.findDevice(pro_id);
			JSONObject obj = new JSONObject();
			obj.put("aaData", deviceList);
			//System.out.println(obj.toString());
			response.getWriter().println(obj.toString());
		//3--处理deviceTypeTable数据请求
		}else if(flag.equals("3")){
			int pro_id = Integer.parseInt((String)request.getParameter("pro_id"));
			FormatDao devicedao = new FormatDaoImpl();
			List<Format> formatList = devicedao.findFormat(pro_id);
			JSONObject obj = new JSONObject();
			obj.put("aaData", formatList);
			//System.out.println(obj.toString());
			response.getWriter().println(obj.toString());
		//4--返回指定for_id的format
		}else if(flag.equals("4")){
			int for_id = Integer.parseInt((String)request.getParameter("for_id"));
			FormatDao formatdao = new FormatDaoImpl();
			Format format = formatdao.findFormatById(for_id);
			//System.out.println(format.getFor_name());
			JSONObject obj = new JSONObject();
			obj.put("data", format);
			System.out.println("obj:"+obj.toString());
			response.getWriter().println(obj.toString());
		//5--返回系统中变量类型列表
		}else if(flag.equals("5")){
			TypeDao typedao = new TypeDaoImpl();
			List<Type> typeList = typedao.findType();
			JSONObject obj = new JSONObject();
			obj.put("data", typeList);
			response.getWriter().println(obj.toString());
		//6--删除设备
		}else if(flag.equals("6")){
			JSONObject obj = new JSONObject();
			int dev_id = Integer.parseInt(request.getParameter("dev_id"));
			DeviceDao devicedao = new DeviceDaoImpl();
			if(devicedao.deleteDevice(dev_id)){
				obj.put("ret", "success!");
			}else{
				obj.put("ret", "error!");
			}
			response.getWriter().println(obj.toString());
		//7--admin role by u_id pro_id
		}else if(flag.equals("7")){
			JSONObject obj = new JSONObject();
			int u_id = Integer.parseInt(request.getParameter("u_id"));
			int pro_id = Integer.parseInt(request.getParameter("pro_id"));
			AdminDao admindao = new AdminDaoImpl();
			obj.put("ret", admindao.findRole(u_id,pro_id));
			response.getWriter().println(obj.toString());
		}else {
			
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
