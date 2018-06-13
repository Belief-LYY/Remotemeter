package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DataBaseHelp.DBHelp;
import javamail.QQMailTest;

/**
 * Servlet implementation class verifyServlet
 */
public class verifysServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public verifysServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置响应内容类型
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		email = email.toLowerCase();
		String type = request.getParameter("type");
		String jsonStr = "";
		Gson gson = new Gson();
		String password = null;
		request.getSession().setAttribute("verify", null);
		System.out.println("email:" + email + " type:" + type);
		String verify;
		try {
			Connection conn = DBHelp.getConnection();

			// 创建连接对象stmt，创建Statement\PreparedStatement对象
			PreparedStatement stmt = null;

			// 编写SQL查询语句
			String sql;
			if (type.equals("0"))
				sql = "select * from personal where email='" + email + "';";
			else
				sql = "select * from company where email='" + email + "';";
			System.out.println("sql:" + sql);

			// 从数据库里面取东西对比 // 执行 SQL 查询 //通过连接对象stmt发送sql查询语句，将查询结果返回到 ResultSet rs ：结果集
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery(sql);

			// 展开结果集数据库，将查询结果编写为json字符串
			if (rs.next()) {
				password = rs.getString("password");
				jsonStr = "success";
				try {
					verify = QQMailTest.mail(email);
					request.getSession().setAttribute("verify", verify);
					System.out.println("verify:" + verify);
				} catch (MessagingException | GeneralSecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					jsonStr = "获取验证码失败，请稍后再试！";
				}
			} else {
				jsonStr = "没有这个用户！";
			}
			// 关闭所有连接
			rs.close();
			stmt.close();
			// 捕获并处理错误------------
		} catch (SQLException e) {
			// TODO Auto-generated catch block// 处理 JDBC 错误
			e.printStackTrace();
		} catch (Exception e) {
			// 处理 Class.forName 错误
			e.printStackTrace();
		}
		System.out.println(jsonStr + password);
		jsonStr = gson.toJson(jsonStr);
		out.write(jsonStr);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
