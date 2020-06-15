

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EnterSignUp
 */
@WebServlet("/EnterSignUp")
public class EnterSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnterSignUp() {
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
		// TODO Auto-generated method stub
		 request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
		String filename=(String)request.getParameter("filename");
        String com_id=(String)request.getParameter("com_id");
        String com_name=(String)request.getParameter("com_name");
        String questionFile=(String)request.getParameter("questionFile");
        request.setAttribute("filename", filename);
	    request.setAttribute("com_name", com_name);
	    request.setAttribute("com_id", com_id);
	    request.setAttribute("questionFile", questionFile);
	    request.setAttribute("success", "请填入相关信息");
	    request.getRequestDispatcher("StudentPlatform/Competition/competitionSignUp.jsp").forward(request,response);
	}

}
