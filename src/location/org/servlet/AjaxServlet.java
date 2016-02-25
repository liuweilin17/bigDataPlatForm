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
import location.org.dao.Basedata;
import location.org.dao.BasedataDao;
import location.org.dao.BasedataDaoImpl;
import location.org.dao.Baseline;
import location.org.dao.BaselineDao;
import location.org.dao.BaselineDaoImpl;
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
		String username = request.getParameter("username");
		if(username != null && !username.equals("")){
			username = username.trim();
		}
		//System.out.println(flag);
		//System.out.println("ajax:"+username);
		//1--处理projectTable数据请求
		if(flag.equals("1")){
			ProjectDao projectdao = new ProjectDaoImpl();
			List<Project> projectList = projectdao.findProject(username);
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
			/*int for_id = Integer.parseInt((String)request.getParameter("for_id"));
			FormatDao formatdao = new FormatDaoImpl();
			List<Format> formatList = formatdao.findFormat(for_id);
			JSONObject obj = new JSONObject();
			obj.put("data", formatList);
			response.getWriter().println(obj.toString());*/
			int for_id = Integer.parseInt((String)request.getParameter("for_id"));
			FormatDao formatdao = new FormatDaoImpl();
			Format format = formatdao.findFormatById(for_id);
			//System.out.println(format.getFor_name());
			JSONObject obj = new JSONObject();
			obj.put("data", format);
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
		//3--获取basedata折线图数据的请求
		}else if(flag.equals("5")){
			double bl_id = Double.parseDouble((String)request.getParameter("bl_id"));
			ParseLonLat parselonlat = new ParseLonLat();
			BasedataDao basedatadao = new BasedataDaoImpl();
			List<Basedata> basedataList = basedatadao.findBasedata(bl_id);
			List<String> timeList = new LinkedList<String>();
			List<Double> latList = new LinkedList<Double>();
			List<Double> lonList = new LinkedList<Double>();
			List<Double> xList = new LinkedList<Double>();
			List<Double> yList = new LinkedList<Double>();
			List<Double> zList = new LinkedList<Double>();
			System.out.println("f1");
			for(int i = 0;i<basedataList.size();i++){
				timeList.add(basedataList.get(i).getB_time());
				
				lonList.add(parselonlat.parseToDouble(basedataList.get(i).getB_lon()));
				latList.add(parselonlat.parseToDouble(basedataList.get(i).getB_lat()));
				
				xList.add(basedataList.get(i).getB_x());
				yList.add(basedataList.get(i).getB_y());
				zList.add(basedataList.get(i).getB_z());
			}
			JSONObject obj = new JSONObject();
			obj.put("timeList", timeList);
			obj.put("lonList", lonList);
			obj.put("latList", latList);
			obj.put("xList", xList);
			obj.put("yList", yList);
			obj.put("zList", zList);
			response.getWriter().println(obj.toString());
		//4--删除指定bl_id的baseline和basedata数据
		}else if(flag.equals("6")){
			double bl_id = Double.parseDouble((String)request.getParameter("bl_id"));
			BasedataDao basedatadao = new BasedataDaoImpl();
			basedatadao.deleteBasedata(bl_id);
			request.getRequestDispatcher("siteInfo.jsp").forward(request, response);
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
