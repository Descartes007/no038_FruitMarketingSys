package com.service;

import java.util.*;
import com.ORM.*;
import com.base.*;
import org.hibernate.*;

public class OrderServiceImpl extends BaseLog implements OrderService {

	/** 新增订单 */
	public boolean addOrder(Orders order) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			session.save(order);
			tx.commit();
			status=true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行OrderServiceImpl类中的addOrder方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 浏览某会员的所有订单 */
	public List browseOrder(Member member) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		List list = null;
		try{
			Query query = session.createQuery("from Orders as a where a.member=:member");
			tx = session.beginTransaction();
			query.setEntity("member", member);
			list = query.list();
			if (!Hibernate.isInitialized(list))Hibernate.initialize(list);
			tx.commit();			
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行OrderServiceImpl类中的browseOrder方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return list;
	}

	/** 浏览所有订单 */
	public List browseOrder() throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		List list = null;
		try{
			Query query = session.createQuery("from Orders as a order by a.id desc");
			tx = session.beginTransaction();
			list = query.list();
			if (!Hibernate.isInitialized(list))Hibernate.initialize(list);
			tx.commit();			
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行OrderServiceImpl类中的browseOrder方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return list;
	}

	/** 浏览某订单的所有水果记录 */
	public List browseOrderMer(Cart cart) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		List result = null;
		try{
			//浏览购物车中的所有选购记录
			String hql ="from Cartselectedmer as a where a.cart=:cartid";
			Query query = session.createQuery(hql);
			query.setInteger("cartid", cart.getId().intValue());
			tx = session.beginTransaction();
			result = query.list();
			if(!Hibernate.isInitialized(result)){
				Hibernate.initialize(result);
			}
			tx.commit();
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行OrderServiceImpl类中的browseOrderMer方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return result;
	}	

	/** 删除订单 */	
	public boolean delOrder(Integer id) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			Orders order = (Orders)session.load(Orders.class, id);
			session.delete(order);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行OrderServiceImpl类中的delOrder方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 装载订单 */
	public Orders loadOrder(Integer id) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		Orders order = null;
		try{
			tx = session.beginTransaction();
			order = (Orders)session.get(Orders.class, id);
			tx.commit();
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行OrderServiceImpl类中的loadOrder方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return order;
	}

	/** 修改订单 */
	public boolean updateOrder(Orders order) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			session.update(order);
			tx.commit();
			status=true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行OrderServiceImpl类中的updateOrder方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}
}
