package com.imooc.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;

import com.imooc.model.company;
import com.imooc.model.personal;
import com.imooc.model.user;

import DataBaseHelp.DBHelp;

public class AccountDAO {

	// 登陆，包括企业用户登录、个人用户登录、管理员登陆********************
	public user Login(String type, String email, String password) {
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		user iuser = new user();
		try {
			conn = DBHelp.getConnection();
			String sql = null;
			if (type.equals("0")) {
				sql = "select * from personal where email=? and password=?;"; ///// 类型为0，个人用户
			} else if (type.equals("1")) {
				sql = "select * from company where email=? and password=?;"; //// 类型为1，企业用户
			} else if (type.equals("2")) {
				sql = "select * from master where email=? and password=?;"; //// 类型为2，管理员
			}
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, email);
			ptmt.setString(2, password);
			rs = ptmt.executeQuery();
			while (rs.next()) {
				iuser.setName(rs.getString("name"));
				iuser.setType(rs.getString("type"));
				iuser.setId(rs.getInt("id"));
				iuser.setEmail(rs.getString("email"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (ptmt != null) {
				try {
					ptmt.close();
					ptmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return iuser;
	}

	// 已登录状态
	// 修改密码,传过来的数据包括用户类型type，帐号email、原始密码，新密码（重复新密码在jsp页面判断），验证码verify,
	// 返回：验证码错误/用户名或密码错误????
	// 找回密码********************************************************
	public boolean FindPassword(String type, String email, String password) {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = null;
			if (type.equals("0")) {
				sql = "update personal set password=? where email=?;"; ///// 类型为0，个人用户
			} else if (type.equals("1")) {
				sql = "update company set password=? where email=?;"; //// 类型为1，企业用户
			}
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, password);
            ptmt.setString(2, email);
			ptmt.execute();
			reasult = true;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (ptmt != null) {
				try {
					ptmt.close();
					ptmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return reasult;
	}

	// 注册****************************************
	// 增加一个用户
	public boolean adduser(user g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = "INSERT INTO user(id,type) VALUES(?,?);";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setInt(1, g.getId());
			ptmt.setString(2, g.getType());

			reasult = ptmt.execute();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (ptmt != null) {
				try {
					ptmt.close();
					ptmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return reasult;
	}

	// 个人用户
	public boolean addpersonal(personal g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = "INSERT INTO personal(id,type,email,password)" + " VALUES(?,?,?,?);";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setInt(1, g.getId());
			ptmt.setString(2, g.getType());
			ptmt.setString(3, g.getEmail());
			ptmt.setString(4, g.getPassword());

			reasult = ptmt.execute();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (ptmt != null) {
				try {
					ptmt.close();
					ptmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return reasult;
	}

	// 企业用户
	public boolean addcompany(company g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = "INSERT INTO company(id,type,email,password)" + " VALUES(?,?,?,?);";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setInt(1, g.getId());
			ptmt.setString(2, g.getType());
			ptmt.setString(3, g.getEmail());
			ptmt.setString(4, g.getPassword());

			reasult = ptmt.execute();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (ptmt != null) {
				try {
					ptmt.close();
					ptmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return reasult;
	}

	//////////////////////////////// 根据用户id，删除用户
	// 删除一个用户
	public boolean deleteuser(int id) throws SQLException {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = "delete from user where id=?;";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, id);
			reasult = ptmt.execute();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (ptmt != null) {
				try {
					ptmt.close();
					ptmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return reasult;
	}

	// 个人用户
	public boolean deletepersonal(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = "delete from personal where id=?;";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, id);
			reasult = ptmt.execute();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (ptmt != null) {
				try {
					ptmt.close();
					ptmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return reasult;
	}

	// 企业用户
	public boolean deletecompany(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = "delete from company where id=?;";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, id);
			reasult = ptmt.execute();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (ptmt != null) {
				try {
					ptmt.close();
					ptmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return reasult;
	}

}
