package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class powerServlet
 */
public class powerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String action; // ��ʾ���Ķ��� ,add,show,delete

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public powerServlet() {
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
				request.getRequestDispatcher("../intendant/poweroff/index.jsp").forward(request, response);
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
			if (action.equals("metermodify")) // ������޸ĵ��
			{
				setmeterid(request, response);
				request.getRequestDispatcher("../intendant/profile/metermodify.jsp").forward(request, response);
			}
			if (action.equals("user")) // ����ǲ鿴�û�
			{
				setid(request, response);
				request.getRequestDispatcher("../intendant/profile/user.jsp").forward(request, response);
			}
			if (action.equals("usermodify")) // ������޸��û���Ϣ
			{
				setid(request, response);
				request.getRequestDispatcher("../intendant/profile/usermodify.jsp").forward(request, response);
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

}
