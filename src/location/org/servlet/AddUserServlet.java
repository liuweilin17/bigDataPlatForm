package location.org.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import location.org.dao.User;
import location.org.dao.UserDao;
import location.org.dao.UserDaoImpl;

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
		String username = request.getParameter("username");
		
		if(username == null || username.equals("")){
			//response.sendRedirect("login.jsp?error=empty username");
			
			return;
		}
//		UserDao udao = new UserDaoImpl();
//		if(udao.findUsername(username)){
//			//response.sendRedirect("login.jsp?error=invalid username and password");
//			request.setAttribute("error", "用户名已存在！");
//			request.getRequestDispatcher("register.jsp").forward(request, response);
//			return;
//		}
//		User tmp = new User(username,password);
//		udao.insertUser(tmp);
//		request.setAttribute("tip", "注册成功！");
//		request.getRequestDispatcher("login.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
