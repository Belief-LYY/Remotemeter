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
		// ������Ӧ��������
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

			// �������Ӷ���stmt������Statement\PreparedStatement����
			PreparedStatement stmt = null;

			// ��дSQL��ѯ���
			String sql;
			if (type.equals("0"))
				sql = "select * from personal where email='" + email + "';";
			else
				sql = "select * from company where email='" + email + "';";
			System.out.println("sql:" + sql);

			// �����ݿ�����ȡ�����Ա� // ִ�� SQL ��ѯ //ͨ�����Ӷ���stmt����sql��ѯ��䣬����ѯ������ص� ResultSet rs �������
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery(sql);

			// չ����������ݿ⣬����ѯ�����дΪjson�ַ���
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
					jsonStr = "��ȡ��֤��ʧ�ܣ����Ժ����ԣ�";
				}
			} else {
				jsonStr = "û������û���";
			}
			// �ر���������
			rs.close();
			stmt.close();
			// ���񲢴������------------
		} catch (SQLException e) {
			// TODO Auto-generated catch block// ���� JDBC ����
			e.printStackTrace();
		} catch (Exception e) {
			// ���� Class.forName ����
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
