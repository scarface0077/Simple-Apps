package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

public class SaveTaskDao {
	public static boolean saveTask(String task, int priority , String dt,HttpSession hs)
	{
		hs.getAttribute("usern");
		
		
		try {
			Connection con=GetConnection.getConnection();
			String sql="insert into "+hs.getAttribute("user")+"(task,priority,Due_Date) values(?,?,?)";
			System.out.println(dt);
			PreparedStatement pst= con.prepareStatement(sql);
			pst.setString(1, task);
			pst.setInt(2,priority);
			pst.setString(3, dt);
			int res =pst.executeUpdate();
			if(res==1) { 
				con.close();
				return true;}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}

}
