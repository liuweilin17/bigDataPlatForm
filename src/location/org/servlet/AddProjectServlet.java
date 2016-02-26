package location.org.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import location.org.dao.AdminDao;
import location.org.dao.AdminDaoImpl;
import location.org.dao.Project;
import location.org.dao.ProjectDao;
import location.org.dao.ProjectDaoImpl;
import location.org.dao.User;
import location.org.dao.UserDao;
import location.org.dao.UserDaoImpl;

/**
 * Servlet implementation class AddProjectServlet
 */
//@WebServlet("/AddProjectServlet")
public class AddProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String projectName = request.getParameter("projectName");
		String projectInfo = request.getParameter("projectInfo");
		//String u_name = (String) request.getSession().getAttribute("u_name");
		int u_id = (Integer) request.getSession().getAttribute("u_id");
		//String s = request.getParameter("identity");
		
		if(projectName == null || projectName.equals("")){
			//response.sendRedirect("login.jsp?error=empty username");
			request.setAttribute("error", "项目名不能为空！");
			request.getRequestDispatcher("project.jsp").forward(request, response);
			return;
		}
		if(projectInfo == null || projectInfo.equals("")){
			//response.sendRedirect("login.jsp?error=empty password");
			request.setAttribute("error", "项目描述不能为空！");
			request.getRequestDispatcher("project.jsp").forward(request, response);
			return;
		}
		ProjectDao pdao = new ProjectDaoImpl();
		if(pdao.findProjectName(projectName) != null){
			//response.sendRedirect("login.jsp?error=invalid username and password");
			request.setAttribute("error", "项目名已存在！");
			request.getRequestDispatcher("project.jsp").forward(request, response);
			return;
		}
		Project tmp = new Project(0,projectName,projectInfo);
		pdao.insertProject(tmp);
		int pro_id = pdao.findProjectName(projectName).getPro_id();
		
		AdminDao admindao = new AdminDaoImpl();
		admindao.insertAdmin(u_id, pro_id, 0);
		request.setAttribute("tip", "插入成功！");
		request.getRequestDispatcher("project.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("we are in the addprojectservlet!!!");
		doGet(request, response);
	}

}
