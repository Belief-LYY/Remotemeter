package com.imooc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.imooc.model.scheme;

import DataBaseHelp.DBHelp;

public class SchemeDAO {

	// 查询采集方案
	public ArrayList<scheme> getscheme() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<scheme> list = new ArrayList<scheme>();
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from scheme;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				scheme ischeme = new scheme();
				ischeme.setSche(rs.getInt("sche"));
				ischeme.setRate(rs.getInt("rate"));
				ischeme.setStart(rs.getDate("start"));
				ischeme.setEnd(rs.getDate("end"));
				list.add(ischeme);
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}

	public ArrayList<scheme> getsche(int sche) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<scheme> list = new ArrayList<scheme>();
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from scheme where sche=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, sche);
			rs = stmt.executeQuery();
			while (rs.next()) {
				scheme ischeme = new scheme();
				ischeme.setSche(rs.getInt("sche"));
				ischeme.setRate(rs.getInt("rate"));
				ischeme.setStart(rs.getDate("start"));
				ischeme.setEnd(rs.getDate("end"));
				list.add(ischeme);
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}

	// 新增采集方案
	public String addscheme(scheme g, String start, String end) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql;
			if (end != null && !end.equals("")) {
				sql = "INSERT INTO scheme(sche,rate,start,end,isdelete) VALUES(?,?,?,?,'0');";
				ptmt = conn.prepareStatement(sql);

				ptmt.setInt(1, g.getSche());
				ptmt.setInt(2, g.getRate());
				ptmt.setString(3, start);
				ptmt.setString(4, end);
			} else {
				sql = "INSERT INTO scheme(sche,rate,start,isdelete) VALUES(?,?,?,'0');";
				ptmt = conn.prepareStatement(sql);

				ptmt.setInt(1, g.getSche());
				ptmt.setInt(2, g.getRate());
				ptmt.setString(3, start);
			}
			System.out.println(sql);
			ptmt.execute();
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
		return "success";
	}

	// 修改采集方案
	public String updatescheme(scheme g, String start, String end) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql;
			if (end != null && !end.equals("")) {
				sql = "update scheme set rate=?,start=?,end=? where sche=?;";
				ptmt = conn.prepareStatement(sql);
				ptmt.setInt(1, g.getRate());
				ptmt.setString(2, start);
				ptmt.setString(3, end);
				ptmt.setInt(4, g.getSche());
			} else {
				sql = "update scheme set rate=?,start=?,end=null where sche=?;";
				ptmt = conn.prepareStatement(sql);
				ptmt.setInt(1, g.getRate());
				ptmt.setString(2, start);
				ptmt.setInt(3, g.getSche());
			}
			System.out.println(sql);
			ptmt.execute();
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
		return "success";
	}

	// 删除采集方案
	public boolean updeletecheme(int sche) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = "update scheme set  isdelete=1-isdelete  where sche=" + sche + ";";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
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

	public boolean protectscheme() throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = false;
		try {
			conn = DBHelp.getConnection();
			String sql = "update scheme set isdelete='0'";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
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

	public boolean deletescheme() throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		boolean reasult = true;
		try {
			conn = DBHelp.getConnection();
			String sql = "delete from scheme where isdelete='1';";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
			ptmt.execute();
		} catch (Exception ex) {
			ex.printStackTrace();
			reasult = false;
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

	public boolean schemes(int sche) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		boolean reasult = true;
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from scheme where sche=?;";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setInt(1, sche);

			rs = ptmt.executeQuery();
			if (rs.next()) {
				reasult = false;
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
		return reasult;
	}

	// 有没有这个方案
	public String havesche(int sche) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String reasult = "false";
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from scheme where sche=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, sche);
			rs = stmt.executeQuery();
			int rate = 0;
			while (rs.next()) {
				rate = rs.getInt("rate");
				reasult = "success";
			}
			System.out.println(rate);
			return reasult;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}

}
