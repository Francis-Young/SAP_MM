package mm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mm.bean.Material;
import mm.bean.Requisition;
import mm.bean.Vendor;
import mm.utils.DBUtil;

public class VendorDao {
	public String addVendor(Vendor v) throws SQLException {
		Connection conn = DBUtil.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement(
					"insert into Vendor (vendor_name, vendor_type,vendor_taxnum,vendor_companycode,vendor_reconacct,vendor_paymentterms,vendor_currency,vendor_street,vendor_postalcode,vendor_city,vendor_country,vendor_region,vendor_clerk,vendor_language) VALUE(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			stat.setString(1, v.getVname());
			stat.setString(2, v.getVtype());
			stat.setString(3, v.getVtaxnum());
			stat.setString(4, v.getVcompanycode());
			stat.setString(5, v.getVreconacct());
			stat.setString(6, v.getVpaymentterms());
			stat.setString(7, v.getVcurrency());
			stat.setString(8, v.getVstreet());
			stat.setString(9, v.getVpostalcode());
			stat.setString(10, v.getVcity());
			stat.setString(11, v.getVcountry());
			stat.setString(12, v.getVregion());
			stat.setString(13, v.getVclerk());
			stat.setString(14, v.getVlanguage());
			stat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 返回供应商号
		String vnum = "";
		PreparedStatement stat2 = conn.prepareStatement("SELECT LAST_INSERT_ID()");
		ResultSet rs = stat2.executeQuery();
		if (rs.next()) {
			vnum = rs.getString(1);
		}
		DBUtil.closeConnection(conn);
		return vnum;
	}

	public void initCreateTable(ArrayList<String> reconacct, ArrayList<String> paymentterms, ArrayList<String> currency,
			ArrayList<String> language) {
		Connection conn = DBUtil.getConnection();

		try {
			PreparedStatement stat = conn.prepareStatement("select * from reconacct");
			ResultSet rs = stat.executeQuery();

			while (rs.next()) {
				reconacct.add(rs.getString("reconacct_num"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			PreparedStatement stat = conn.prepareStatement("select * from paymentterms");
			ResultSet rs = stat.executeQuery();

			while (rs.next()) {
				paymentterms.add(rs.getString("paymentterms_num"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			PreparedStatement stat = conn.prepareStatement("select * from currency");
			ResultSet rs = stat.executeQuery();

			while (rs.next()) {
				currency.add(rs.getString("currency_name"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			PreparedStatement stat = conn.prepareStatement("select * from language");
			ResultSet rs = stat.executeQuery();

			while (rs.next()) {
				language.add(rs.getString("language_name"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
	}

	public void addMaterial(Material m) throws SQLException {
		Connection conn = DBUtil.getConnection();
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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
	}

	public void findAllVendor(ArrayList<Vendor> v) {
		Connection conn = DBUtil.getConnection();

		try {
			PreparedStatement stat = conn
					.prepareStatement("select vendor_num,vendor_name,vendor_type,vendor_city from Vendor");
			ResultSet rs = stat.executeQuery();

			while (rs.next()) {
				Vendor vi = new Vendor();
				vi.setVnum(rs.getString(1));
				vi.setVname(rs.getString(2));
				String vtype = new String();
				if (rs.getString(3) == "person")
					vtype = "个人";
				else if (rs.getString(3) == "group")
					vtype = "团体";
				else
					vtype = "组织";
				vi.setVtype(vtype);
				vi.setVcity(rs.getString(4));

				v.add(vi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
	}

	public void findVendor(String vnums, Vendor v) {
		Connection conn = DBUtil.getConnection();
		int vnum = Integer.parseInt(vnums);
		try {
			PreparedStatement stat = conn.prepareStatement(
					"select vendor_name, vendor_type,vendor_taxnum,vendor_companycode,vendor_reconacct,vendor_paymentterms,vendor_currency,vendor_street,vendor_postalcode,vendor_city,vendor_country,vendor_region,vendor_clerk,vendor_language from Vendor where vendor_num=?");
			stat.setInt(1, vnum);
			ResultSet rs = stat.executeQuery();
			if (rs.next()) {
				v.setVtype(rs.getString("vendor_type"));
				v.setVname(rs.getString("vendor_name"));
				v.setVtaxnum(rs.getString("vendor_taxnum"));
				v.setVcompanycode(rs.getString("vendor_companycode"));
				v.setVreconacct(rs.getString("vendor_reconacct"));
				v.setVpaymentterms(rs.getString("vendor_paymentterms"));
				v.setVcurrency(rs.getString("vendor_currency"));
				v.setVstreet(rs.getString("vendor_street"));
				v.setVpostalcode(rs.getString("vendor_postalcode"));
				v.setVcity(rs.getString("vendor_city"));
				v.setVcountry(rs.getString("vendor_country"));
				v.setVregion(rs.getString("vendor_region"));
				v.setVlanguage(rs.getString("vendor_language"));
				v.setVclerk(rs.getString("vendor_clerk"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
	}
	public static Vendor findVendorbynum(String vnums) {
		Connection conn = DBUtil.getConnection();
		int vnum = Integer.parseInt(vnums);
		Vendor v = new Vendor();
		try {
			PreparedStatement stat = conn.prepareStatement(
					"select vendor_name, vendor_type,vendor_taxnum,vendor_companycode,vendor_reconacct,vendor_paymentterms,vendor_currency,vendor_street,vendor_postalcode,vendor_city,vendor_country,vendor_region,vendor_clerk,vendor_language from Vendor where vendor_num=?");
			stat.setInt(1, vnum);
			ResultSet rs = stat.executeQuery();
			if (rs.next()) {
				v.setVtype(rs.getString("vendor_type"));
				v.setVname(rs.getString("vendor_name"));
				v.setVtaxnum(rs.getString("vendor_taxnum"));
				v.setVcompanycode(rs.getString("vendor_companycode"));
				v.setVreconacct(rs.getString("vendor_reconacct"));
				v.setVpaymentterms(rs.getString("vendor_paymentterms"));
				v.setVcurrency(rs.getString("vendor_currency"));
				v.setVstreet(rs.getString("vendor_street"));
				v.setVpostalcode(rs.getString("vendor_postalcode"));
				v.setVcity(rs.getString("vendor_city"));
				v.setVcountry(rs.getString("vendor_country"));
				v.setVregion(rs.getString("vendor_region"));
				v.setVlanguage(rs.getString("vendor_language"));
				v.setVclerk(rs.getString("vendor_clerk"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBUtil.closeConnection(conn);
		return v;
	}
	public static ArrayList<Vendor> findVendorByAnything(Vendor vd) {
		ArrayList<Vendor> rqlist=new ArrayList<Vendor>();
		Vendor vd1=new Vendor();
		//建立数据库连接
		Connection conn=DBUtil.getConnection();
		try {
		
			String sql=""+"select * from Vendor ";
			if (!vd.getVname().equals("xx"))
				sql+="where vendor_name ="+'"'+vd.getVname()+'"'+",";
			if (!vd.getVtype().equals("xx"))
				sql+="where vendor_type ="+'"'+vd.getVtype()+'"';
			if (!vd.getVclerk().equals("xx"))
				sql+="where vendor_clerk ="+'"'+vd.getVclerk()+'"';
			if (!vd.getVcompanycode().equals("xx"))
				sql+="where vendor_companycode ="+'"'+vd.getVcompanycode()+'"';
			if (!vd.getVcountry().equals("xx"))
				sql+="where vendor_country ="+'"'+vd.getVcountry()+'"';
			if (!vd.getVcity().equals("xx"))
				sql+="where vendor_city ="+'"'+vd.getVcity()+'"';

			
			sql = sql.substring(0, sql.length() - 1);
			System.out.println(sql);
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			//执行查询语句
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				vd.setVnum(rs.getString(1));
				vd.setVtype(rs.getString("vendor_type"));
				vd.setVname(rs.getString("vendor_name"));
				vd.setVcompanycode(rs.getString("vendor_companycode"));
				vd.setVcity(rs.getString("vendor_city"));

			}
		}catch(SQLException e) {
            e.printStackTrace();
        }catch(NullPointerException f){
            f.printStackTrace();
        }finally {
            DBUtil.closeConnection(conn);
        }
		
		return rqlist;
	}
}
