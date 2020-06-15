

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet2
 */
@WebServlet("/Servlet2")
public class Servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		Random r = new Random();
		SimpleDateFormat f = new SimpleDateFormat("yy_MM_dd_HH_mm_ss");
		Date d = new Date();
		String date1 =f.format(d);
		String text = (String)request.getParameter("infor");	
		String text_Tid = (String)request.getParameter("TiebaId");
		String name = (String)request.getParameter("personname");	
		
		
		if(!text.equals("")) {
		try {
			Class.forName("com.mysql.jdbc.Driver");//加载mysql程序
			System.out.println("Success loading Mysql Driver!");
		}catch(Exception e){
			 System.out.print("Error loading Mysql Driver!");
		      e.printStackTrace();
		}
		 try {			 
		    	String condition="insert into Tiezi values("
		 +"'"+ text_Tid +"'"+","+"'"+ name +"'"+","+"'"+ date1 +"'"+","+"'"+ text+ "'" +")";
		      Connection connect = DriverManager.getConnection(
		          "jdbc:mysql://localhost/tieba", "root", "dzb19980322");
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
		
		}
		request.getRequestDispatcher("StudentPlatform/Tieba/activity.jsp").forward(request, response);
	}
	
}
