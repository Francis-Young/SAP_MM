package mm.dao;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.json.*;

import mm.utils.DBUtil;

public class GoodsreceiptDao {
	public int addgoodsreceipt(int order_num, String posting_date,
			String document_date, String delivery_note, String p_m_text,
			String td_3, String td_4, String td_5) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		try {
			String sql = "INSERT INTO Delivery (purchase_order_num,posting_date,document_date,delivery_note,delivery_material_num,OK,quantity_in_une,storage_location) VALUES (?,?,?,?,?,?,?,?)";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, order_num);
			stat.setString(2, posting_date);
			stat.setString(3, document_date);
			stat.setString(4, delivery_note);
			stat.setString(5, p_m_text);
			stat.setString(6, td_3);
			stat.setString(7, td_4);
			stat.setString(8, td_5);

			int row = stat.executeUpdate();
			if (row > 0) {
			} else {
				System.out.println("Êý¾ÝÌí¼ÓÊ§°Ü£¡");
			}
			return 1;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
		return 0;

	}
}
