package com.imooc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.imooc.model.meter;
import com.imooc.model.reading;
import com.imooc.model.records;

import DataBaseHelp.DBHelp;

//电表的业务逻辑类
public class meterDao {

	// 根据区获得电表的信息
	public ArrayList<meter> getmetersbyprovince(String code_p) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<meter> list = new ArrayList<meter>(); // 电表集合
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from meter where code_a=any(select code_a from area where code_c=any(select code_c from city where code_p=?));"; // SQL语句，+where
																																					// .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, code_p);
			rs = stmt.executeQuery();
			while (rs.next()) {
				meter imeter = new meter();
				imeter.setMeter_id(rs.getString("meter_id"));
				imeter.setId(rs.getInt("id"));
				imeter.setTypen(rs.getInt("typen"));
				imeter.setSche(rs.getInt("sche"));
				imeter.setCode_a(rs.getString("code_a"));
				imeter.setState(rs.getString("state"));
				imeter.setBalance(rs.getFloat("balance"));
				imeter.setRemark(rs.getString("remark"));
				imeter.setIsdelete(rs.getInt("isdelete"));
				imeter.setSort(rs.getString("sort"));
				list.add(imeter);// 把一个电表加入集合
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

	// 根据市获得电表的信息
	public ArrayList<meter> getmetersbycity(String code_c) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<meter> list = new ArrayList<meter>(); // 电表集合
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from meter where code_a=any(select code_a from area where code_c=?);"; // SQL语句，+where
																											// .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, code_c);
			rs = stmt.executeQuery();
			while (rs.next()) {
				meter imeter = new meter();
				imeter.setMeter_id(rs.getString("meter_id"));
				imeter.setId(rs.getInt("id"));
				imeter.setTypen(rs.getInt("typen"));
				imeter.setSche(rs.getInt("sche"));
				imeter.setCode_a(rs.getString("code_a"));
				imeter.setState(rs.getString("state"));
				imeter.setBalance(rs.getFloat("balance"));
				imeter.setRemark(rs.getString("remark"));
				imeter.setIsdelete(rs.getInt("isdelete"));
				imeter.setSort(rs.getString("sort"));
				list.add(imeter);// 把一个电表加入集合
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

	// 根据区获得电表的信息
	public ArrayList<meter> getmetersbyarea(String code_a) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<meter> list = new ArrayList<meter>(); // 电表集合
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from meter where code_a=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, code_a);
			rs = stmt.executeQuery();
			while (rs.next()) {
				meter imeter = new meter();
				imeter.setMeter_id(rs.getString("meter_id"));
				imeter.setId(rs.getInt("id"));
				imeter.setTypen(rs.getInt("typen"));
				imeter.setSche(rs.getInt("sche"));
				imeter.setCode_a(rs.getString("code_a"));
				imeter.setState(rs.getString("state"));
				imeter.setBalance(rs.getFloat("balance"));
				imeter.setRemark(rs.getString("remark"));
				imeter.setIsdelete(rs.getInt("isdelete"));
				imeter.setSort(rs.getString("sort"));
				list.add(imeter);// 把一个电表加入集合
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

	// 根据用户ID获得电表的信息
	public ArrayList<meter> mymeters(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<meter> list = new ArrayList<meter>(); // 电表集合
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from meter where id=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				meter imeter = new meter();
				imeter.setMeter_id(rs.getString("meter_id"));
				imeter.setId(rs.getInt("id"));
				imeter.setTypen(rs.getInt("typen"));
				imeter.setSche(rs.getInt("sche"));
				imeter.setCode_a(rs.getString("code_a"));
				imeter.setState(rs.getString("state"));
				imeter.setBalance(rs.getFloat("balance"));
				imeter.setRemark(rs.getString("remark"));
				imeter.setIsdelete(rs.getInt("isdelete"));
				imeter.setSort(rs.getString("sort"));
				list.add(imeter);// 把一个电表加入集合
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

	// 根据电表编号获得电表的信息
	public ArrayList<meter> ismeters(String meter_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<meter> list = new ArrayList<meter>(); // 电表集合
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from meter where meter_id=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, meter_id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				meter imeter = new meter();
				imeter.setMeter_id(rs.getString("meter_id"));
				imeter.setId(rs.getInt("id"));
				imeter.setTypen(rs.getInt("typen"));
				imeter.setSche(rs.getInt("sche"));
				imeter.setCode_a(rs.getString("code_a"));
				imeter.setState(rs.getString("state"));
				imeter.setBalance(rs.getFloat("balance"));
				imeter.setRemark(rs.getString("remark"));
				imeter.setIsdelete(rs.getInt("isdelete"));
				imeter.setSort(rs.getString("sort"));
				list.add(imeter);// 把一个电表加入集合
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

	// 添加一个电表
	public String addmeter(meter g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "INSERT INTO meter(meter_id,id,typen,sche,code_a,state,balance,remark,isdelete,sort)"
					+ " VALUES(?,?,?,null,?,?,0,?,'0',?);";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setString(1, g.getMeter_id());
			ptmt.setInt(2, g.getId());
			ptmt.setInt(3, g.getTypen());
			ptmt.setString(4, g.getCode_a());
			ptmt.setString(5, g.getState());
			ptmt.setString(6, g.getRemark());
			ptmt.setString(7, g.getSort());

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

	// 修改一个电表
	public String updatemeter(meter g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "update meter set id=?,typen=?,sche=?,code_a=?,state=?,remark=? where meter_id=?;";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setInt(1, g.getId());
			ptmt.setInt(2, g.getTypen());
			ptmt.setInt(3, g.getSche());
			ptmt.setString(4, g.getCode_a());
			ptmt.setString(5, g.getState());
			ptmt.setString(6, g.getRemark());
			ptmt.setString(7, g.getMeter_id());

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

	// 删除一个电表
	public String deletemeter(String meter_id) throws SQLException {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "delete from meter where meter_id=?;";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, meter_id);
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

	// 删除多个电表 update meter and delete 首先标记要删除的电表，然后删除delmeters
	public String updeletemeter(String meter_id) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "update meter set isdelete=1-isdelete where meter_id='" + meter_id + "';";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
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

	public String upprotectmeter() throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "update meter set isdelete='0';";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
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

	public String deletemeters(String isdelete) throws SQLException {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "delete from meter where isdelete='" + isdelete + "';";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
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

	public String setsches(String isdelete) throws SQLException {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "update meter set sche=null where isdelete='" + isdelete + "';";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
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

	public String poweroff(String meter_id) throws SQLException {
		Connection conn = null;
		PreparedStatement ptmt = null;
		meterDao idao = new meterDao();
		String sql;
		try {
			conn = DBHelp.getConnection();
			if (idao.isstate(meter_id))
				sql = "update meter set state='断电' where meter_id='" + meter_id + "';";
			else
				sql = "update meter set state='通电' where meter_id='" + meter_id + "';";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);
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

	// 根据电表编号和时间段获得用电记录************************************************************************
	public ArrayList<reading> getreading(String meter_id, String start, String end) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<reading> list = new ArrayList<reading>();
		try {
			conn = DBHelp.getConnection();
			String sql = " select * from reading where meter_id='" + meter_id + "' and time BETWEEN '" + start
					+ "' AND '" + end + "' ORDER BY TIME;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				reading ireading = new reading();
				ireading.setMeter_id("meter_id");
				ireading.setTime(rs.getDate("time"));
				ireading.setReading(rs.getFloat("reading"));
				list.add(ireading);// 把一个电表加入集合
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

	// 添加用电记录*************************************************************************
	public String addreading(reading g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "INSERT INTO reading(record_r,meter_id,time,reading) VALUES(?,?,?,?);";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setInt(1, g.getRecord_r());
			ptmt.setString(2, g.getMeter_id());
			ptmt.setDate(3, (Date) g.getTime());
			ptmt.setFloat(4, g.getReading());

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

	// 根据电表编号和时间段获得缴费记录******************************************************
	public ArrayList<records> getrecords(String meter_id, Date start, Date end) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<records> list = new ArrayList<records>();
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from records where meter_id=? and time BETWEEN ? AND ? order by time;"; // SQL语句，+where
																											// .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, meter_id);
			stmt.setDate(2, start);
			stmt.setDate(3, end);
			rs = stmt.executeQuery();
			while (rs.next()) {
				records irecords = new records();
				irecords.setTime(rs.getDate("time"));
				irecords.setMoney(rs.getFloat("money"));
				irecords.setBalance(rs.getFloat("balance"));
				list.add(irecords);// 把一个电表加入集合
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

	// 添加缴费记录*************************************************************************
	public String addrecords(records g) throws Exception {
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBHelp.getConnection();
			String sql = "INSERT INTO records(record_p,meter_id,time,money,balance) VALUES(?,?,?,?,?);";
			System.out.println(sql);
			ptmt = conn.prepareStatement(sql);

			ptmt.setInt(1, g.getRecord_p());
			ptmt.setString(2, g.getMeter_id());
			ptmt.setDate(3, (Date) g.getTime());
			ptmt.setFloat(4, g.getMoney());
			ptmt.setFloat(4, g.getBalance());

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

	// 仅显示欠费电表********************************************************已有电表mymeters
	public static ArrayList<meter> Arrearsmeters(ArrayList<meter> mymeters) {
		ArrayList<meter> Arrearslist = new ArrayList<meter>();
		try {
			for (int i = 0; i < mymeters.size(); i++) {
				meter mymeter = mymeters.get(i);
				if (mymeter.getBalance() < 0)
					Arrearslist.add(mymeter);
			}
			return Arrearslist; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

	// 有没有这个电表
	public String havemeter(String meter_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String reasult = "false";
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from meter where meter_id=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, meter_id);
			rs = stmt.executeQuery();
			String typen = null;
			while (rs.next()) {
				typen = rs.getString("typen");
				reasult = "success";
			}
			System.out.println(typen);
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

	public String updatesche(String meter_id, int sche) {
		Connection conn = null;
		PreparedStatement stmt = null;
		boolean rs = false;
		String reasult = "success";
		try {
			conn = DBHelp.getConnection();
			String sql = "update meter set sche=? where meter_id=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, sche);
			stmt.setString(2, meter_id);
			rs = stmt.execute();
			if (rs) {
				reasult = "success";
			}
			return reasult;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
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

	public String usesche(String sche) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String reasult = "false";
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from meter where sche=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, sche);
			rs = stmt.executeQuery();
			String typen = null;
			while (rs.next()) {
				typen = rs.getString("typen");
				reasult = "success";
			}
			System.out.println(typen);
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

	public boolean isstate(String meter_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean reasult = false;
		String state;
		try {
			conn = DBHelp.getConnection();
			String sql = "select * from meter where meter_id=?;"; // SQL语句，+where .....
			System.out.println(sql);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, meter_id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				state = rs.getString("state");
				if (state.equals("通电"))
					reasult = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
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
		return reasult;
	}
}
