package mm.dao;


import mm.bean.Order_item;
import mm.bean.Requisition_item;
import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class OrderItemDao {
	//����һ���빺��
	public static void addOrderItem(Order_item oi) {
		//���������ݿ������
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Order_item" +" (order_item_num,order_num,purchase_requisition_num,price,quantity,delivery_date,currency_unit,material_num) "+"values(default,?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setInt(1, oi.getOrder_num());
			psmt.setInt(2, oi.getPurchase_requisition_num());
			psmt.setBigDecimal(3, oi.getPrice());
			psmt.setInt(4, oi.getQuantity());
			psmt.setDate(5, oi.getDelivery_date());
			psmt.setString(6, oi.getCurrency_unit());
			psmt.setString(7, oi.getMaterial_num());
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//���ݱ�Ų�ѯ
	public static Order_item findOrderItemByOiNum(int num) {
		
		Order_item oi=new Order_item();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Order_item where order_item_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				oi.setOrder_item_num(rs.getInt("order_item_num"));
				oi.setOrder_num(rs.getInt("order_num"));
				oi.setPrice(rs.getBigDecimal("price"));
				oi.setPurchase_requisition_num(rs.getInt("purchase_requisition_num"));
				oi.setQuantity(rs.getInt("quantity"));
				oi.setCurrency_unit(rs.getString("currency_unit"));
				oi.setDelivery_date(rs.getDate("delivery_date"));
				oi.setMaterial_num(rs.getString("material_num"));
				
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return oi;
	}

	
	//����order��Ų�ѯ 
	public static ArrayList<Order_item> findOrderByVendorNum(int num) {
		ArrayList<Order_item> oilist=new ArrayList<Order_item>();
		Order_item oi=new Order_item();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Order_item where order_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
			
				oi.setOrder_item_num(rs.getInt("order_item_num"));
				oi.setOrder_num(rs.getInt("order_num"));
				oi.setPrice(rs.getBigDecimal("price"));
				oi.setPurchase_requisition_num(rs.getInt("purchase_requisition_num"));
				oi.setQuantity(rs.getInt("quantity"));
				oi.setCurrency_unit(rs.getString("currency_unit"));
				oi.setDelivery_date(rs.getDate("delivery_date"));
				oi.setMaterial_num(rs.getString("material_num"));
				oilist.add(oi);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return oilist;
	}
	
	//�ж�ĳ������Ŀ�ŷ���ڣ��������򷵻�true���������ڷ���false
	public static boolean isOiNumExist(int num) {
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
			//��ѯ��䣬����ѧ�Ų�ѯ
			String sql=""+"select * from Order_item where Order_item_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
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
	
	
	
	//�޸Ķ�����Ŀ
	public static int modifyOrderItem(Order_item oi) {
		
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Order set order_num = ? ,purchase_requisition_num = ? ,price = ? ,quantity = ? ,delivery_date = ? ,currency_unit = ? ,material_num = ? where order_item_num= ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, oi.getOrder_num());
			psmt.setInt(2, oi.getPurchase_requisition_num());
			psmt.setBigDecimal(3, oi.getPrice());
			psmt.setInt(4, oi.getQuantity());
			psmt.setDate(5, oi.getDelivery_date());
			psmt.setString(6, oi.getCurrency_unit());
			psmt.setString(7, oi.getMaterial_num());
			psmt.setInt(8, oi.getOrder_item_num());
			//ִ�в�ѯ���
			res= psmt.executeUpdate();
		
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		return res;
		
	}	
	//ɾ��������Ŀ
	public static int deleteOrderByNum(int num) {
		
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"delete from Order_item where order_item_num= ? ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
		
			//ִ�в�ѯ���
			res= psmt.executeUpdate();
		
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		return res;
		
	}	
	
	
}
