package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ValidateLoginDao;
@WebServlet("/login")
public class ValidateLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user=req.getParameter("user");
		String pass=req.getParameter("pass");
		int res=ValidateLoginDao.validateLogin(user, pass) ;
		user= user.replace(' ','_');
		if(res==1) {
			HttpSession hs=req.getSession();
			hs.setAttribute("user", user);
			hs.setAttribute("pass", pass);
			
			RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);
		}
		else if(res==2)
		{
			PrintWriter pw= resp.getWriter();
			pw.write("<HTML><BODY><h4>Invalid username or password</h4></BODY></HTML>");
			RequestDispatcher rd= req.getRequestDispatcher("Login.jsp");
			rd.include(req, resp);
			
		}
		else {

			PrintWriter pw= resp.getWriter();
			pw.write("<html><body><h4>Username not found, Signup Required</h4></body></html>");
			RequestDispatcher rd= req.getRequestDispatcher("Signup.jsp");
			rd.include(req, resp);	
		}
	}

}
