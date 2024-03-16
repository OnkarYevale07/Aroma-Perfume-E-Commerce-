package com.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			
			String op = request.getParameter("operation");
			if(op.trim().equals("addcategory")) {
				// add category
				// fetch category data
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");
				
				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);
				
				// category database save:
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);	
//				out.println("Category Saved");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Category added successfully !!");
				response.sendRedirect("admin.jsp");
				return;
			}else if(op.trim().equals("addproduct")) {
				// add product 
				String pName = request.getParameter("pName");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				String pDesc = request.getParameter("pDesc");
//				Part part = request.getPart("pPhoto");
				String pUrl = request.getParameter("pPhoto");
				
				Product p = new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
//				p.setpPhoto(part.getSubmittedFileName());
				p.setpPhoto(pUrl);
				
				// get category by id
				CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
				Category category = cDao.getCategoryById(catId);
				p.setCategory(category);
				
				// product save
				ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
				pDao.saveProduct(p);
				
				
//				// pic upload
////				find out the path to upload photo
//				String path = request.getRealPath("products")+File.separator+"products"+File.separator+part.getSubmittedFileName();
//				System.out.println(path);
//				
//				// uploading code...
//				try {
//					FileOutputStream fos = new FileOutputStream(path);
//					InputStream is = part.getInputStream();
//					
//					// reading data
//					byte []data = new byte[is.available()];
//					is.read(data);
//					
//					// writing the data
//					fos.write(data);
//					fos.close();	
//				}catch(IOException e) {
//					e.printStackTrace();
//				}
			
				out.println("Product save success");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product added successfully !!");
				response.sendRedirect("admin.jsp");
				return;				
			}
			
			
			
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		processRequest(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		processRequest(request,response);
	}

}
