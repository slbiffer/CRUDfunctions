package allCRUD;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Delete_data
 */
@WebServlet("/Delete_data")
public class Delete_data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_data() {
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
		doGet(request, response);
		
		try {
			String Username = request.getParameter("username");
			
			System.out.println("User: " + Username);
			
            Connection con = DBconnection.getconn();
			String sql = ("Delete from all_table WHERE username='"+Username+"'"); 
		    PreparedStatement st = con.prepareStatement(sql);
		    st.executeUpdate(sql);
		    System.out.println("Successfully Deleted ");
		    request.getRequestDispatcher("DeleteSuccess.jsp").forward(request, response);
		}catch(Exception ex) {
			System.out.println("Error: " + ex);
		}
		
	}

}
