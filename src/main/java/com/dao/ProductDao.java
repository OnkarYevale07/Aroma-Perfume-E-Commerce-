package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Product;
import com.entities.User;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveProduct(Product product) {
		boolean f = false;
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			session.save(product);
			tx.commit();
			session.close();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
			f = false;
		}
		return f;
	}

	// get all products
	public List<Product> getAllProducts() {

		Session s = this.factory.openSession();
		Query query = s.createQuery("from Product");
		List<Product> list = query.list();
		return list;
	}

	// get products by category id
	public List<Product> getProductsById(int cId) {

		Session s = this.factory.openSession();
		Query query = s.createQuery("from Product as p where p.category.categoryId =: id");
		query.setParameter("id", cId);
		List<Product> list = query.list();
		return list;
	}
	// get products by category id
	public List<Product> getProductById(int pId) {
		
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Product as p where p.pId =: id");
		query.setParameter("id", pId);
		List<Product> list = query.list();
		return list;
	}
	
	public boolean deleteProductById(int pId) {
			boolean f = false;
//			<Product> product = (Product) getProductById(pId);
			try {
				String query = "delete from Product where pId= : id";
				Session session = this.factory.openSession();
				
				  Query q = session.createQuery(query); q.setParameter("id", pId);
				  
				  Product p = (Product)q.uniqueResult();
				 
//				session.remove(product);
				
				session.close();
				f = true;
			} catch (Exception e) {
				e.printStackTrace();
				f = false;
			}
			return f;
	}
	
	
	public List<Product> getDiscountedProducts(){
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Product as p ORDER BY p.pDiscount DESC");
		List<Product> list = query.list();
		return list;
	}
}
