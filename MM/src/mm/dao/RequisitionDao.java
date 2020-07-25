package mm.dao;

import mm.bean.Requisition;
import mm.utils.DBUtil;
import java.sql.*;

public class RequisitionDao {
	//����һ���빺��
	public static void addRequisition( Requisition rq) {
		//���������ݿ������
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Requisition" +" (requisition_num,requisition_discription,requisition_purchasegroup) "+"values(default,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
		
			psmt.setString(1, rq.getRequisition_discription());
			psmt.setString(2, rq.getRequisition_purchasegroup());
	
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//���ݱ�Ų�ѯ
	public static Requisition findRequisitionByNum(int num) {
		
		Requisition rq=new Requisition();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Requisition where requisition_num = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				rq.setRequisition_num(rs.getInt("requisition_num"));
				rq.setRequisition_discription(rs.getString("requisition_discription"));
				rq.setRequisition_purchasegroup(rs.getString("requisition_purchasegroup"));
				
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
	//����group��ѯ
	public static Requisition findRequisitionBygroup(String purgro) {
		
		Requisition rq=new Requisition();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+"select * from Requisition where requisition_purchasegroup = ?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, purgro);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				
				rq.setRequisition_num(rs.getInt("requisition_num"));
				rq.setRequisition_discription(rs.getString("requisition_discription"));
				rq.setRequisition_purchasegroup(rs.getString("requisition_purchasegroup"));
				
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
	
	//�ж�ĳ�빺���ŷ���ڣ��������򷵻�true���������ڷ���false
	public static boolean isRqNumExist(int num) {
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
			//��ѯ��䣬����ѧ�Ų�ѯ
			String sql=""+"select * from Requisition where requisition_num = ?";
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
	//�޸��빺��
	public static int updateRequisitionByNum(int num,String description, String group) {
		
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Requisition set requisition_discription=? , requisition_purchasegroup = ? where requisition_num = ? ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, description);
			psmt.setString(2, group);
			psmt.setInt(3, num);
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
