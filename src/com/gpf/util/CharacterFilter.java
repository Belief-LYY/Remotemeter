package com.gpf.util;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.apache.commons.lang.StringUtils;

/**
 * SelfDefineInvalidCharacterFilter������request�����еķǷ��ַ�����ֹ�ű�����
 */
public class CharacterFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		String parameterName = null;
		String parameterValue = null;
		// ��ȡ����Ĳ���
		Enumeration<String> allParameter = request.getParameterNames();
		while (allParameter.hasMoreElements()) {
			parameterName = allParameter.nextElement();
			parameterValue = request.getParameter(parameterName);
			if (null != parameterValue) {
				for (String str : invalidCharacter) {
					if (StringUtils.containsIgnoreCase(parameterValue, str)) {
						request.setAttribute("errorMessage", "�Ƿ��ַ���" + str);
						RequestDispatcher requestDispatcher = request
								.getRequestDispatcher("/Remotemeter/account/index.jsp?action=fiter");
						requestDispatcher.forward(request, response);
						return;
					}
				}
			}
		}
		filterChain.doFilter(request, response); // ִ��Ŀ����Դ������
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}

	// ��Ҫ���˵ķǷ��ַ�
	private static String[] invalidCharacter = new String[] { "script", "select", "insert", "document", "window",
			"function", "delete", "update", "prompt", "alert", "create", "alter", "drop", "iframe", "link", "where",
			"replace", "function", "onabort", "onactivate", "onafterprint", "onafterupdate", "onbeforeactivate",
			"onbeforecopy", "onbeforecut", "onbeforedeactivateonfocus", "onkeydown", "onkeypress", "onkeyup", "onload",
			"expression", "applet", "layer", "ilayeditfocus", "onbeforepaste", "onbeforeprint", "onbeforeunload",
			"onbeforeupdate", "onblur", "onbounce", "oncellchange", "oncontextmenu", "oncontrolselect", "oncopy",
			"oncut", "ondataavailable", "ondatasetchanged", "ondatasetcomplete", "ondeactivate", "ondrag", "ondrop",
			"onerror", "onfilterchange", "onfinish", "onhelp", "onlayoutcomplete", "onlosecapture", "onmouse", "ote",
			"onpropertychange", "onreadystatechange", "onreset", "onresize", "onresizeend", "onresizestart", "onrow",
			"onscroll", "onselect", "onstaronsubmit", "onunload", "IMgsrc", "infarction" };

}