package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.imooc.dao.MyaccountDAO;

import javamail.QQMailTest;

/**
 * Servlet implementation class verifyServlet
 */
public class verifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public verifyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String jsonStr = "";
		Gson gson = new Gson();
		MyaccountDAO myaccountdao = new MyaccountDAO();
		// TODO Auto-generated method stub
		request.getSession().setAttribute("emailhhh", null);
		request.getSession().setAttribute("verify", null);
		String email = request.getParameter("email");
		email = email.toLowerCase();
		String type = request.getParameter("type");
		System.out.println("email:" + email + " type:" + type);
		String verify;
		if (!myaccountdao.haveusers(email).equals("success")) {
			try {
				verify = QQMailTest.mail(email);
				request.getSession().setAttribute("emailhhh", email);
				request.getSession().setAttribute("verify", verify);
				System.out.println("verify:" + verify);
				jsonStr = "获取验证码成功！";
			} catch (MessagingException | GeneralSecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				jsonStr = "获取验证码失败，请稍后再试！";
			}
		} else {
			jsonStr = "该邮箱已注册！";
		}
		System.out.println(jsonStr);
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
