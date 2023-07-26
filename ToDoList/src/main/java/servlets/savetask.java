package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.print.attribute.standard.DateTimeAtCompleted;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SaveTaskDao;
@WebServlet("/savetask")
public class savetask extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession hs=req.getSession();
		String task=req.getParameter("task");
		try {
		int priority=Integer.parseInt(req.getParameter("priority"));
		String dt= req.getParameter("Date").replace('T', ' ');
		
            
		boolean res=SaveTaskDao.saveTask(task, priority, dt, hs);
		if(res)
		{
			PrintWriter pw= resp.getWriter();
			pw.write("<html><body><h4>Task added</h4></body></html");
			RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
			rd.include(req, resp);
		}
		else {
			PrintWriter pw= resp.getWriter();
			pw.write("<html><body><h4>Task adding failed</h4></body></html");
			RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
			rd.include(req, resp);
		}
		
	}catch(NumberFormatException e)
		{
		PrintWriter pw= resp.getWriter();
		pw.write("<html><body><h4>Invalid Input, try again</h4></body></html>");
		RequestDispatcher rd= req.getRequestDispatcher("Add.jsp");
		rd.include(req, resp);
		}

}
}
