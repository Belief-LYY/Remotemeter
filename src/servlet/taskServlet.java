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

	private String action; // ��ʾ���Ķ��� ,add,show,delete

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
		// ��֤��ȷ��ȡPost�ύ��������
		request.setCharacterEncoding("UTF-8");
		// ��֤��ȷ�������
		response.setContentType("text/html;charset=UTF-8");

		// System.out.println("meter_id="+request.getParameter("meter_id"));
		// System.out.println("id="+request.getParameter("id"));
		// System.out.println("action="+request.getParameter("action"));

		if (request.getParameter("action") != null) {
			action = request.getParameter("action");
			if (action.equals("����")) // �������ӵ��
			{
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			}
			if (action.equals("��ѯ"))// ����ǲ�ѯ���
			{
				request.getRequestDispatcher("../intendant/task/index.jsp").forward(request, response);
			}
			if (action.equals("ɾ��")) // �����ɾ�����
			{
				request.getRequestDispatcher("/success.jsp").forward(request, response);
			}
			if (action.equals("meter")) // ����ǲ鿴���
			{
				setmeterid(request, response);
				request.getRequestDispatcher("../intendant/profile/meter.jsp").forward(request, response);
			}
			if (action.equals("sche")) // ������޸ĵ��
			{
				setsche(request, response);
				request.getRequestDispatcher("../intendant/task/schmodify.jsp").forward(request, response);
			}
			if (action.equals("user")) // ����ǲ鿴�û�
			{
				setid(request, response);
				request.getRequestDispatcher("../intendant/profile/user.jsp").forward(request, response);
			}
			if (action.equals("schemodify")) // ������޸��û���Ϣ
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
			if (action.equals("usermeter")) // ����ǲ鿴���ĵ��
			{
				setid(request, response);
				request.getRequestDispatcher("../intendant/profile/usermeter.jsp").forward(request, response);
			}
		}
	}

	// �鿴���ķ���
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
