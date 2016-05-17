package location.org.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import location.org.dao.AdminDao;
import location.org.dao.AdminDaoImpl;
import location.org.dao.User;
import location.org.dao.UserDao;
import location.org.dao.UserDaoImpl;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class AddUserServlet
 */
//@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
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
		String ret = null;
		String username = request.getParameter("username");
		int pro_id = Integer.parseInt(request.getParameter("pro_id"));
		
		if(username == null || username.equals("")){
			//response.sendRedirect("login.jsp?error=empty username");
			ret = "the username is empty!";
			obj.put("ret", ret);
			response.getWriter().println(obj.toString());
			return;
		}
		UserDao udao = new UserDaoImpl();
		User user = udao.findUsername(username);
		if(user == null){
			//response.sendRedirect("login.jsp?error=invalid username and password");
			ret = "the username does not exist!";
			obj.put("ret", ret);
			response.getWriter().println(obj.toString());
			return;
		}
		int u_id = user.getU_id();
		AdminDao admindao = new AdminDaoImpl();
		admindao.insertAdmin(u_id, pro_id, 1);
		ret = "the username has been inserted!";
		obj.put("ret", ret);
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
