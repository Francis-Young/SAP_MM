package mm.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Permissions {
	public boolean checkPermission(String webpage_name, String unum) {
		boolean flag = false;
		String permissionnum = unum.substring(0, 4);
		if (permissionnum.equals("0000")) {
			flag = true;
		} else {
			Connection conn = DBUtil.getConnection();
			try {
				PreparedStatement stat = conn.prepareStatement(
						"select * from Webpage_permission where webpage_name=? and (permission_num=? or permission_num='*')");
				stat.setString(1, webpage_name);
				stat.setString(2, permissionnum);
				ResultSet rs = stat.executeQuery();
				if (rs.next()) {
					flag = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBUtil.closeConnection(conn);
		}
		return flag;
	}
}
