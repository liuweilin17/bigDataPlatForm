package location.org.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import location.org.dao.Basedata;
import location.org.dao.BasedataDao;
import location.org.dao.BasedataDaoImpl;
import location.org.dao.Baseline;
import location.org.dao.BaselineDao;
import location.org.dao.BaselineDaoImpl;

/**
 * Servlet implementation class LoadServlet
 */
//@WebServlet("/LoadServlet")
public class AddfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private String contextPath;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddfileServlet() {
        super();
        //contextPath = getServletContext().getRealPath("/WEB-INF/load");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
			try{
				//1.上传数据文件
				String username = (String) request.getSession().getAttribute("username");
				String contextPath = getServletContext().getRealPath("/WEB-INF/upload/"+username);
				File savePath = new File(contextPath);
				if (!savePath.exists() && !savePath.isDirectory()) {
					System.out.println(savePath+"目录不存在，需要创建");
					//创建目录
	            	savePath.mkdir();
	            	System.out.println("file is created!");
				}
				request.setCharacterEncoding("utf-8");
				
				InputStream in = request.getInputStream();
				
		        FileOutputStream fos = new FileOutputStream(contextPath+"/tmp.txt");
		
		        byte[] b = new byte[1024];
		
		        int n=0;
		        while((n=in.read(b))!=-1){
		           fos.write(b,0,n);
		        }
		
		        fos.close();
		        in.close();
		        
		        String encoding="UTF-8";

                File file=new File(contextPath+"/tmp.txt");

                InputStreamReader read = new InputStreamReader(

                new FileInputStream(file),encoding);

                BufferedReader bufferedReader = new BufferedReader(read);

                String lineTxt = null;
                String newName = null;
                int count = 0;
                boolean first_flag = true;
                double bl_id = 0;
                while((lineTxt = bufferedReader.readLine()) != null){
                	if( count == 1 ){
                		int beginIndex = lineTxt.lastIndexOf("\\");
                		int endIndex = lineTxt.lastIndexOf("\"");
                		if(beginIndex == -1 || endIndex == -1){
                			beginIndex = lineTxt.lastIndexOf("\"");
                			endIndex = lineTxt.lastIndexOf("\"");
                		}
                		newName = lineTxt.substring(beginIndex, endIndex);
                	}
                	String[] lineArray = lineTxt.split(",");
                	if(lineArray.length == 9){
                		//写入数据库
                		if(first_flag){
                			Baseline tmp = new Baseline(0,lineArray[1],lineArray[0],
                					(String)request.getSession().getAttribute("username"));
                			BaselineDao baselinedao = new BaselineDaoImpl();
                			if(baselinedao.findBaseline(tmp) == -1){
                				baselinedao.insertBaseline(tmp);
                			}else{
                				System.out.println("baseline 重复插入！");
                				break;
                			}
                			bl_id = baselinedao.findBaseline(tmp);
                			first_flag = false;
                		}
                		BasedataDao basedatadao = new BasedataDaoImpl();
                		Basedata ttmp = new Basedata(0,bl_id,lineArray[2],Double.parseDouble(lineArray[3]),
                				lineArray[4],lineArray[5],
                				Double.parseDouble(lineArray[6]),Double.parseDouble(lineArray[7]),
                				Double.parseDouble(lineArray[8]));
                		basedatadao.insertBasedata(ttmp);
                	}
                	count++;
                }
                read.close();
                
		        File newFile = new File(contextPath+newName);
		        file.renameTo(newFile);
		        
		        request.getRequestDispatcher("siteInfo.jsp").forward(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
