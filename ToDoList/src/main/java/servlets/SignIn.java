package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SignInDao;
@WebServlet("/signup")
public class SignIn extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usrname=req.getParameter("user");
		String password=req.getParameter("pass");
		long mobile= Long.parseLong(req.getParameter("mobile"));
		usrname=usrname.replace(' ','_');
		
		
		boolean res=SignInDao.signUp(usrname,password,mobile);
		if(res)
		{
			PrintWriter pw= resp.getWriter();
			pw.write("<html><body><h4>Sign up succesful</h4></body></html");
			RequestDispatcher rd= req.getRequestDispatcher("Login.jsp");
			rd.include(req, resp);
		}
		else {
			PrintWriter pw= resp.getWriter();
			pw.write("<HTML><BODY><h4>Something went wrong</h4></BODY></HTML>");
			RequestDispatcher rd= req.getRequestDispatcher("Login.jsp");
			rd.include(req, resp);
		}
	}

}
