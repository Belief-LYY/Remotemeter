package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.imooc.dao.MyaccountDAO;
import com.imooc.dao.SchemeDAO;
import com.imooc.dao.meterDao;
import com.imooc.model.company;
import com.imooc.model.meter;
import com.imooc.model.personal;
import com.imooc.model.reading;
import com.imooc.model.user;

/**
 * Servlet implementation class DatabaseAccess
 */
public class MeterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String action; // 表示电表的动作 ,add,show,delete
	private meterDao imeterdao = new meterDao();

	public MeterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 **
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response) This method is called when a form has its tag value method
	 *      equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 保证正确读取Post提交来的中文
		request.setCharacterEncoding("UTF-8");
		// 保证正确输出中文
		response.setContentType("text/html;charset=UTF-8");

		// System.out.println("meter_id="+request.getParameter("meter_id"));
		// System.out.println("id="+request.getParameter("id"));
		// System.out.println("action="+request.getParameter("action"));

		if (request.getParameter("action") != null) {
			action = request.getParameter("action");
			System.out.println("meter_id:************");
			if (action.equals("addmeter")) // 如果是添加电表
			{
				String sort = request.getParameter("sort");
				String remark = request.getParameter("remark");
				String state = request.getParameter("state");
				if (state.equals("0"))
					state = "通电";
				else
					state = "断电";
				String area = request.getParameter("area");
				String meter_id = request.getParameter("meter_id");
				int id = Integer.parseInt(request.getParameter("id"));
				int typen = Integer.parseInt(request.getParameter("typen"));
				System.out.println("meter_id:" + meter_id);
				meterDao imeterdao = new meterDao();
				meter imeter = new meter();
				imeter.setSort(sort);
				imeter.setRemark(remark);
				imeter.setState(state);
				imeter.setCode_a(area);
				imeter.setMeter_id(meter_id);
				imeter.setId(id);
				imeter.setTypen(typen);
				String jsonStr = "false";
				MyaccountDAO idao = new MyaccountDAO();
				if (imeterdao.havemeter(meter_id).equals("success")) {
					jsonStr = "电表编号已存在，请检查！";
				} else if (idao.haveuser(id).equals("false")) {
					jsonStr = "没有这个用户！";
				} else {
					try {
						jsonStr = imeterdao.addmeter(imeter);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				PrintWriter out = null;
				Gson gson = new Gson();
				jsonStr = gson.toJson(jsonStr);
				System.out.println(jsonStr);
				out = response.getWriter();
				out.write(jsonStr);
			}
			if (action.equals("查询"))// 如果是查询电表
			{
				request.getRequestDispatcher("../intendant/profile/index.jsp").forward(request, response);
			}
			if (action.equals("查看账单")) {
				request.getRequestDispatcher("../user/bill/index.jsp").forward(request, response);
			}
			if (action.equals("delete")) // 如果是删除电表
			{
				String data = "删除成功！";
				try {
					imeterdao.deletemeters("1");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					data = "删除失败！";
				}
				Gson gson = new Gson();
				response.getWriter().write(gson.toJson(data));
			}
			if (action.equals("meter")) // 如果是查看电表
			{
				setmeterid(request, response);
				request.getRequestDispatcher("../intendant/profile/meter.jsp").forward(request, response);
			}
			if (action.equals("metermodify")) // 如果是修改电表
			{
				setmeterid(request, response);
				String remark = request.getParameter("remark");
				String state = request.getParameter("state");
				if (state.equals("0"))
					state = "通电";
				else
					state = "断电";
				String area = request.getParameter("area");
				String meter_id = request.getParameter("meter_id");
				int id = Integer.parseInt(request.getParameter("id"));
				int typen = Integer.parseInt(request.getParameter("typen"));
				int sche = Integer.parseInt(request.getParameter("sche"));
				System.out.println("meter_id:" + meter_id);
				meterDao imeterdao = new meterDao();
				meter imeter = new meter();
				imeter.setRemark(remark);
				imeter.setState(state);
				imeter.setCode_a(area);
				imeter.setSche(sche);
				imeter.setMeter_id(meter_id);
				imeter.setId(id);
				imeter.setTypen(typen);
				String jsonStr = "false";
				MyaccountDAO idao = new MyaccountDAO();
				SchemeDAO ische = new SchemeDAO();
				if (ische.havesche(sche).equals("false")) {
					jsonStr = "没有这个方案！";
				} else if (idao.haveuser(id).equals("false")) {
					jsonStr = "没有这个用户！";
				} else {
					try {
						jsonStr = imeterdao.updatemeter(imeter);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				PrintWriter out = null;
				Gson gson = new Gson();
				jsonStr = gson.toJson(jsonStr);
				System.out.println(jsonStr);
				out = response.getWriter();
				out.write(jsonStr);
			}
			if (action.equals("modifymeter")) {
				setid(request, response);
				request.getRequestDispatcher("../intendant/profile/metermodify.jsp").forward(request, response);
			}
			if (action.equals("user")) // 如果是查看用户
			{
				setid(request, response);
				request.getRequestDispatcher("../intendant/profile/user.jsp").forward(request, response);
			}
			if (action.equals("modifyuser")) // 如果是查看用户
			{
				setid(request, response);
				request.getRequestDispatcher("../intendant/profile/usermodify.jsp").forward(request, response);
			}
			if (action.equals("poweroff")) // 如果是远程关闭电表
			{
				String meter_id = request.getParameter("meter_id");
				try {
					imeterdao.poweroff(meter_id);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (action.equals("usermodify")) // 如果是修改用户信息
			{
				setid(request, response);
				String sex;
				String company;
				int id = Integer.parseInt(request.getParameter("id"));
				String type = request.getParameter("type");
				String email = request.getParameter("email");
				String name = request.getParameter("name");
				String idcard = request.getParameter("idcard");
				String phone = request.getParameter("phone");
				String address = request.getParameter("address");
				String bankcard = request.getParameter("bankcard");
				MyaccountDAO idao = new MyaccountDAO();
				if (type.equals("0")) {
					sex = request.getParameter("sex");
					personal ipersonal = new personal();
					user iuser = new user();
					ipersonal.setId(id);
					ipersonal.setType(type);
					ipersonal.setEmail(email);
					ipersonal.setName(name);
					ipersonal.setIdcard(idcard);
					ipersonal.setPhone(phone);
					ipersonal.setAddress(address);
					ipersonal.setBankcard(bankcard);
					ipersonal.setSex(sex);
					iuser.setType(type);
					iuser.setId(id);
					String jsonStr = "false";
					try {
						idao.updateuser(iuser);
						jsonStr = idao.updatepersonal(ipersonal);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					PrintWriter out = null;
					Gson gson = new Gson();
					jsonStr = gson.toJson(jsonStr);
					System.out.println(jsonStr);
					out = response.getWriter();
					out.write(jsonStr);
				} else {
					company = request.getParameter("company");
					company icompany = new company();
					user iuser = new user();
					icompany.setId(id);
					icompany.setType(type);
					icompany.setEmail(email);
					icompany.setName(name);
					icompany.setIdcard(idcard);
					icompany.setPhone(phone);
					icompany.setAddress(address);
					icompany.setBankcard(bankcard);
					icompany.setCompany(company);
					iuser.setType(type);
					iuser.setId(id);
					String jsonStr = "false";
					try {
						idao.updateuser(iuser);
						jsonStr = idao.updatecompany(icompany);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					PrintWriter out = null;
					Gson gson = new Gson();
					jsonStr = gson.toJson(jsonStr);
					System.out.println(jsonStr);
					out = response.getWriter();
					out.write(jsonStr);
				}
				System.out.println("id:" + id);
			}
			if (action.equals("usermeter")) // 如果是查看他的电表
			{
				setid(request, response);
				request.getRequestDispatcher("../intendant/profile/usermeter.jsp").forward(request, response);
			}
			if (action.equals("addsche")) {
				int sche = Integer.parseInt(request.getParameter("sche"));
				String meter_id = request.getParameter("meter_id");
				String jsonStr = "false";
				SchemeDAO ische = new SchemeDAO();
				if (ische.havesche(sche).equals("false")) {
					jsonStr = "没有这个方案！";
				} else if (imeterdao.havemeter(meter_id).equals("false")) {
					jsonStr = "没有这个电表！";
				} else {
					jsonStr = imeterdao.updatesche(meter_id, sche);
				}
				PrintWriter out = null;
				Gson gson = new Gson();
				jsonStr = gson.toJson(jsonStr);
				System.out.println(jsonStr);
				out = response.getWriter();
				out.write(jsonStr);
			}
			if (action.equals("isdelete")) {
				String meter_id = request.getParameter("meter_id");
				try {
					imeterdao.updeletemeter(meter_id);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (action.equals("analysis")) {
				String meter_id = request.getParameter("meter_id");
				int year1 = Integer.parseInt(request.getParameter("year1"));
				int year2 = Integer.parseInt(request.getParameter("year2"));
				int month1 = Integer.parseInt(request.getParameter("month1"));
				int month2 = Integer.parseInt(request.getParameter("month2"));
				System.out.println("year1" + year1 + "year2" + year2 + "month1" + month1 + "month2" + month2);
				float[] data = new float[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
				for (int year = year1, j = 0; year <= year2 && j < (year2 - year1) * 12 + month2 - month1 + 1; year++) {
					for (int month = month1; ((month <= month2 && year == year2) || year < year2)
							&& j < (year2 - year1) * 12 + month2 - month1 + 1; month++) {
						String start = year + "-" + month + "-01 00:00:00";
						String end = year + "-" + month + "-31 23:59:59";
						ArrayList<reading> lists = null;
						meterDao meterdao = new meterDao();
						lists = meterdao.getreading(meter_id, start, end);
						float use = 0;
						if (lists != null && lists.size() > 0) {
							for (int i = 0; i < lists.size(); i++) {
								reading ireading = lists.get(i);
								if (i == 0) {
									use -= ireading.getReading();
								}
								if (i == lists.size() - 1) {
									use += ireading.getReading();
								}
							}
						}
						data[j] = use;
						if (month == 12)
							month = 0;
						j++;
					}
				}
				Gson gson = new Gson();
				response.getWriter().write(gson.toJson(data));
			}
		}
	}

	// 查看电表的方法
	private boolean setmeterid(HttpServletRequest request, HttpServletResponse response) {
		String meter_id = request.getParameter("meter_id");
		request.getSession().setAttribute("meter_id", meter_id);
		return true;
	}

	private boolean setid(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		request.getSession().setAttribute("id", id);
		return true;
	}

}
