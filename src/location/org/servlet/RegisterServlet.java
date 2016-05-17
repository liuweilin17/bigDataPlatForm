package location.org.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import location.org.dao.User;
import location.org.dao.UserDao;
import location.org.dao.UserDaoImpl;

/**
 * Servlet implementation class RegisterServlet
 */
//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		//String s = request.getParameter("identity");
		
		if(username == null || username.equals("")){
			//response.sendRedirect("login.jsp?error=empty username");
			request.setAttribute("error", "用户名为空！");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			return;
		}
		if(password == null || password.equals("")){
			//response.sendRedirect("login.jsp?error=empty password");
			request.setAttribute("error", "密码为空！");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			return;
		}
		UserDao udao = new UserDaoImpl();
		User user = udao.findUsername(username);
		if(user != null){
			//response.sendRedirect("login.jsp?error=invalid username and password");
			request.setAttribute("error", "用户名已存在！");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			return;
		}
		User tmp = new User(username,password);
		udao.insertUser(tmp);
		request.setAttribute("tip", "注册成功！");
		request.getRequestDispatcher("login.jsp").forward(request, response);

	}

}
