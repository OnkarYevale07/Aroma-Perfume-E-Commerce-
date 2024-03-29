package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.User;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()){
			
			
			// coding area
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			// validations
			
			// authenticating user
			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByEmailAndPassword(email, password);
//			System.out.println(user);
			HttpSession httpSession = request.getSession();
			if(user == null) {
				httpSession.setAttribute("message", "Invalid Credentials !!");
				response.sendRedirect("login.jsp");
				return;
			}else {
				out.println("<h1>Welcome "+user.getUserName()+"</h1>");
				
				// login
				httpSession.setAttribute("current-user", user);
				if(user.getUserType().equals("admin")) {
					// admin:-admin.jsp
					response.sendRedirect("admin.jsp");
				}else if(user.getUserType().equals("normal")) {
					// normal:-normal.jsp
					response.sendRedirect("index.jsp");
				}else {
					out.println("We have not identified user type");
				}
				
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
