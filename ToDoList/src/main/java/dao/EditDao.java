package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;


public class EditDao {
	public static ResultSet editDetails(int id,HttpSession hs) {
		String user=(String) hs.getAttribute("user");
		
		try {
			System.out.println("i went inside try blco");
			System.out.println(id);
			Connection con=GetConnection.getConnection();
			String sql="select * from "+user+" where id="+id;
			PreparedStatement pst=con.prepareStatement(sql);
//			pst.setString(1, user);
//			pst.setInt(2,id);
			ResultSet rs = pst.executeQuery();
			if(rs==null) System.out.println("rs is null inside try blok");
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		

		
	}
}
