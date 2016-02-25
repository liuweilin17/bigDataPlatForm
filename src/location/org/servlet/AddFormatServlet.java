package location.org.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import location.org.dao.Format;
import location.org.dao.FormatDao;
import location.org.dao.FormatDaoImpl;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class AddFormat
 */
//@WebServlet("/AddFormat")
public class AddFormatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFormatServlet() {
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
		String for_name = request.getParameter("for_name");
		int pro_id = Integer.parseInt(request.getParameter("pro_id"));
		FormatDao formatdao = new FormatDaoImpl();
		Format format = formatdao.findFormatByNameProject(for_name,pro_id);
		if(format!=null){
			obj.put("ret", "the devicetypename has already existed!");
			response.getWriter().println(obj.toString());
			return;
		}
		int for_num = Integer.parseInt(request.getParameter("for_num"));
		String for_namelist = request.getParameter("for_namelist");
		String for_typelist = request.getParameter("for_typelist");
//		System.out.println("for_name:"+for_name);
//		System.out.println("for_num:"+for_num);
//		System.out.println("for_namelist:"+for_namelist);
//		System.out.println("for_typelist:"+for_typelist);
		Format format1 = new Format(1,for_name,for_typelist,for_namelist,pro_id);
		if(formatdao.insertFormat(format1)){
			obj.put("ret", "success!");
		}else{
			obj.put("ret", "error!");
		}
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
