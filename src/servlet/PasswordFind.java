package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.imooc.dao.AccountDAO;
import com.imooc.dao.MyaccountDAO;

public class PasswordFind extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PasswordFind() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ������Ӧ��������
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		email = email.toLowerCase();
		String pass = request.getParameter("pass");
		String type = request.getParameter("type");
		String verifys = request.getParameter("verify");
		String verify = (String) request.getSession().getAttribute("verify");
		String jsonStr = "";
		Gson gson = new Gson();
		if (verify == null) {
			jsonStr = "���Ȼ�ȡ��֤�룡";
		} else {
			if (verify.equals(verifys)) {
				try {
					// չ����������ݿ⣬����ѯ�����дΪjson�ַ���
					MyaccountDAO myaccountdao = new MyaccountDAO();
					AccountDAO accountdao = new AccountDAO();
					if (myaccountdao.haveusers(email).equals("success")) {
						accountdao.FindPassword(type, email, pass);
						jsonStr = "�һ�����ɹ�������Ҫ������Ŷ~";
					} else {
						jsonStr = "���û������ڣ�";
					}
					// ���񲢴������------------
				} catch (Exception e) {
					// ���� Class.forName ����
					e.printStackTrace();
				}
			} else {
				jsonStr = "��֤�����";
			}
		}
		System.out.println(jsonStr);
		jsonStr = gson.toJson(jsonStr);
		out.write(jsonStr);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
