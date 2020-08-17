package mm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import mm.bean.User;
import mm.utils.DBUtil;

public class LoginDao {
	public boolean isValid(String unum, String ucode) {
		boolean valid = false;
		Connection conn = DBUtil.getConnection();

		try {
			PreparedStatement stat = conn.prepareStatement("select * from User where user_num=? and user_password=?");
			stat.setString(1, unum);
			stat.setString(2, ucode);
			ResultSet rs = stat.executeQuery();// ��ɾ�ĺͲ�ѯ�����ò�ͬ�ĺ���
			if (rs.next())
				valid = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (valid) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String llt = dateFormat.format(new Date());
			try {
				PreparedStatement stat = conn.prepareStatement("update User SET user_lastlogintime=? where user_num=?");
				stat.setString(1, llt);
				stat.setString(2, unum);
				stat.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		DBUtil.closeConnection(conn);
		return valid;
	}

	public void initUser(User user, String unum) {
		Connection conn = DBUtil.getConnection();
		try {
			PreparedStatement stat = conn.prepareStatement("select user_name,user_portrait from User where user_num=?");
			stat.setString(1, unum);
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				user.setUser_name(rs.getString("user_name"));
				user.setUser_portrait(rs.getString("user_portrait"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
