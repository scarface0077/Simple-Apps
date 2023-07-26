package dao;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SignInDao {
	public static boolean signUp(String name, String pass, long mobile )
	{
		try {
			Connection con=GetConnection.getConnection();
			String sql="insert into user_details(User,Pass,Mobile) values(?,?,?)";
			PreparedStatement pst= con.prepareStatement(sql);
			String name2=name.replace('_',' ');
			pst.setString(1, name2);
			pst.setNString(2,pass);
			pst.setLong(3, mobile);
			String sql2="create table "+name+"(id INT(5) AUTO_INCREMENT, task VARCHAR(100) not null, priority INT(5),Due_Date VARCHAR(50), primary key(id))";
			Statement st = con.createStatement();
			st.execute(sql2);
			int res =pst.executeUpdate();
			
			if(res==1) return true;
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
