

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class SignUpInformation
 */
@WebServlet("/SignUpInformation")
public class SignUpInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpInformation() {
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
	        String[] parameterValue=new String[6];
	        parameterValue[0]=(String)request.getParameter("school");
	       parameterValue[1]=(String)request.getParameter("team");
	        parameterValue[2]=(String)request.getParameter("personName");
	        parameterValue[3]=(String)request.getParameter("phoneNumber");
	        parameterValue[4]=(String)request.getParameter("qq");
	        parameterValue[5]=(String)request.getParameter("address");
	        String member1=(String)request.getParameter("member1")+"";
	        String member2=(String)request.getParameter("member2")+""; 
	        String filename=(String)request.getParameter("filename");
	        String com_id=(String)request.getParameter("com_id");
	        String com_name=(String)request.getParameter("com_name");
	        String questionFile=(String)request.getParameter("questionFile");
	        String stu_id=(String)request.getParameter("stu_id");
	       
	     
	        request.setAttribute("filename", filename);
		    request.setAttribute("com_name", com_name);
		    request.setAttribute("com_id", com_id);
		    request.setAttribute("questionFile", questionFile);
			for(int i=0;i<parameterValue.length;i++) {
				if(parameterValue[i].equals("")||parameterValue[i].equals(null))
					key=1;
			}
			if(com_id.equals("")||com_id==null)
				key=1;
			String condition="insert into signUp values("+"'"+com_id+"'"+","+"'"+parameterValue[0]+"'"+","+"'"+parameterValue[1]+"'"+","+"'"+parameterValue[2]+"'"+","+
		    		  "'"+parameterValue[3]+"'"+","+"'"+parameterValue[4]+"'"+","+"'"+parameterValue[5]+"'"+","+
		    		  "'"+member1+"'"+","+"'"+member2+"'"+","+"'"+stu_id+"'"+")";
	        if(key==0) {
		    try {
		      Class.forName("com.mysql.jdbc.Driver");     //加载MYSQL JDBC驱动程序  org.gjt.mm.mysql.Driver 
		      System.out.println("Success loading Mysql Driver!");
		    }
		    catch (Exception e) {
		      System.out.print("Error loading Mysql Driver!");
		      e.printStackTrace();
		    }

		    try {
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
		    request.setAttribute("success", "信息提交成功");
	   }
	        else 
	        	 request.setAttribute("success", "信息提交失败，请核对填写是否正确");
	        
	        request.getRequestDispatcher("StudentPlatform/Competition/competitionSignUp.jsp").forward(request,response);
	        
	        
	}

}
