package com.imooc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import DataBaseHelp.DBHelp;

public class DropdownDAO {

	// 获得省
	@SuppressWarnings("rawtypes")
	public static ArrayList<Map> getprovince() throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		ArrayList<Map> rsList = new ArrayList<Map>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from province;";
		System.out.println(sql);
		try {
			conn = DBHelp.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				map = new HashMap<String, String>();
				map.put("code", rs.getString("code_p"));
				map.put("name", rs.getString("name"));
				rsList.add(map);
			}
			return rsList;
		} catch (Exception e) {
			System.out.println("----获得省的方法出现异常:" + e);
			e.printStackTrace();
			return null;
		} finally {
		}
	}

	// 根据省编号获得市
	@SuppressWarnings("rawtypes")
	public static ArrayList<Map> getcity(String code_p) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		ArrayList<Map> rsList = new ArrayList<Map>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from city where code_p=" + code_p + ";";
		System.out.println(sql);
		try {
			conn = DBHelp.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				map = new HashMap<String, String>();
				map.put("code", rs.getString("code_c"));
				map.put("name", rs.getString("name"));
				rsList.add(map);
			}
			return rsList;
		} catch (Exception e) {
			System.out.println("----获得市的方法出现异常:" + e);
			e.printStackTrace();
			return null;
		} finally {
		}
	}

	// 根据市编号获得区
	@SuppressWarnings("rawtypes")
	public static ArrayList<Map> getarea(String code_c) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		ArrayList<Map> rsList = new ArrayList<Map>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from area where code_c=" + code_c + ";";
		System.out.println(sql);
		try {
			conn = DBHelp.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				map = new HashMap<String, String>();
				map.put("code", rs.getString("code_a"));
				map.put("name", rs.getString("name"));
				rsList.add(map);
			}
			return rsList;
		} catch (Exception e) {
			System.out.println("----获得区的方法出现异常:" + e);
			e.printStackTrace();
			return null;
		} finally {
		}
	}
}
