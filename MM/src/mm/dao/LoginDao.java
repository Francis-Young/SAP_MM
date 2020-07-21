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
	public boolean isValid(String uid, String ucode) {
		boolean valid = false;
		Connection conn = DBUtil.getConnection();

		try {
			PreparedStatement stat = conn.prepareStatement("select * from User where user_id=? and user_password=?");
			stat.setString(1, uid);
			stat.setString(2, ucode);
			ResultSet rs = stat.executeQuery();// 增删改和查询，调用不同的函数
			if (rs.next())
				valid = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (valid) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String llt = dateFormat.format(new Date());
			try {
				PreparedStatement stat = conn.prepareStatement("update User SET user_lastlogintime=? where user_id=?");
				stat.setString(1, llt);
				stat.setString(2, uid);
				stat.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		DBUtil.closeConnection(conn);
		return valid;
	}

	public void initUser(User user, String uid) {
		Connection conn = DBUtil.getConnection();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			PreparedStatement stat = conn.prepareStatement("select user_id,user_portrait from User where user_id=?");
			stat.setString(1, uid);
			ResultSet rs = stat.executeQuery();
			while (rs.next()) {
				user.setUser_id(uid);
				user.setUser_portrait(rs.getString("user_portrait"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
