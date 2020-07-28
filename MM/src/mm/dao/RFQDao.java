package mm.dao;

import mm.bean.RFQ;
import mm.bean.Requisition;
import mm.utils.DBUtil;
import java.sql.*;

public class RFQDao {
	//����һ��RFQ
	public static void addRFQ( RFQ rf) {
		//���������ݿ������
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into RFQ" +" (rfq_num,rfq_type,rfq_language,rfq_date,rfq_deadline,rfq_purchasing_org,rfq_purchasing_group,rfq_plant,requisition_num,vendor_code,rfq_coll) "+"values(default,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setString(1, rf.getRfq_type());
			psmt.setString(2, rf.getRfq_language());
			psmt.setDate(3, rf.getRfq_date());
			psmt.setDate(4, rf.getRfq_deadline());
			psmt.setString(5, rf.getRfq_purchasing_org());
			psmt.setString(6, rf.getRfq_purchasing_group());
			psmt.setString(7, rf.getRfq_plant());
			psmt.setInt(8, rf.getRequisition_num());
			psmt.setString(9, rf.getVendor_code());
			psmt.setString(10, rf.getRfq_coll());

			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//����RFQ
	public static void updateRFQ( RFQ rf) {
		//���������ݿ������
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "update RFQ set rfq_type = ? ,rfq_language = ? ,rfq_date = ? ,rfq_deadline = ? ,rfq_purchasing_org = ? ,rfq_purchasing_group = ? ,rfq_plant = ? ,requisition_num = ? ,vendor_code = ? ,rfq_coll = ? where rfq_num = ? " ;
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setString(1, rf.getRfq_type());
			psmt.setString(2, rf.getRfq_language());
			psmt.setDate(3, rf.getRfq_date());
			psmt.setDate(4, rf.getRfq_deadline());
			psmt.setString(5, rf.getRfq_purchasing_org());
			psmt.setString(6, rf.getRfq_purchasing_group());
			psmt.setString(7, rf.getRfq_plant());
			psmt.setInt(8, rf.getRequisition_num());
			psmt.setString(9, rf.getVendor_code());
			psmt.setString(10, rf.getRfq_coll());
			psmt.setInt(11, rf.getRfq_num());
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//����RFQ��Ų�ѯ
	public static RFQ findRFQbyNum(int num) {
		
		RFQ rf=new RFQ();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where rfq_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_num(rs.getInt("requisition_num"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//�����빺���Ų�ѯ
	public static RFQ findRFQbyrequiNum(int num) {
		
		RFQ rf=new RFQ();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where requisition_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_num(rs.getInt("requisition_num"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//����purchasing_org��ѯ
	public static RFQ findRFQbyPurcha_org(String org) {
		
		RFQ rf=new RFQ();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where rfq_purchasing_org = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, org);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_num(rs.getInt("requisition_num"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//����purchasing_group��ѯ
	public static RFQ findRFQbyPurcha_group(String gro) {
		
		RFQ rf=new RFQ();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where rfq_purchasing_group = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, gro);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_num(rs.getInt("requisition_num"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//���ݹ�����ѯ
	public static RFQ findRFQbyPlant(String plant) {
		
		RFQ rf=new RFQ();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where rfq_plant = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, plant);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_num(rs.getInt("requisition_num"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//����RFQ���Ͳ�ѯ
	public static RFQ findRFQbyType(String ty) {
		
		RFQ rf=new RFQ();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where rfq_type = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1,ty);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_num(rs.getInt("requisition_num"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	//���ݹ�Ӧ�̱����ѯ
	public static RFQ findRFQbyVenderCode(String code) {
		
		RFQ rf=new RFQ();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from RFQ where vendor_code = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rf.setRequisition_num(rs.getInt("requisition_num"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_type(rs.getString("rfq_type"));
				rf.setRfq_language(rs.getString("rfq_language"));
				rf.setRfq_date(rs.getDate("rfq_date"));
				rf.setRfq_deadline(rs.getDate("rfq_deadline"));
				rf.setRfq_purchasing_org(rs.getString("rfq_purchasing_org"));
				rf.setRfq_purchasing_group(rs.getString("rfq_purchasing_group"));
				rf.setVendor_code(rs.getString("vendor_code"));
				rf.setRfq_coll(rs.getString("rfq_coll"));
				rf.setRfq_num(rs.getInt("rfq_num"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rf;
	}
	
	
	
	
	
	

	//�ж�ĳRFQ���Ƿ���ڣ��������򷵻�true���������ڷ���false
	public static boolean isRfqNumExist(int num) {
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
			//��ѯ��䣬����ѧ�Ų�ѯ
			String sql=""+"select * from RFQ where rfq_num = ?";
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
}


