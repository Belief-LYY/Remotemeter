package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.imooc.dao.SchemeDAO;
import com.imooc.dao.meterDao;
import com.imooc.model.scheme;

/**
 * Servlet implementation class schemeServlet
 */
public class schemeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public schemeServlet() {
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
		response.setContentType("text/html;charset=UTF-8");

		String action = request.getParameter("action");
		if (action == null) {
			int sche = Integer.parseInt(request.getParameter("sche"));
			int rate = Integer.parseInt(request.getParameter("rate"));
			SchemeDAO ischemedao = new SchemeDAO();
			try {
				if (ischemedao.schemes(sche)) {
					// SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
					// Date start = null;
					// try {
					String start = request.getParameter("start");
					// } catch (ParseException e) {
					// // TODO Auto-generated catch block
					// e.printStackTrace();
					// }
					// Date end=null;
					// try {
					String end = request.getParameter("end");
					// } catch (ParseException e) {
					// // TODO Auto-generated catch block
					// e.printStackTrace();
					// }
					System.out.println("start:" + start);
					scheme ischeme = new scheme();
					ischeme.setSche(sche);
					ischeme.setRate(rate);
					try {
						String jsonStr = ischemedao.addscheme(ischeme, start, end);
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
				} else {
					String jsonStr = "false";
					PrintWriter out = null;
					Gson gson = new Gson();
					jsonStr = gson.toJson(jsonStr);
					System.out.println(jsonStr);
					out = response.getWriter();
					out.write(jsonStr);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (action.equals("delete")) {
			meterDao imeterdao = new meterDao();
			String data = "删除成功！";
			try {
				imeterdao.setsches("1");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				data = "删除失败！";
			}
			Gson gson = new Gson();
			response.getWriter().write(gson.toJson(data));
		} else if (action.equals("isdelete")) {
			SchemeDAO ischeme = new SchemeDAO();
			int sche = Integer.parseInt(request.getParameter("sche"));
			try {
				ischeme.updeletecheme(sche);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (action.equals("deletesche")) {
			SchemeDAO ischeme = new SchemeDAO();
			String data = "删除成功！";
			Gson gson = new Gson();
			try {
				if (!ischeme.deletescheme())
					data = "该方案正在使用！无法删除！";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.getWriter().write(gson.toJson(data));
		}
	}
}
