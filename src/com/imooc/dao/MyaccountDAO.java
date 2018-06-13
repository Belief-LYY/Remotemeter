package com.imooc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.imooc.model.personal;
import com.imooc.model.records;
import com.imooc.model.user;
import com.imooc.model.company;
import com.imooc.model.meter;
import DataBaseHelp.DBHelp;
import com.imooc.dao.meterDao;

//我的账户逻辑类
public class MyaccountDAO {

	// 根据用户ID获取用户type*****************************************
	public String getusertypebyid(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "select type from user where id=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			String type = null;
			while (rs.next()) {
				type = rs.getString("type");
			}
			return type;
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

	// 根据用户ID获得个人信息************************************************
	public ArrayList<personal> personalinfo(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<personal> list = new ArrayList<personal>();
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from personal where id=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				personal ipersonal = new personal();
				ipersonal.setId(rs.getInt("id"));
				ipersonal.setType(rs.getString("type"));
				ipersonal.setName(rs.getString("name"));
				ipersonal.setSex(rs.getString("sex"));
				ipersonal.setPhone(rs.getString("phone"));
				ipersonal.setEmail(rs.getString("email"));
				ipersonal.setAddress(rs.getString("address"));
				ipersonal.setBankcard(rs.getString("bankcard"));
				ipersonal.setIdcard(rs.getString("idcard"));
				ipersonal.setPassword(rs.getString("password"));
				list.add(ipersonal);
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

	// 根据用户ID获得企业信息************************************************
	public ArrayList<company> companyinfo(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<company> list = new ArrayList<company>();
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from company where id=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				company icompany = new company();
				icompany.setId(rs.getInt("id"));
				icompany.setType(rs.getString("type"));
				icompany.setCompany(rs.getString("company"));
				icompany.setAddress(rs.getString("address"));
				icompany.setPhone(rs.getString("phone"));
				icompany.setEmail(rs.getString("email"));
				icompany.setBankcard(rs.getString("bankcard"));
				icompany.setName(rs.getString("name"));
				icompany.setIdcard(rs.getString("idcard"));
				icompany.setPassword(rs.getString("password"));
				list.add(icompany);
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

	// 修改用户信息
	public String updateuser(user g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "update user set type=? where id=?;";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setString(1, g.getType());
			ptmt.setInt(2, g.getId());

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

	// 修改个人信息*********************************************************
	public String updatepersonal(personal g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "update personal set name=?,sex=?,phone=?,address=?,bankcard=?,idcard=? where id=?;";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setString(1, g.getName());
			ptmt.setString(2, g.getSex());
			ptmt.setString(3, g.getPhone());
			ptmt.setString(4, g.getAddress());
			ptmt.setString(5, g.getBankcard());
			ptmt.setString(6, g.getIdcard());
			ptmt.setInt(7, g.getId());

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

	// 修改企业信息*********************************************************
	public String updatecompany(company g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "update company set company=?,address=?,phone=?,bankcard=?,name=?,idcard=? where id=?;";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setString(1, g.getCompany());
			ptmt.setString(2, g.getAddress());
			ptmt.setString(3, g.getPhone());
			ptmt.setString(4, g.getBankcard());
			ptmt.setString(5, g.getName());
			ptmt.setString(6, g.getIdcard());
			ptmt.setInt(7, g.getId());

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

	// 根据id获取所有缴费记录
	public ArrayList<records> getrecordsbyid(int id) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<records> list = new ArrayList<records>();
		ArrayList<meter> listmeter = new ArrayList<meter>();
		meterDao imeterdao = new meterDao();
		listmeter = imeterdao.mymeters(id);
		for (int i = 0; i < listmeter.size(); i++) {
			meter meter = listmeter.get(i);
			String meter_id = meter.getMeter_id();
			conn = DBHelp.getConnection();
			String sql = "select * from records where meter_id=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, meter_id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				records irecords = new records();
				irecords.setMeter_id(rs.getString("meter_id"));
				irecords.setTime(rs.getDate("time"));
				irecords.setMoney(rs.getFloat("money"));
				irecords.setBalance(rs.getFloat("balance"));
				list.add(irecords);
			}
		}
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
		return list; // 返回集合。
	}

	// 有没有这个用户
	public String haveuser(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String reasult = "false";
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from user where id=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			String type = null;
			while (rs.next()) {
				type = rs.getString("type");
				reasult = "success";
			}
			System.out.println(type);
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

	// 有没有这个用户
	public String haveusers(String email) {
		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ResultSet rss = null;
		String reasult = "false";
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from personal where email=?;"; // SQL语句，+where .....
			String sqls = "select * from company where email=?;"; // SQL语句，+where .....
			System.out.println(sql);
			System.out.println(sqls);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			ptmt = conn.prepareStatement(sqls);
			ptmt.setString(1, email);
			rs = stmt.executeQuery();
			rss = ptmt.executeQuery();
			String type = null;
			while (rs.next()) {
				type = rs.getString("type");
				reasult = "success";
			}
			while (rss.next()) {
				type = rss.getString("type");
				reasult = "success";
			}
			System.out.println(type);
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
					rss.close();
					rss = null;
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
