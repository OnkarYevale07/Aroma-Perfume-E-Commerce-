package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entities.Product;
import com.entities.User;

public class UserDao {

	private SessionFactory factory;
	
	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	//get user by email and password
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		try {
			String query = "from User where userEmail =: e and userPassword=: p";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p",password);
			
			user = (User)q.uniqueResult();
			
			session.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public List<User> getAllUsers(){

		Session s = this.factory.openSession();
		Query query = s.createQuery("from User");
		List<User> list = query.list();
		return list;
	}
	
	public User getUserById(int uId) {
		User user = null;
		try {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from User WHERE userId =: uId");
		query.setParameter("uId", uId);
		user = (User) query.uniqueResult();
		s.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
		return user;
	}
}
