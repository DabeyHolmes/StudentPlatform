

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
@MultipartConfig
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
       
        int key=0;
        String[] parameterValue=new String[10];
        parameterValue[0]=(String)request.getParameter("com_name");
       parameterValue[1]=(String)request.getParameter("com_org");
        parameterValue[2]=(String)request.getParameter("chat");
        parameterValue[3]=(String)request.getParameter("contact");
        parameterValue[4]=(String)request.getParameter("sign_up_start");
        parameterValue[5]=(String)request.getParameter("sign_up_end"); 
        parameterValue[6]=(String)request.getParameter("act_start");
        parameterValue[7]=(String)request.getParameter("act_end");
        parameterValue[8]=(String)request.getParameter("infor");
        parameterValue[9]="类型："+(String)request.getParameter("com_type");
      
        Random r = new Random();
		SimpleDateFormat f =new SimpleDateFormat("yy_MM_dd_HH_mm_ss");
		Date d = new Date();
		String id=f.format(d)+r.nextInt();
		String filename="assets/images/"+id+".";//表示图片文件
		 String questionFile="assets/images/"+id+".";//表示题库

		for(int i=0;i<parameterValue.length;i++) {
			if(parameterValue[i]==null||parameterValue[i].equals(""))
				key=1;
		}
		 Collection<Part> parts = request.getParts();
        if(key==0) {
        	
        	  int t=0;
        	  //上传文件
             for(Part part : parts){
             	if(part.getContentType()!=null) {
             		
             		
             	String[] getName=getFilename(part).split("\\.");
             	System.out.println(getFilename(part));
             	
             	
             			if(t==0) {
							filename = questionFile + getName[getName.length - 1];
							part.write("D:\\文档\\Tencent Files\\793360690\\FileRecv\\tieba\\out\\artifacts\\StudentPlatform_Web_exploded\\StudentPlatform\\Competition\\assets\\images\\"+id+"."+getName[getName.length-1]);
						}
             			else {
							questionFile += getName[getName.length - 1];
							part.write(getServletContext().getRealPath("/Competition/assets/images")+"/"+id+"."+getName[getName.length-1]);
						}


             			
             		t++;
             	}
             	
             }
             
	    try {
	      Class.forName("com.mysql.jdbc.Driver");     //加载MYSQL JDBC驱动程序  org.gjt.mm.mysql.Driver 
	      System.out.println("Success loading Mysql Driver!");
	    }
	    catch (Exception e) {
	      System.out.print("Error loading Mysql Driver!");
	      e.printStackTrace();
	    }

	    try {
	    	String condition="insert into competition values("+"'"+id+"'"+","+"'"+parameterValue[0]+"'"+","+"'"+parameterValue[1]+"'"+","+"'"+parameterValue[2]+"'"+","+
		    		  "'"+parameterValue[3]+"'"+","+"'"+parameterValue[4]+"'"+","+"'"+parameterValue[5]+"'"+","+
		    		  "'"+parameterValue[6]+"'"+","+"'"+parameterValue[7]+"'"+","+"'"+filename+"'"+","+
		    		  "'"+parameterValue[8]+"'"+","+"'"+questionFile+"'"+","+"'"+parameterValue[9]+"'"+")";

	      Connection connect = DriverManager.getConnection(
	          "jdbc:mysql://localhost/a", "root", "dzb19980322");
	//连接URL为   jdbc:mysql//服务器地址/数据库名
	//后面的2个参数分别是登陆用户名和密码
	      System.out.println("Success connect Mysql server!");

	      Statement stmt = connect.createStatement();
	      
	      stmt.executeUpdate(condition);
	      
	    }
	    catch (Exception e) {
	      System.out.print("get data error!");
	      e.printStackTrace();
	    }
	    request.getRequestDispatcher("StudentPlatform/Competition/competition.jsp").forward(request,response);
      
	}
        else {
        	request.setAttribute("success", "信息填写不完整");
        request.getRequestDispatcher("StudentPlatform/Competition/competitionCreate.jsp").forward(request,response);
        }
	}
	
	private String getFilename(Part part) {//获得文件名
	String contentDispositionHeader=part.getHeader("content-disposition");
	String[] elements=contentDispositionHeader.split(";");
	for(String element:elements) {
		if(element.trim().startsWith("filename")) {
			return element.substring(element.indexOf("=")+1).trim().replace("\"", "");
		}
	}
		return null;
			
	}
}
