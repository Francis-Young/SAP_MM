package mm.dao;

import mm.bean.Order;
import mm.bean.Requisition_item;
import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class OrderDao {
	//����һ���빺��
	public static void addOrder(Order qo) {
		//���������ݿ������
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Order" +" (order_num,rfq_num,vendor_num) "+"values(default,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setInt(1, qo.getRfq_num());
			psmt.setInt(2, qo.getVendor_num());
	
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//���ݱ�Ų�ѯ
	public static Order findOrderByNum(int num) {
		
		Order rq=new Order();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Order where Order_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setOrder_num(rs.getInt("order_num"));
				rq.setRfq_num(rs.getInt("rfq_num"));
				rq.setVendor_num(rs.getInt("vendor_num"));
				
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rq;
	}
	//����rfq��Ų�ѯ
	public static Order findOrderByRFQNum(int num) {
		
		Order rq=new Order();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Order where rfq_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setOrder_num(rs.getInt("order_num"));
				rq.setRfq_num(rs.getInt("rfq_num"));
				rq.setVendor_num(rs.getInt("vendor_num"));
				
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rq;
	}
	
	//���ݹ�Ӧ�̱�Ų�ѯ 
	public static ArrayList<Order> findOrderByVendorNum(int num) {
		ArrayList<Order> qolist=new ArrayList<Order>();
		Order qo=new Order();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Order where vendor_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
			
				qo.setOrder_num(rs.getInt("order_num"));
				qo.setRfq_num(rs.getInt("rfq_num"));
				qo.setVendor_num(rs.getInt("vendor_num"));
				qolist.add(qo);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return qolist;
	}
	
	//�ж�ĳ���۵��ŷ���ڣ��������򷵻�true���������ڷ���false
	public static boolean isqoNumExist(int num) {
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
			//��ѯ��䣬����ѧ�Ų�ѯ
			String sql=""+"select * from Order where Order_num = ?";
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
	
	
	
	//�޸ı��۵�
	public static int modifyOrderByNum(Order qo) {
		
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Order set rfq_num = ?, vendor_num = ? where order_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qo.getRfq_num());
			psmt.setInt(2, qo.getVendor_num());
			psmt.setInt(3, qo.getOrder_num());
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
