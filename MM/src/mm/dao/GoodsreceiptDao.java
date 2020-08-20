package mm.dao;

import java.sql.*;
import java.util.ArrayList;

import org.json.*;

import mm.bean.GoodsReceipt;
import mm.bean.Order;
import mm.bean.Requisition;
import mm.bean.Vendor;
import mm.utils.DBUtil;

public class GoodsreceiptDao {
	public int addgoodsreceipt(GoodsReceipt gr) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement stat = null;
		int num = 0;
		try {
			String sql = ""
					+ "INSERT INTO Delivery"
					+ " (delivery_num,purchase_order_num,posting_date,document_date,delivery_note) "
					+ "VALUES (default,?,?,?,?)";
			stat = conn.prepareStatement(sql);
			stat.setString(1, gr.getOrder_num());
			stat.setString(2, gr.getPosting_date());
			stat.setString(3, gr.getDocument_date());
			stat.setString(4, gr.getDelivery_note());

			stat.execute();

			sql = "SELECT LAST_INSERT_ID()";
			stat = conn.prepareStatement(sql);
			ResultSet rs = stat.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
		return num;

	}

	public static ArrayList<Order> findOrderByAnything(Order od) {
		ArrayList<Order> odlist = new ArrayList<Order>();
		// 建立数据库连接
		Connection conn = DBUtil.getConnection();
		
		try {
			String sql = "" + "SELECT * FROM `Order`";
			int flag=0;
			
			if(!od.getVendor_code().equals("")){
				sql+=" WHERE vendor_code="+'"'+od.getVendor_code()+'"';
				flag=1;
			}
			if(!od.getPur_org().equals("")){
				if(flag==1){
					sql+="AND ";
				}else{sql+="WHERE ";}
				sql+="pur_org="+'"'+od.getPur_org()+'"';	
				flag=1;
			}
			if(!od.getPur_group().equals("")){
				if(flag==1){
					sql+="AND ";
				}else{sql+="WHERE ";}
				sql+="pur_group="+'"'+od.getPur_group()+'"';
			}
			
			PreparedStatement psmt = conn.prepareStatement(sql);
			// 执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				Order od1 = new Order();
				od1.setDocdate(rs.getDate("docdate"));
				od1.setOrder_code(rs.getString("order_code"));
				od1.setPur_org(rs.getString("pur_org"));
				od1.setRfq_code(rs.getString("rfq_code"));
				odlist.add(od1);

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NullPointerException f) {
			f.printStackTrace();
		} finally {
			DBUtil.closeConnection(conn);
		}

		return odlist;
	}
}
