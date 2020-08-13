package mm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mm.bean.DownList;
import mm.bean.Material;
import mm.bean.Requisition;
import mm.bean.Vendor;
import mm.utils.DBUtil;

public class MaterialDao {
	public static Material findMaterialbyNum(String num) {
		Connection conn = DBUtil.getConnection();
		Material m = new Material();
		try {
			PreparedStatement stat = conn.prepareStatement(
					"select * from Material where material_num =?  ");
			stat.setString(1, num);
			
		
			ResultSet rs = stat.executeQuery();
			if (rs.next()) {
				m.setMaterial_num(rs.getString(1));
				m.setMaterial_discr(rs.getString(2));
				m.setMaterial_baseunit(rs.getString(3));
				m.setMaterial_industrysec(rs.getString(4));
				m.setMaterial_salesorg(rs.getString(5));
				m.setMaterial_distrchannel(rs.getString(6));
				m.setMaterial_group(rs.getString(7));
				m.setMaterial_division(rs.getString(8));
				m.setMaterial_unitprice(rs.getString(9));
				m.setMaterial_availabilitycheck(rs.getString(10));
				m.setMaterial_purchasinggroup(rs.getString(11));
				m.setMaterial_MRPtype(rs.getString(12));
				m.setMaterial_MRPcontroller(rs.getString(13));
				m.setMaterial_lotsizingprocedure(rs.getString(14));
				m.setMaterial_minimumlotsize(rs.getString(15));
				m.setMaterial_planneddelivtime(rs.getString(16));
				m.setMaterial_shorttext(rs.getString(17));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
		return m;
	}
	public boolean addMaterial(Material m) throws SQLException {
		Connection conn = DBUtil.getConnection();
		boolean flag = false;
		try {
			PreparedStatement stat = conn.prepareStatement(
					"insert into Material(material_num,material_discr,material_baseunit,material_industrysec,material_salesorg,material_distrchannel,material_group,material_division,material_unitprice,material_availabilitycheck,material_purchasinggroup,material_MRPtype,material_MRPcontroller,material_lotsizingprocedure,material_minimumlotsize,material_planneddelivtime,material_shorttext) VALUE(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			stat.setString(1, m.getMaterial_num());
			stat.setString(2, m.getMaterial_discr());
			stat.setString(3, m.getMaterial_baseunit());
			stat.setString(4, m.getMaterial_industrysec());
			stat.setString(5, m.getMaterial_salesorg());
			stat.setString(6, m.getMaterial_distrchannel());
			stat.setString(7, m.getMaterial_group());
			stat.setString(8, m.getMaterial_division());
			stat.setString(9, m.getMaterial_unitprice());
			stat.setString(10, m.getMaterial_availabilitycheck());
			stat.setString(11, m.getMaterial_purchasinggroup());
			stat.setString(12, m.getMaterial_MRPtype());
			stat.setString(13, m.getMaterial_MRPcontroller());
			stat.setString(14, m.getMaterial_lotsizingprocedure());
			stat.setString(15, m.getMaterial_minimumlotsize());
			stat.setString(16, m.getMaterial_planneddelivtime());
			stat.setString(17, m.getMaterial_shorttext());
			stat.executeUpdate();
			PreparedStatement stat2 = conn.prepareStatement("SELECT LAST_INSERT_ID()");
			ResultSet rs = stat2.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
		return flag;
	}


}
