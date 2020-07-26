package mm.dao;

import mm.bean.Quotation;
import mm.bean.Requisition_item;
import mm.utils.DBUtil;
import java.sql.*;
import java.util.ArrayList;

public class QuotationDao {
	//����һ���빺��
	public static void addQuotation(Quotation qo) {
		//���������ݿ������
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Quotation" +" (quotation_num,rfq_num,vendor_num) "+"values(default,?,?)";
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
	public static Quotation findQuotationByNum(int num) {
		
		Quotation rq=new Quotation();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation where quotation_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setQuotation_num(rs.getInt("quotation_num"));
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
	public static Quotation findQuotationByRFQNum(int num) {
		
		Quotation rq=new Quotation();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation where rfq_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setQuotation_num(rs.getInt("quotation_num"));
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
	//��ͬһ��rfq���ж�����۵���
	//���ݹ�Ӧ�̱�Ų�ѯ 
	public static ArrayList<Quotation> findQuotationByVendorNum(int num) {
		ArrayList<Quotation> qolist=new ArrayList<Quotation>();
		Quotation qo=new Quotation();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Quotation where vendor_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
			
				qo.setQuotation_num(rs.getInt("quotation_num"));
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
			String sql=""+"select * from Quotation where quotation_num = ?";
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
	public static int modifyQuotationByNum(Quotation qo) {
		
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Quotation set rfq_num = ?, vendor_num = ? where quotation_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qo.getRfq_num());
			psmt.setInt(2, qo.getVendor_num());
			
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
