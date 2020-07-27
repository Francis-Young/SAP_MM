package mm.dao;


import mm.bean.Quotation_item;

import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class QuotationItemDao {
	//����һ���빺��
	public static void addQuotationItem(Quotation_item qi) {
		//���������ݿ������
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Quotation_item" +" (quotation_item_num,quotation_num,price,quantity,delivery_date,currency_unit,material_num,quotation_status) "+"values(default,?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setInt(1, qi.getQuotation_num());
			psmt.setBigDecimal(2, qi.getPrice());
			psmt.setInt(3, qi.getQuantity());
			psmt.setDate(4, qi.getDelivery_date());
			psmt.setString(5, qi.getCurrency_unit());
			psmt.setString(6, qi.getMaterial_num());
			psmt.setInt(7, qi.getQuotation_status());
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//���ݱ�Ų�ѯ
	public static Quotation_item findQuotationItemByQiNum(int num) {
		
		Quotation_item qi=new Quotation_item();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation_item where quotation_item_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				qi.setQuotation_item_num(rs.getInt("quotation_item_num"));
				qi.setQuotation_num(rs.getInt("quotation_num"));
				qi.setPrice(rs.getBigDecimal("price"));
				qi.setQuotation_status(rs.getInt("quotation_status"));
				qi.setQuantity(rs.getInt("quantity"));
				qi.setCurrency_unit(rs.getString("currency_unit"));
				qi.setDelivery_date(rs.getDate("delivery_date"));
				qi.setMaterial_num(rs.getString("material_num"));
				
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return qi;
	}

	
	//����quotation��Ų�ѯ 
	public static ArrayList<Quotation_item> findQuotationByVendorNum(int num) {
		ArrayList<Quotation_item> qilist=new ArrayList<Quotation_item>();
		Quotation_item qi=new Quotation_item();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation_item where quotation_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
			
				qi.setQuotation_item_num(rs.getInt("quotation_item_num"));
				qi.setQuotation_num(rs.getInt("quotation_num"));
				qi.setPrice(rs.getBigDecimal("price"));
				qi.setQuotation_status(rs.getInt("quotation_status"));
				qi.setQuantity(rs.getInt("quantity"));
				qi.setCurrency_unit(rs.getString("currency_unit"));
				qi.setDelivery_date(rs.getDate("delivery_date"));
				qi.setMaterial_num(rs.getString("material_num"));
				qilist.add(qi);
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return qilist;
	}
	
	//�ж�ĳ������Ŀ�ŷ���ڣ��������򷵻�true���������ڷ���false
	public static boolean isOiNumExist(int num) {
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
			//��ѯ��䣬����ѧ�Ų�ѯ
			String sql=""+"select * from Quotation_item where Quotation_item_num = ?";
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
	
	
	
	//�޸�
	public static int modifyQuotationItem(Quotation_item qi) {
		
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Quotation set quotation_num = ? ,price = ? ,quantity = ? ,delivery_date = ? ,currency_unit = ? ,material_num = ?,Quotation_status= ? where quotation_item_num= ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qi.getQuotation_num());
			psmt.setBigDecimal(2, qi.getPrice());
			psmt.setInt(3, qi.getQuantity());
			psmt.setDate(4, qi.getDelivery_date());
			psmt.setString(5, qi.getCurrency_unit());
			psmt.setString(6, qi.getMaterial_num());
			psmt.setInt(7, qi.getQuotation_status());
			psmt.setInt(8, qi.getQuotation_item_num());
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
	
	//ɾ��ĳһ��
	public static int deleteQuotationByNum(int num) {
		
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"delete from Quotation_item where quotation_item_num= ? ";
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