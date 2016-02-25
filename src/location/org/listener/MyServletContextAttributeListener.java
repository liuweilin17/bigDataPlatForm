package location.org.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class MyServletContextAttributeListener
 *
 */
//@WebListener
public class MyServletContextAttributeListener implements ServletContextAttributeListener {

    /**
     * Default constructor. 
     */
    public MyServletContextAttributeListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextAttributeListener#attributeAdded(ServletContextAttributeEvent)
     */
    public void attributeAdded(ServletContextAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    	ServletContext application = arg0.getServletContext();
    	String name = arg0.getName();
    	Object value = arg0.getValue();
    	System.out.println(application + "范围内添加了名为" + name + ", 值为" + value + "的属性！");
    	
    }

	/**
     * @see ServletContextAttributeListener#attributeRemoved(ServletContextAttributeEvent)
     */
    public void attributeRemoved(ServletContextAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    	ServletContext application = arg0.getServletContext();
    	String name = arg0.getName();
    	Object value = arg0.getValue();
    	System.out.println(application + "范围内名为" + name + ", 值为" + value + "被删除了！");
    	
    }

	/**
     * @see ServletContextAttributeListener#attributeReplaced(ServletContextAttributeEvent)
     */
    public void attributeReplaced(ServletContextAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    	ServletContext application = arg0.getServletContext();
    	String name = arg0.getName();
    	Object value = arg0.getValue();
    	System.out.println(application + "范围内名为" + name + ", 值为" + value + "被替换了！");
    	
    }
	
}
