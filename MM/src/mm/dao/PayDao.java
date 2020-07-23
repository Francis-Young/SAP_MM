package mm.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import mm.utils.DBUtil;
public class PayDao {
	public void addPay(int order,float amount,int vendor,int status,String time,int user) {
		Connection connection = DBUtil.getConnection();
        PreparedStatement pstmt =null;
		try {
	            String sql = "INSERT INTO Payment (Vendor_id,Order_num,Amount,Paid_Status,Pay_Time,Pay_user) VALUES (?,?,?,?,?,?)"; 
				pstmt=connection.prepareStatement(sql);
				pstmt.setInt(1, vendor);
				pstmt.setInt(2, order);
				pstmt.setFloat(3, amount);
				pstmt.setInt(4, status);
				pstmt.setString(5, time);
				pstmt.setInt(6, user);
	            int row = pstmt.executeUpdate();
	            if (row>0) {
	                System.out.println("数据添加成功！");
	            }else {
	                System.out.println("数据添加失败！");
	            }

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(connection);

	}
}
