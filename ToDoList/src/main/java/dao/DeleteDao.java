package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteDao {
		public static boolean DeleteTask(int id, String user) throws SQLException
		{
			Connection con=GetConnection.getConnection();
			String sql="Delete from "+user+" where id= "+id;
			Statement st= con.createStatement();
			int res = st.executeUpdate(sql);
			
			if(res==1)
			{
				return true;
			}
			return false;
					
		}
}
