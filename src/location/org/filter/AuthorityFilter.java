package location.org.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthorityFilter
 */
//@WebFilter("/AuthorityFilter")
public class AuthorityFilter implements Filter {

    /**
     * Default constructor. 
     */
	private FilterConfig config;
    public AuthorityFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		this.config = null;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		String encoding = config.getInitParameter("encoding");
		String loginPage = config.getInitParameter("loginPage");
		String registerPage = config.getInitParameter("registerPage");
		String loginServlet = config.getInitParameter("loginServlet");
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		
		HttpServletRequest reque = (HttpServletRequest) request;
		HttpSession session = reque.getSession();
		
		String requestPath = reque.getServletPath();
		if(session.getAttribute("u_id") == null
				&& !requestPath.endsWith(loginPage)
				&& !requestPath.endsWith(registerPage)
				&& !requestPath.endsWith(loginServlet)
				){
			System.out.println("requestPath:"+requestPath);
			request.setAttribute("tip", "ÄúÃ»ÓÐµÇÂ¼");
			request.getRequestDispatcher(loginPage).forward(request, response);
		}else{
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.config = fConfig;
	}

}
