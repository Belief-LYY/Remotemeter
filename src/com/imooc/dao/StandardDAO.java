package com.imooc.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;

import com.imooc.model.standard;
import DataBaseHelp.DBHelp;

public class StandardDAO {

	// 修改资费标准
	public boolean deletestandard() throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			stmt = conn.prepareStatement("truncate table standard;");
			reasult = stmt.execute();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return reasult;
	}

	public boolean updatestandard(standard g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = "insert into standard(threshold,price,type) VALUES(?,?,?);";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setFloat(1, g.getThreshold());
			ptmt.setFloat(2, g.getPrice());
			ptmt.setString(3, g.getType());

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

	public boolean history(standard g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = "insert into history(time,type,price) VALUES(CURRENT_TIMESTAMP(),?,?);";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setString(1, g.getType());
			ptmt.setFloat(2, g.getPrice());
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

	// 查询资费标准
	public ArrayList<standard> getstandard() {
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ArrayList<standard> list = new ArrayList<standard>();
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from standard;";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while (rs.next()) {
				standard istandard = new standard();
				istandard.setType(rs.getString("type"));
				istandard.setThreshold(rs.getFloat("threshold"));
				istandard.setPrice(rs.getFloat("price"));
				list.add(istandard);
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
		return list;

	}
}
