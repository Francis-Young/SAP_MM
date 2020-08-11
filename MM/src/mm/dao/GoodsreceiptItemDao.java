package mm.dao;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.json.*;

import mm.utils.DBUtil;

public class GoodsreceiptItemDao {
	public int addgoodsreceiptitem(int m_text, String check,
			int m_num, String sloc) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		try {
			String sql = "INSERT INTO Delivery_item (material_num,OK,material_amount,storage_location) VALUES (?,?,?,?)";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, m_text);
			stat.setString(2, check);
			stat.setInt(3, m_num);
			stat.setString(4, sloc);

			int row = stat.executeUpdate();
			if (row > 0) {
			} else {
				System.out.println("输入失败");
			}
			return 1;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
		return 0;

	}
}
