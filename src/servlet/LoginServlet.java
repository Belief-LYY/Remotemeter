package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.imooc.dao.AccountDAO;
import com.imooc.model.user;

public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String type = request.getParameter("type");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println("email:" + email + ";password:" + password);
		if (type.equals("0") || type.equals("1") || type.equals("2")) {
			email = email.toLowerCase();
			try {
				PrintWriter out = null;
				String jsonStr = "";
				Gson gson = new Gson();
				user iuser = new user();
				AccountDAO accountdao = new AccountDAO();
				iuser = accountdao.Login(type, email, password);
				request.getSession().setAttribute("id", iuser.getId());
				request.getSession().setAttribute("type", iuser.getType());
				request.getSession().setAttribute("email", iuser.getEmail());
				if (iuser.getEmail() != null && iuser.getName() == null)
					jsonStr = "无名";
				else
					jsonStr = iuser.getName();
				jsonStr = gson.toJson(jsonStr);
				System.out.println(jsonStr);
				out = response.getWriter();
				out.write(jsonStr);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if ("exit".equals(type)) {
			Object sessionUser = request.getSession().getAttribute("email");
			if (sessionUser != null) {
				request.getSession().setAttribute("id", null);
				request.getSession().setAttribute("email", null);
				request.getSession().setAttribute("type", null);
				System.out.println("退出成功！");
			} else {
				System.out.println("退出失败，用户已经退出登录！");
			}
			request.getRequestDispatcher("/account/index.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
