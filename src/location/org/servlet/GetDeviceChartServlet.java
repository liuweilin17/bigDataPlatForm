package location.org.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import location.org.dao.Device;
import location.org.dao.DeviceDao;
import location.org.dao.DeviceDaoImpl;
import location.org.dao.Format;
import location.org.dao.FormatDao;
import location.org.dao.FormatDaoImpl;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class GetDeviceChartServlet
 */
//@WebServlet("/GetDeviceChartServlet")
public class GetDeviceChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDeviceChartServlet() {
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
		int dev_id = Integer.parseInt(request.getParameter("dev_id"));
		String xName = request.getParameter("xName");
		String yName = request.getParameter("yName");
		
		DeviceDao devicedao = new DeviceDaoImpl();
		Device device = devicedao.findDeviceById(dev_id);
		int for_id = device.getFor_id();
		
		FormatDao formatdao = new FormatDaoImpl();
		Format format = formatdao.findFormatById(for_id);
		String for_name = format.getFor_name();
		int pro_id = format.getPro_id();
		
		String xData = devicedao.findChartData(for_name+"_"+pro_id, dev_id, xName);
		String yData = devicedao.findChartData(for_name+"_"+pro_id, dev_id, yName);
		obj.put("xData", xData);
		obj.put("yData", yData);
		
		response.getWriter().println(obj.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
