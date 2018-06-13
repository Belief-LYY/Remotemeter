package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.imooc.dao.MyaccountDAO;
import com.imooc.model.personal;
import com.imooc.model.company;

/**
 * Servlet implementation class RegisterServlet
 */
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userServlet() {
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

		int id = Integer.parseInt(request.getParameter("id"));
		String type = request.getParameter("type");
		String address = request.getParameter("address");
		String name = request.getParameter("name");
		String idcard = request.getParameter("idcard");
		String bankcard = request.getParameter("bankcard");
		String phone = request.getParameter("phone");
		String sex = request.getParameter("sex");
		String company = request.getParameter("company");
		try {
			PrintWriter out = null;
			MyaccountDAO iaccountdao = new MyaccountDAO();
			personal ipersonal = new personal();
			company icompany = new company();
			String jsonStr = "";
			if (type.equals("0")) {
				ipersonal.setAddress(address);
				ipersonal.setBankcard(bankcard);
				ipersonal.setId(id);
				ipersonal.setIdcard(idcard);
				ipersonal.setName(name);
				ipersonal.setPhone(phone);
				ipersonal.setSex(sex);
				ipersonal.setType(type);
				jsonStr = iaccountdao.updatepersonal(ipersonal);
			} else if (type.equals("1")) {
				icompany.setAddress(address);
				icompany.setBankcard(bankcard);
				icompany.setId(id);
				icompany.setIdcard(idcard);
				icompany.setName(name);
				icompany.setPhone(phone);
				icompany.setCompany(company);
				icompany.setType(type);
				jsonStr = iaccountdao.updatecompany(icompany);
			}
			Gson gson = new Gson();
			jsonStr = gson.toJson(jsonStr);
			System.out.println(jsonStr);
			out = response.getWriter();
			out.write(jsonStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
