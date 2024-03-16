package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProductDao;
import com.helper.FactoryProvider;

public class deleteServlet extends HttpServlet {
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pId = Integer.parseInt(request.getParameter("pId"));
		HttpSession httpSession = request.getSession();
		try {
			ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
			boolean f = pDao.deleteProductById(pId);
			if(f) {
				httpSession.setAttribute("message", "Product Deleted Successfully !!");
				response.sendRedirect("products.jsp");
				return;
			}else {
				httpSession.setAttribute("message", "Something wrong on server !!");
				response.sendRedirect("products.jsp");
				return;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

}
