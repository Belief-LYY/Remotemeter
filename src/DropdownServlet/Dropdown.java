package DropdownServlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.imooc.dao.DropdownDAO;

public class Dropdown extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setCharacterEncoding("UTF-8");// 防止出现中文乱码现象
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String code = request.getParameter("code");
		String grade = request.getParameter("grade");
		System.out.println("grade=" + grade);
		System.out.println("code=" + code);
		String json = "";
		ArrayList<?> rsList = new ArrayList<Object>();
		Gson gson = new Gson();
		try {
			if (grade.equals("province"))
				rsList = DropdownDAO.getprovince();
			else if (grade.equals("city"))
				rsList = DropdownDAO.getcity(code);
			else if (grade.equals("area"))
				rsList = DropdownDAO.getarea(code);
			json = gson.toJson(rsList);
			System.out.println("json=" + json);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");// 防止出现中文乱码现象
		//response.getWriter().print(json);
		response.getWriter().write(json);
	}
}
