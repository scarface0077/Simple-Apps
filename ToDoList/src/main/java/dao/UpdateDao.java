package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

public class UpdateDao {
	public static boolean updateTask(int id, String task, int priority, String date, HttpSession hs) {
String user=(String) hs.getAttribute("user");
		System.out.println(user);
		try {
			Connection con = GetConnection.getConnection();
			String sql="UPDATE "+user+" SET task =?, priority= ?, Due_Date=?  WHERE id=?";
			PreparedStatement pst=con.prepareStatement(sql);
			
//			pst.setString(1, user);
			pst.setString(1,task);
			pst.setInt(2,priority);
			pst.setString(3,date);
			pst.setInt(4,id);
			int rows= pst.executeUpdate();
			if(rows==1) return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}
}
