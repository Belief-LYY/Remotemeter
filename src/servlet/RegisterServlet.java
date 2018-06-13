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
import com.imooc.model.user;
import com.imooc.model.personal;
import com.imooc.model.company;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// 保证正确读取Post提交来的中文
		request.setCharacterEncoding("UTF-8");
		// 保证正确输出中文
		response.setContentType("text/html;charset=UTF-8");

		String email = request.getParameter("email");
		email = email.toLowerCase();
		String pass = request.getParameter("pass");
		String type = request.getParameter("type");
		String verifys = request.getParameter("verify");
		String verify = (String) request.getSession().getAttribute("verify");
		String emailhhh = (String) request.getSession().getAttribute("emailhhh");
		System.out.println(verify);
		PrintWriter out = null;
		AccountDAO accountdao = new AccountDAO();
		MyaccountDAO myaccountdao = new MyaccountDAO();
		user iuser = new user();
		personal ipersonal = new personal();
		company icompany = new company();
		String jsonStr = "";
		if (verify != null) {
			if (!myaccountdao.haveusers(email).equals("success")) {
				if (verify.equals(verifys)) {
					if (email.equals(emailhhh)) {
						try {
							int id = (int) (10000 + Math.random() * (1000000 - 10000 + 1));
							if (type.equals("0")) {
								iuser.setType("0");
								iuser.setId(id);
								ipersonal.setEmail(email);
								ipersonal.setPassword(pass);
								ipersonal.setId(id);
								ipersonal.setType("0");
								accountdao.adduser(iuser);
								accountdao.addpersonal(ipersonal);
								jsonStr = "注册成功！立即登录？";
							} else if (type.equals("1")) {
								iuser.setType("1");
								iuser.setId(id);
								icompany.setEmail(email);
								icompany.setPassword(pass);
								icompany.setId(id);
								icompany.setType("1");
								accountdao.adduser(iuser);
								accountdao.addcompany(icompany);
								jsonStr = "注册成功！立即登录？";
							}
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					} else {
						jsonStr = "should";
					}
				} else {
					jsonStr = "false";
				}
			} else {
				jsonStr = "had";
			}
		} else {
			jsonStr = "havent";
		}
		Gson gson = new Gson();
		jsonStr = gson.toJson(jsonStr);
		System.out.println(jsonStr);
		out = response.getWriter();
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
