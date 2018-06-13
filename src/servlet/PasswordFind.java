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
		// 设置响应内容类型
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
			jsonStr = "请先获取验证码！";
		} else {
			if (verify.equals(verifys)) {
				try {
					// 展开结果集数据库，将查询结果编写为json字符串
					MyaccountDAO myaccountdao = new MyaccountDAO();
					AccountDAO accountdao = new AccountDAO();
					if (myaccountdao.haveusers(email).equals("success")) {
						accountdao.FindPassword(type, email, pass);
						jsonStr = "找回密码成功！，不要再忘了哦~";
					} else {
						jsonStr = "该用户不存在！";
					}
					// 捕获并处理错误------------
				} catch (Exception e) {
					// 处理 Class.forName 错误
					e.printStackTrace();
				}
			} else {
				jsonStr = "验证码错误！";
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
