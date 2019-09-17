package allCRUD;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import allCRUD.DBconnection;

/**
 * Servlet implementation class Update_data
 */
@WebServlet("/Update_data")
public class Update_data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_data() {
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
		
		String Username = request.getParameter("username");
		String Password = request.getParameter("password");
		String dob = request.getParameter("dob");
		String xNIC = request.getParameter("nic");
		int NIC = Integer.parseInt(xNIC);
		String Email =request.getParameter("email"); 
		
		try {
			String user=request.getParameter("username");
			System.out.println(user);
			//where id=(select MAX(uid) from user)
			String sql = "UPDATE all_table SET username='"+Username+"',password='"+Password+"',dob='" +dob+"',nic="+NIC+",email='"+Email+"'Where username ='"+Username+"'";
			java.sql.Connection con=DBconnection.getconn();
			java.sql.PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs;
			st.executeUpdate(sql);
			System.out.println("Succesfully Updated !!");
			request.getRequestDispatcher("UpdateSuccess.jsp").forward(request,response);
			
			
		}catch(Exception ex) {
			System.out.println("Error" +ex);
			
		}
	}

}
