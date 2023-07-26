package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ValidateLoginDao {
	public static int validateLogin(String user, String pass)
	{
		try {
			Connection con=GetConnection.getConnection();
			String sql="select * from user_details where user like '"+user +"'" 	;
			Statement st= con.createStatement();
			ResultSet rs= st.executeQuery(sql);
			if(rs.next())
			{
				if(rs.getString("pass").equals(pass))
				{
						return 1;
				}
				return 2;
			}
				
			
			}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 3;
		
	}

}
