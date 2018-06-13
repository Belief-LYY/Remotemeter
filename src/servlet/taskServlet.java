package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.imooc.dao.SchemeDAO;
import com.imooc.model.scheme;

/**
 * Servlet implementation class taskServlet
 */
public class taskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String action; // 表示电表的动作 ,add,show,delete

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public taskServlet() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 保证正确读取Post提交来的中文
		request.setCharacterEncoding("UTF-8");
		// 保证正确输出中文
		response.setContentType("text/html;charset=UTF-8");

		// System.out.println("meter_id="+request.getParameter("meter_id"));
		// System.out.println("id="+request.getParameter("id"));
		// System.out.println("action="+request.getParameter("action"));

		if (request.getParameter("action") != null) {
			action = request.getParameter("action");
			if (action.equals("新增")) // 如果是添加电表
			{
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			}
			if (action.equals("查询"))// 如果是查询电表
			{
				request.getRequestDispatcher("../intendant/task/index.jsp").forward(request, response);
			}
			if (action.equals("删除")) // 如果是删除电表
			{
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			}
			if (action.equals("meter")) // 如果是查看电表
			{
				setmeterid(request, response);
				request.getRequestDispatcher("../intendant/profile/meter.jsp").forward(request, response);
			}
			if (action.equals("sche")) // 如果是修改电表
			{
				setsche(request, response);
				request.getRequestDispatcher("../intendant/task/schmodify.jsp").forward(request, response);
			}
			if (action.equals("user")) // 如果是查看用户
			{
				setid(request, response);
				request.getRequestDispatcher("../intendant/profile/user.jsp").forward(request, response);
			}
			if (action.equals("schemodify")) // 如果是修改用户信息
			{
				int sche = Integer.parseInt(request.getParameter("sche"));
				int rate = Integer.parseInt(request.getParameter("rate"));
				String start = request.getParameter("start");
				String end = request.getParameter("end");
				System.out.println("start:" + start);
				SchemeDAO ischemedao = new SchemeDAO();
				scheme ischeme = new scheme();
				ischeme.setRate(rate);
				ischeme.setSche(sche);
				try {
					String jsonStr = "false";
					jsonStr = ischemedao.updatescheme(ischeme, start, end);
					PrintWriter out = null;
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
			if (action.equals("usermeter")) // 如果是查看他的电表
			{
				setid(request, response);
				request.getRequestDispatcher("../intendant/profile/usermeter.jsp").forward(request, response);
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

	private boolean setsche(HttpServletRequest request, HttpServletResponse response) {
		String sche = request.getParameter("sche");
		request.getSession().setAttribute("sche", sche);
		return true;
	}

}
