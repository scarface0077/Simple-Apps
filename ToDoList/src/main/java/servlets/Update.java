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

import dao.UpdateDao;
@WebServlet("/edit")
public class Update extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String task=req.getParameter("task");
		int id=Integer.parseInt(req.getParameter("id"));
		HttpSession hs  = req.getSession();
		int priority=Integer.parseInt(req.getParameter("priority"));
		String date=req.getParameter("date");
		boolean res = UpdateDao.updateTask(id,task,priority,date,hs);
		
		if(res) {
			PrintWriter pw= resp.getWriter();
			pw.write("<html><body><h4>Task updated successfully</h4></body></html");
			RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
			rd.include(req, resp);
		}
		else {
			PrintWriter pw= resp.getWriter();
			pw.write("<html><body><h4>Task updation failed</h4></body></html");
			RequestDispatcher rd= req.getRequestDispatcher("index.jsp");
			rd.include(req, resp);
		}
	}
}
