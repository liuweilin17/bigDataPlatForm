package location.org.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import location.org.dao.UserDao;
import location.org.dao.UserDaoImpl;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int role = Integer.parseInt(request.getParameter("userRole"));
		
		//String s = request.getParameter("identity");
		
		if(username == null || username.equals("")){
			//response.sendRedirect("login.jsp?error=empty username");
			request.setAttribute("error", "用户名为空！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		if(password == null || password.equals("")){
			//response.sendRedirect("login.jsp?error=empty password");
			request.setAttribute("error", "密码为空！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		UserDao udao = new UserDaoImpl();
		if(!udao.findUser(username, password, role)){
			//response.sendRedirect("login.jsp?error=invalid username and password");
			request.setAttribute("error", "用户名或密码不存在！！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		HttpSession session = request.getSession();
		session.setAttribute("username", username);
		session.setAttribute("password", password);
		session.setAttribute("userRole", role);
		
		request.getRequestDispatcher("project.jsp").forward(request, response);
	}

}
