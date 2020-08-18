package mm.dao;

import mm.bean.RFQ;
import mm.bean.RFQ_item;
import mm.bean.Requisition;
import mm.bean.Requisition_item;
import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class RFQItemDao {
	//插入一张RFQ
	public static void addRFQItem( RFQ_item ri) {
		//建立与数据库的连接
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into RFQ_item" +" (rfqItem_num,rfq_code,material_num,requisition_quantity,requisition_deliverydate,requisition_plant) "+"values(default,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, ri.getRfq_code());
			psmt.setString(2, ri.getMaterial_num());
			psmt.setInt(3, ri.getRequisition_quantity());
			psmt.setDate(4, ri.getRequisition_deliverydate());
			psmt.setString(5, ri.getRequisition_plant());

			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//更新RFQ
	public static void updateRFQ( RFQ rf) {
		//建立与数据库的连接
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "update RFQ set rfq_type = ? ,rfq_language = ? ,rfq_date = ? ,rfq_deadline = ? ,rfq_purchasing_org = ? ,rfq_purchasing_group = ? ,rfq_plant = ? ,requisition_code = ? ,vendor_code = ? ,rfq_coll = ? where rfq_code = ? " ;
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setString(1, rf.getRfq_type());
			psmt.setString(2, rf.getRfq_language());
			psmt.setDate(3, rf.getRfq_date());
			psmt.setDate(4, rf.getRfq_deadline());
			psmt.setString(5, rf.getRfq_purchasing_org());
			psmt.setString(6, rf.getRfq_purchasing_group());
			psmt.setString(7, rf.getRfq_plant());
			psmt.setString(8, rf.getRequisition_code());
			psmt.setString(9, rf.getVendor_code());
			psmt.setString(10, rf.getRfq_coll());
			psmt.setString(11, rf.getRfq_code());
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}

	//判断某RFQ号是否存在，若存在则返回true，若不存在返回false
	public static boolean isRfqNumExist(int num) {
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
			//查询语句，根据学号查询
			String sql=""+"select * from RFQ where rfq_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				return true;
				
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		return false;
	}
	//根据rfq编号查询
	public static ArrayList<RFQ_item> findRFQItemByRfqCode(String rfqcode) {
		ArrayList<RFQ_item> rilist=new ArrayList<RFQ_item>();
		RFQ_item ri=new RFQ_item();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ_item where rfq_code = ?  ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, rfqcode);
			
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				ri.setMaterial_num(rs.getString("material_num"));
				ri.setRequisition_deliverydate(rs.getDate("requisition_deliverydate"));
				ri.setRequisition_plant(rs.getString("requisition_plant"));
				ri.setRequisition_quantity(rs.getInt("requisition_quantity"));
				ri.setRequisition_storageloc(rs.getString("requisition_storageloc"));
				ri.setRfq_code(rs.getString("rfq_code"));
				ri.setRfqItem_num(rs.getInt("rfqItem_num"));
			
				rilist.add(ri);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rilist;
	}
}


