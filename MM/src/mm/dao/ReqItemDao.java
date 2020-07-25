package mm.dao;

import mm.bean.Requisition;
import mm.bean.Requisition_item;
import mm.utils.DBUtil;
import java.sql.*;

public class ReqItemDao {
	//����һ���빺��Ŀ
	public static void addRequisition( Requisition_item ri) {
		//���������ݿ������
		Connection conn=DBUtil.getConnection();
		try {
			
			String sql=""+ "insert into Requisition_item" +" (requisition_num,material_num,requisition_quantity,requisition_deliverydate,requisition_plant,requisition_storageloc) "+"values(?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ri.getRequisition_num());
			psmt.setString(2, ri.getMaterial_num());
			psmt.setInt(3, ri.getRequisition_quantity());
			psmt.setDate(4, ri.getRequisition_deliverydate());
			psmt.setString(5, ri.getRequisition_plant());
			psmt.setString(6, ri.getRequisition_storageloc());
	
			psmt.execute();
		}catch(SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
	}
	//���ݱ�Ų�ѯ
	public static Requisition_item findRequItemByReqnumAndMatnum(int reqnum ,int matnum) {
		
		Requisition_item ri=new Requisition_item();
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Requisition_item where requisition_num = ?  and material_num = ? ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, reqnum);
			psmt.setInt(2, matnum);
			//ִ�в�ѯ���
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
			
				ri.setRequisition_num(rs.getInt("requisition_num"));
				ri.setMaterial_num(rs.getString("material_num"));
				ri.setRequisition_deliverydate(rs.getDate("requisition_deliverydate"));
				ri.setRequisition_plant(rs.getString("requisition_plant"));
				ri.setRequisition_storageloc(rs.getString("requisition_storageloc"));
				ri.setRequisition_quantity(rs.getInt("requisition_quantity"));
			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return ri;
	}
	

	
	//�ж�ĳ�빺�����Ƿ���ڣ��������򷵻�true���������ڷ���false
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

	public static int updateRequisitionByNum(int num,String description, String group) {
		
		//�������ݿ�����
		Connection conn=DBUtil.getConnection();
		int res=-1;
		try {
		
			String sql=""+"update Requisition set requisition_discription=? , requisition_purchasegroup = ? where requisition_num = ? ";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, description);
			psmt.setString(1, group);
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
