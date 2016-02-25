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
import location.org.dao.Format;
import location.org.dao.FormatDao;
import location.org.dao.FormatDaoImpl;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class GetDeviceDataServlet
 */
//@WebServlet("/GetDeviceDataServlet")
public class GetDeviceDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDeviceDataServlet() {
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
		DeviceDao devicedao = new DeviceDaoImpl();
		Device device = devicedao.findDeviceById(dev_id);
		int for_id = device.getFor_id();
		String dev_name = device.getDev_name();
		obj.put("dev_name", dev_name);
		
		FormatDao formatdao = new FormatDaoImpl();
		Format format = formatdao.findFormatById(for_id);
		String for_name = format.getFor_name();
		int pro_id = format.getPro_id();
		String[] for_name_array = format.getFor_namelist().split(",");
		String[] for_type_array = format.getFor_typelist().split(",");
		int len = for_name_array.length;
		String thead = "<tr>";
		String optionList = "";
		for(int i=0;i<len;i++){
			thead+="<th>"+for_name_array[i]+"</th>";
			optionList+="<option>"+for_name_array[i]+"</option>";
		}
		thead+="</tr>";
		obj.put("thead",thead);
		obj.put("optionList",optionList);
		
		String tbody = devicedao.findDeviceData(for_name+"_"+pro_id, dev_id, for_name_array,for_type_array);
		obj.put("tbody", tbody);
		
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
