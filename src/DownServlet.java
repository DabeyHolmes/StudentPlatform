

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownServlet
 */
@WebServlet("/DownServlet")
public class DownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownServlet() {
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
		// TODO Auto-generated method stub
		      String name=request.getParameter("questionFileName");
		      System.out.println(name);
		      String[] str=name.split("/");
		      name=str[str.length-1];
	          String path=request.getServletContext().getRealPath("Competition/assets/images")+"/"+name;
	          //path=new String(path.getBytes("iso-8859-1"));
	          File file=new File(path);
	          InputStream in=new FileInputStream(file);
	          OutputStream os=response.getOutputStream();
	          response.addHeader("Content-Disposition", "attachment;filename="+new String(file.getName()
	        		  .getBytes("gbk"),"iso-8859-1"));
	          response.addHeader("Content-Length", file.length()+"");
	          response.setCharacterEncoding("gbk");
	          response.setContentType("application/octet-Stream");
	          int data=0;
	          while((data=in.read())!=-1) {
	        	  os.write(data);
	          }
	          os.close();
	          in.close();
	}

}
