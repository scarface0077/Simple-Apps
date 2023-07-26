package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DeleteDao;
@WebServlet("/delete")
public class Delete extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession hs= req.getSession();
		if( hs.getAttribute("user")==null)
		{
			PrintWriter pw= resp.getWriter();
			pw.write("<html><body><h4>Session expired, login required</h4></body></html>");
			RequestDispatcher rd= req.getRequestDispatcher("Login.jsp");
			rd.include(req, resp);
		}

		
	
		String user = (String) hs.getAttribute("user");
				
		int id= Integer.parseInt(req.getParameter("id"));
		try {
			boolean res = DeleteDao.DeleteTask(id, user);
			if(res) {
				PrintWriter pw= resp.getWriter();
				pw.write("<html><body><h4>Task Deleted successfully</h4></body></html");
				RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
				rd.include(req, resp);
			}
			else {
				PrintWriter pw= resp.getWriter();
				pw.write("<html><body><h4>Task deletion failed</h4></body></html");
				RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
				rd.include(req, resp);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
