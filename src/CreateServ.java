

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
 * Servlet implementation class CreateServ
 */
@WebServlet("/CreateServ")
@MultipartConfig
public class CreateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateServ() {
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
		String id = request.getParameter("id");
		
		String[] createValues = new String[16];
		createValues[1]= request.getParameter("acName").toString();
		createValues[0] =  da;
		createValues[2] = request.getParameter("orgName");
		createValues[3] = request.getParameter("orgTele");
		createValues[4] = request.getParameter("orgQQ");
		createValues[5] = request.getParameter("signStart");
		createValues[6] = request.getParameter("signEnd");
		createValues[7] = request.getParameter("acStart");
		createValues[8] = request.getParameter("acEnd");
		createValues[9] = request.getParameter("acType");//up/down/ud
		createValues[10] = request.getParameter("acPlace");
		
		if(request.getParameter("acFee").equals("0") ) {
			createValues[11] = "0";
		}else {
			createValues[11] = request.getParameter("acFeeNum");
		}
		
		if( request.getParameter("acPeo") .equals("0")) {
			createValues[12] = "999";
		}else {
			createValues[12] = request.getParameter("acPeo");
		}
		
		createValues[13] = request.getParameter("type");
		createValues[14] = request.getParameter("col");
		createValues[15] = request.getParameter("acIntro");
		
		String picFile = "up/" + da  + "acPic.";
		
		
		boolean flag = true;
		
		for(int i = 0 ; i < createValues.length ; i++) {
			if(createValues[i]==null||createValues[i].equals(""))
				flag = false;
		}
		Collection<Part> parts = request.getParts();
		PrintWriter out = response.getWriter();
		
		if( flag == false ) {
			out.print("<script>alert('请填写完整信息~'); window.location='create.jsp' </script>");
		}
		
		else {
			
			for( Part part : parts) {
				
				if(part.getContentType() != null) {
					
					//获取文件名后缀？？
				String cdHeader = part.getHeader("content-disposition");
				String[] eles = cdHeader.split(";");
				String subFileName = "";
				for( String ele : eles) {
					if( ele.trim().startsWith("filename")) {
						subFileName =  ele.substring(ele.indexOf('=') + 1).trim().replace("\"" , "");
					}
				}
				String[] getFileName = subFileName.split("\\.");
				
     				picFile += getFileName[getFileName.length-1];
				   part.write(getServletContext().getRealPath("/Activity/up") + "/" + da  +"acPic."+getFileName[getFileName.length-1]);
				
				System.out.println(getServletContext().getRealPath("/up") + "/"  + createValues[0]  +"acPic."+getFileName[getFileName.length-1]);
     			    
     			
     			
     			
     		
				
				
				
				
			}
			
			
			
			
			
		}
			try {
				Class.forName("com.mysql.jdbc.Driver");
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				String insQuery = "";
				insQuery = "insert into activities values (" + "'" + createValues[0] + "'" + ","
						                                     + "'" + createValues[1] + "'" + ","
						                                     + "'" + createValues[2] + "'" + ","
						                                     + "'" + createValues[3] + "'" + ","
						                                     + "'" + createValues[4] + "'" + ","
						                                     + "'" + createValues[5] + "'" + ","
						                                     + "'" + createValues[6] + "'" + ","
						                                     + "'" + createValues[7] + "'" + ","
						                                     + "'" + createValues[8] + "'" + ","
						                                     + "'方式：" + createValues[9] + "'" + ","
						                                     + "'" + createValues[10] + "'" + ","
						                                     + Double.parseDouble(createValues[11]) + ","
						                                     + Integer.parseInt(createValues[12])  + ","
						                                     + "'兴趣：" + createValues[13] + "'" + ","
						                                     + "'院系：" + createValues[14] + "'" + ","
						                                     
						                                     + "'" + createValues[15] + "'" + ","
						                                     + "'" + picFile + "'" + ","
						                                     + 0 + ","
						                                     + 0 
						                                     + ",'"+id+"')";
				 Connection connect = DriverManager.getConnection(
				          "jdbc:mysql://localhost/act0", "root", "dzb19980322");
				 Statement stmt = connect.createStatement();
			      
			      stmt.executeUpdate(insQuery);
			      
			
			
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		request.setAttribute("acID", createValues[0]);
		request.getRequestDispatcher("StudentPlatform/Activity/display.jsp").forward(request, response);
		System.out.println("create success");
	}
}


