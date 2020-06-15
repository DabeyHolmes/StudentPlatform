package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Random;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
@MultipartConfig
/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
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
		 Collection<Part> parts = request.getParts();
		    Random r = new Random();
			SimpleDateFormat f =new SimpleDateFormat("yy_MM_dd_HH_mm_ss");
			Date d = new Date();
			String st=f.format(d)+r.nextInt();
			String filename="";
		     for(Part part : parts){
		      	if(part.getContentType()!=null) {
		      		
		      		
		      	  	filename="D:/image/"+st+".jpg";
		      			part.write(filename);
		      		
		      			
		      	
		      	}
		      	
		      }
		     request.setAttribute("filename", filename);
		     //response.sendRedirect("PersonalInformation/image.jsp");
		     System.out.println("here");
		     request.getRequestDispatcher("StudentPlatform/PersonalInformation/image.jsp").forward(request,response);
	}

}
