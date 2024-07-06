package com.service;

import java.util.List;

import com.ORM.*;
import com.base.*;
import org.hibernate.*;

/** 管理员管理接口实现 */
public class AdminServiceImpl extends BaseLog implements AdminService {

	/** 系统管理员登录 */
	public Admin adminLogin(String loginName, String loginPwd) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		Admin admin = null;
		try{
			String hql = "select a from Admin as a where a.loginName=:loginName and a.loginPwd=:loginPwd";
			Query query = session.createQuery(hql);
			query.setString("loginName", loginName);
			query.setString("loginPwd", loginPwd);
			query.setMaxResults(1);
			tx = session.beginTransaction();
			admin = (Admin)query.uniqueResult();
			tx.commit();
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行AdminServiceImpl类中的adminLogin方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return admin;
	}

	/** 新增管理员 */	
	public boolean addAdmin(Admin admin) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			session.save(admin);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行AdminServiceImpl类中的addAdmin方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 浏览管理员 */
	public List browseAdmin() throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		List list = null;
		try{
			Query query = session.createQuery("from Admin as a order by a.id");
			tx = session.beginTransaction();
			list = query.list();
			tx.commit();
			if (!Hibernate.isInitialized(list))Hibernate.initialize(list);
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行AdminServiceImpl类中的browseAdmin方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return list;
	}

	/** 删除指定的管理员 */
	public boolean delAdmin(Integer id) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			Admin admin = (Admin)session.load(Admin.class, id);
			session.delete(admin);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行AdminServiceImpl类中的delAdmin方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 装载指定的管理员 */
	public Admin loadAdmin(Integer id) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		Admin admin = null;
		try{
			tx = session.beginTransaction();
			admin = (Admin)session.get(Admin.class, id);
			tx.commit();
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行AdminServiceImpl类中的loadAdmin方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return admin;
	}

	/** 更新管理员 */	
	public boolean updateAdmin(Admin admin) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			session.update(admin);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行AdminServiceImpl类中的updateAdmin方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}
}