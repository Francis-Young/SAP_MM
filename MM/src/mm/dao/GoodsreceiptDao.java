package mm.dao;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.json.*;

import mm.utils.DBUtil;

public class GoodsreceiptDao {
	public int addgoodsreceipt(int order_num, String posting_date,
			String document_date, String delivery_note) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		try {
			String sql = "INSERT INTO Delivery (purchase_order_num,posting_date,document_date,delivery_note) VALUES (?,?,?,?)";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, order_num);
			stat.setString(2, posting_date);
			stat.setString(3, document_date);
			stat.setString(4, delivery_note);

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
