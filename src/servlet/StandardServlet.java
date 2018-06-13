package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imooc.model.standard;
import com.imooc.dao.StandardDAO;

/**
 * Servlet implementation class StandardServlet
 */
public class StandardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StandardServlet() {
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
		standard g1 = new standard();
		standard g2 = new standard();
		StandardDAO istandarddao = new StandardDAO();
		g1.setType("1");
		g1.setThreshold(Float.parseFloat(request.getParameter("thresholdc")));
		g1.setPrice(Float.parseFloat(request.getParameter("pricec")));
		g2.setType("0");
		g2.setThreshold(Float.parseFloat(request.getParameter("thresholdp")));
		g2.setPrice(Float.parseFloat(request.getParameter("pricep")));
		try {
			istandarddao.deletestandard();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			istandarddao.updatestandard(g1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			istandarddao.updatestandard(g2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/intendant/standard/success.jsp").forward(request, response);
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
