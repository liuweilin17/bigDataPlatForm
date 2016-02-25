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
    	System.out.println(application + "��Χ���������Ϊ" + name + ", ֵΪ" + value + "�����ԣ�");
    	
    }

	/**
     * @see ServletContextAttributeListener#attributeRemoved(ServletContextAttributeEvent)
     */
    public void attributeRemoved(ServletContextAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    	ServletContext application = arg0.getServletContext();
    	String name = arg0.getName();
    	Object value = arg0.getValue();
    	System.out.println(application + "��Χ����Ϊ" + name + ", ֵΪ" + value + "��ɾ���ˣ�");
    	
    }

	/**
     * @see ServletContextAttributeListener#attributeReplaced(ServletContextAttributeEvent)
     */
    public void attributeReplaced(ServletContextAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    	ServletContext application = arg0.getServletContext();
    	String name = arg0.getName();
    	Object value = arg0.getValue();
    	System.out.println(application + "��Χ����Ϊ" + name + ", ֵΪ" + value + "���滻�ˣ�");
    	
    }
	
}
