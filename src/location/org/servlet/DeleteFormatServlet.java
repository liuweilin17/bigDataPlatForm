package location.org.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import location.org.dao.FormatDao;
import location.org.dao.FormatDaoImpl;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class DeleteFormatServlet
 */
//@WebServlet("/DeleteFormatServlet")
public class DeleteFormatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFormatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int for_id = Integer.parseInt(request.getParameter("for_id"));
		JSONObject obj = new JSONObject();
		FormatDao formatdao = new FormatDaoImpl();
		if(formatdao.deleteFormat(for_id)){
			obj.put("ret", "sucess");
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
