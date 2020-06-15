

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class signServ
 */
@WebServlet("/signServ")
@MultipartConfig
public class signServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//生成时间字符串

        
		SimpleDateFormat f =new SimpleDateFormat("yy_MM_dd_HH_mm_ss");
		Date d = new Date();
		String da = f.format( d);
		
		
		String[] createValues = new String[8];
		createValues[1]= request.getParameter("stuName").toString();
		createValues[0] = request.getParameter("stuID");
		createValues[2] = request.getParameter("stuCol");
		createValues[3] = request.getParameter("stuClass");
		createValues[4] = request.getParameter("stuTele");
		createValues[5] = request.getParameter("stuQQ");
		createValues[6] = request.getParameter("getID");
		createValues[7] = "canjia";
		
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				String insQuery = "";
				insQuery = "insert into student values (" + "'" + createValues[0] + "'" + ","
						                                     + "'" + createValues[1] + "'" + ","
						                                     + "'" + createValues[2] + "'" + ","
						                                     + "'" + createValues[3] + "'" + ","
						                                     + "'" + createValues[4] + "'" + ","
						                                     + "'" + createValues[5] + "'" + ","
						                                     + "'" + createValues[6] + "'" + ","
						                                     + "'" + createValues[7] + "'" 
						                                    
						                                     + ")";
				 Connection connect = DriverManager.getConnection(
				          "jdbc:mysql://localhost/act0", "root", "dzb19980322");
				 Statement stmt = connect.createStatement();
			      
			      stmt.executeUpdate(insQuery);
			      
			
			
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("acID", createValues[6]);
			request.getRequestDispatcher("StudentPlatform/Activity/display.jsp").forward(request, response);
			
		}
		
	
}


