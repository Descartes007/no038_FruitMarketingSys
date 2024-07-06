package com.service;

import java.util.*;
import com.ORM.*;
import com.base.*;
import org.hibernate.*;
import com.service.*;

public class WordServiceImpl extends BaseLog implements WordService {

	/** 新增留言 */	
	public boolean addWord(Leaveword word) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			session.save(word);
			tx.commit();
			status=true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行WordServiceImpl类中的addWord方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 分页浏览所有留言 */
	public List browseWord(int pageSize, int pageNo) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		List list = null;
		try{
			Query query = session.createQuery("from Leaveword as a order by a.id desc");
			query.setMaxResults(pageSize);
			query.setFirstResult((pageNo-1)*pageSize);
			tx = session.beginTransaction();
			list = query.list();
			tx.commit();
			if (!Hibernate.isInitialized(list))Hibernate.initialize(list);
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行WordServiceImpl类中的browseWord方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return list;
	}

	/** 浏览所有留言 */
	public List browseWord() throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		List list = null;
		try{
			Query query = session.createQuery("from Leaveword as a order by a.id desc");
			tx = session.beginTransaction();
			list = query.list();
			tx.commit();
			if (!Hibernate.isInitialized(list))Hibernate.initialize(list);
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行WordServiceImpl类中的browseWord方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return list;
	}

	/** 统计留言条数 */
	public int countWord() throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		int count = 0;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery("select count(*) from Leaveword as a");
			query.setMaxResults(1);
			count = ((Integer)query.uniqueResult()).intValue();
			tx.commit();
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行WordServiceImpl类中的countWord方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return count;
	}

	/** 删除留言 */	
	public boolean delWord(Integer id) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			Leaveword word = (Leaveword)session.load(Leaveword.class, id);
			session.delete(word);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行WordServiceImpl类中的delWord方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 装载留言 */	
	public Leaveword loadWord(Integer id) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		Leaveword word = null;
		try{
			tx = session.beginTransaction();
			word = (Leaveword)session.get(Leaveword.class, id);
			tx.commit();
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行WordServiceImpl类中的loadWord方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return word;
	}

	/** 回复留言 */	
	public boolean updateWord(Leaveword word) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			session.update(word);
			tx.commit();
			status=true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行WordServiceImpl类中的updateWord方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

}
