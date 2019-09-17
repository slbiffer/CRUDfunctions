package allCRUD;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

import allCRUD.DBconnection;

 /**
 * Servlet implementation class Add_data
 */
@WebServlet("/Add_data")
public class Add_data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_data() {
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
			String Password = request.getParameter("password");
			String dob = request.getParameter("dob");
			String xNIC = request.getParameter("nic");
			int nic = Integer.parseInt(xNIC);
//			String x = request.getParameter("phone");
//			int phone = Integer.parseInt(x);
			String Email = request.getParameter("email");

			String sql = "INSERT INTO all_table (username,password,dob,nic,email) VALUES ('"
					+ Username + "', PASSWORD('" + Password + "'), '" + dob + "'," + nic + ",'" + Email + "')";
			System.out.println("sql:nnn "+sql);
			
			Connection con=DBconnection.getconn();
			java.sql.PreparedStatement st = con.prepareStatement(sql);
			st.execute(sql);
			System.out.println("Successfully Inserted!");
			request.getRequestDispatcher("InsertSucces.jsp").forward(request, response);
			;
			
		} catch (Exception ex) {
			System.out.println("error : "+ex);
		}
		
		
		
	}

}
