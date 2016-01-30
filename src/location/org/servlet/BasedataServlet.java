package location.org.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import location.org.dao.Basedata;
import location.org.dao.BasedataDao;
import location.org.dao.BasedataDaoImpl;
import location.org.dao.Baseline;
import location.org.dao.BaselineDao;
import location.org.dao.BaselineDaoImpl;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class BasedataServlet
 */
//@WebServlet("/BasedataServlet")
public class BasedataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasedataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		double bl_id = Double.parseDouble((String)request.getParameter("bl_id"));
		BasedataDao basedatadao = new BasedataDaoImpl();
		List<Basedata> basedataList = basedatadao.findBasedata(bl_id);
		System.out.println("fe");
		JSONObject obj = new JSONObject();
		obj.put("data", basedataList);
		//System.out.println(obj.toString());
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
