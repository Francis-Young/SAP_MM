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

	public String getPermissionName(String unum) {
		String permissionnum = unum.substring(0, 4);
		String department1 = permissionnum.substring(0, 2);
		String department2 = permissionnum.substring(2, 4);
		String pn="待定";
		if(department1.equals("00")) {
			if(department2.equals("00")) {
				pn="物料主管";
			}
		}else if(department1.equals("01")) {
			if(department2.equals("01")) {
				pn="财务专员";
			}
		}else if(department1.equals("02")) {
			if(department2.equals("01")) {
				pn="采购职员";
			}else if(department2.equals("02")) {
				pn="收货职员";
			}else if(department2.equals("03")) {
				pn="仓库管理员";
			}
		}
		return pn;
	}
}
