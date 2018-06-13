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

	// ��½��������ҵ�û���¼�������û���¼������Ա��½********************
	public user Login(String type, String email, String password) {
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		user iuser = new user();
		try {
			conn = DBHelp.getConnection();
			String sql = null;
			if (type.equals("0")) {
				sql = "select * from personal where email=? and password=?;"; ///// ����Ϊ0�������û�
			} else if (type.equals("1")) {
				sql = "select * from company where email=? and password=?;"; //// ����Ϊ1����ҵ�û�
			} else if (type.equals("2")) {
				sql = "select * from master where email=? and password=?;"; //// ����Ϊ2������Ա
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

	// �ѵ�¼״̬
	// �޸�����,�����������ݰ����û�����type���ʺ�email��ԭʼ���룬�����루�ظ���������jspҳ���жϣ�����֤��verify,
	// ���أ���֤�����/�û������������????
	// �һ�����********************************************************
	public boolean FindPassword(String type, String email, String password) {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = null;
			if (type.equals("0")) {
				sql = "update personal set password=? where email=?;"; ///// ����Ϊ0�������û�
			} else if (type.equals("1")) {
				sql = "update company set password=? where email=?;"; //// ����Ϊ1����ҵ�û�
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

	// ע��****************************************
	// ����һ���û�
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

	// �����û�
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

	// ��ҵ�û�
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

	//////////////////////////////// �����û�id��ɾ���û�
	// ɾ��һ���û�
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

	// �����û�
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

	// ��ҵ�û�
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
