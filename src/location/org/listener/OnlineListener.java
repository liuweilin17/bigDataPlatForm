package location.org.listener;

import java.util.Hashtable;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class OnlineListener
 *
 */
//@WebListener
public class OnlineListener implements HttpSessionListener, HttpSessionAttributeListener {

    /**
     * Default constructor. 
     */
    public OnlineListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    	System.out.println("session is created!");
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    	System.out.println("session is destroyed!");
    	HttpSession session = arg0.getSession();
    	ServletContext application = session.getServletContext();
    	String sessionId = session.getId();
    	Map<String,String> online = (Map<String,String>)application.getAttribute("online");
    	if(online != null){
    		online.remove(sessionId);
    	}
    	application.setAttribute("online", online);
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    	System.out.println("attribute is added!");
    	HttpSession session = arg0.getSession();
    	ServletContext application = session.getServletContext();
    	String sessionId = session.getId();
    	//if (session.isNew()){
    		String user = (String)session.getAttribute("u_name");
    		Map<String,String> online = (Map<String,String>) application.getAttribute("online");
    		if(online == null){
    			online = new Hashtable<String,String>();
    		}
    		online.put(sessionId, user);
    		application.setAttribute("online", online);
    	//}
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    	System.out.println("attribute is replaced!");
    	HttpSession session = arg0.getSession();
    	ServletContext application = session.getServletContext();
    	String sessionId = session.getId();
    	//if (session.isNew()){
    		System.out.println("test");
    		String user = (String)session.getAttribute("u_name");
    		Map<String,String> online = (Map<String,String>) application.getAttribute("online");
    		if(online == null){
    			online = new Hashtable<String,String>();
    		}
    		online.put(sessionId, user);
    		application.setAttribute("online", online);
    	//}
    }
	
}
