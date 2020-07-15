package mm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import mm.utils.DBUtil;

public class VendorDao {
	public void addVendor(String name) {		
		Connection conn=DBUtil.getConnection();

		try {
			PreparedStatement stat = conn.prepareStatement("insert into testtable_donnot_delete_please (name) VALUE(?)");
			stat.setString(1,name);
			stat.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);

	}
	//	int uid=0;
	//		PreparedStatement stat2 = conn.prepareStatement("SELECT LAST_INSERT_ID()");
	//		ResultSet rs=stat2.executeQuery();
	//		if (rs.next())	
	//			uid=rs.getInt(1);
	//	return uid;
}
