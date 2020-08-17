package mm.utils;
import java.sql.*;
public class DBUtil {
	public static Connection getConnection() {
		String driverName="com.mysql.jdbc.Driver";
		//String dbURL="jdbc:mysql://49.235.199.30:3306/MM?zeroDateTimeBehavior=convertToNull&characterEncoding=UTF8";
		String dbURL="jdbc:mysql://121.199.56.87:3306/MM?zeroDateTimeBehavior=convertToNull&characterEncoding=UTF8&useSSL=false";

		String userName="root";
		String userPwd="2020";
		Connection dbConn=null;
		try {
			Class.forName(driverName);
			dbConn=DriverManager.getConnection(dbURL,userName,userPwd);
		}
		catch (ClassNotFoundException nfe) {
			nfe.printStackTrace();
			} 
		catch(SQLException sqle) {
			sqle.printStackTrace();
			}
		return dbConn;
	}
	public static void closeConnection(Connection Conn) {
		if (Conn!=null) {
			try {
				Conn.close();
			}
			catch (SQLException sqle) {
				 sqle.printStackTrace();
			}
		}
	}
}