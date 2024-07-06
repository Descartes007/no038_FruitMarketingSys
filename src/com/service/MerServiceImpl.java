package com.service;

import java.util.List;

import org.hibernate.*;
import com.ORM.*;
import com.base.BaseLog;

/** 水果类别、水果及特价水果业务逻辑处理接口实现 */
public class MerServiceImpl extends BaseLog implements MerService {

	/** 新增水果类别 */
	public boolean addCategory(Category cate) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			session.save(cate);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的addCategory方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}
	
	/** 浏览水果类别 */
	public List browseCategory() throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		List list = null;
		try{
			Query query = session.createQuery("from Category as a order by a.id");
			tx = session.beginTransaction();
			list = query.list();
			tx.commit();
			if (!Hibernate.isInitialized(list))Hibernate.initialize(list);
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的browseCategory方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return list;
	}
	
	/** 删除指定的水果类别 */	
	public boolean delCategory(Integer id) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			Category cate = (Category)session.load(Category.class, id);
			session.delete(cate);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的delCategory方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}
	
	/** 装载指定的水果类别 */
	public Category loadCategory(Integer id) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		Category cate = null;
		try{
			tx = session.beginTransaction();
			cate = (Category)session.get(Category.class, id);
			tx.commit();
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的loadCategory方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return cate;
	}

	/** 更新水果类别 */
	public boolean updateCategory(Category cate) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			session.update(cate);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的updateCategory方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 新增水果 */
	public boolean addMer(Merchandise mer) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			session.save(mer);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的addMer方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 浏览水果 */
	public List browseMer(String hql) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		List list = null;
		try{
			Query query = session.createQuery(hql);
			tx = session.beginTransaction();
			list = query.list();
			tx.commit();
			if (!Hibernate.isInitialized(list))Hibernate.initialize(list);
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的browseMer方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return list;
	}

	/** 删除指定的水果 */	
	public boolean delMer(Integer id) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			Merchandise mer = (Merchandise)session.load(Merchandise.class, id);
			session.delete(mer);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的delMer方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 装载指定的水果 */
	public Merchandise loadMer(Integer id) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		Merchandise mer = null;
		try{
			tx = session.beginTransaction();
			mer = (Merchandise)session.get(Merchandise.class, id);
			tx.commit();
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的loadMer方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return mer;
	}

	/** 更新水果 */
	public boolean updateMer(Merchandise mer) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			session.update(mer);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的updateMer方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 分页浏览水果 */
	public List browseMer(int pageSize, int pageNo, int cateId,boolean isSpecial) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		List list = null;
		try{
			String hql = "from Merchandise as a";
			if (isSpecial){	//特价水果
				hql = hql + " where a.special=1";
			}else{ //普通水果
				hql = hql + " where a.special=0";				
			}
			if (cateId!=0){ //指定类别
				hql = hql + " and a.category.id="+cateId;
			}
			hql = hql + " order by a.id desc";
			Query query = session.createQuery(hql);
			query.setMaxResults(pageSize);
			query.setFirstResult((pageNo-1)*pageSize);
			tx = session.beginTransaction();
			list = query.list();
			tx.commit();
			if (!Hibernate.isInitialized(list))Hibernate.initialize(list);
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的browseMer方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return list;
	}

	/** 检索水果 */
	public List browseMer(int pageSize, int pageNo, String hql) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		List list = null;
		try{
			Query query = session.createQuery(hql);
			query.setMaxResults(pageSize);
			query.setFirstResult((pageNo-1)*pageSize);
			tx = session.beginTransaction();
			list = query.list();
			tx.commit();
			if (!Hibernate.isInitialized(list))Hibernate.initialize(list);
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的browseMer方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return list;
	}
	
	/** 统计记录条数 */
	public int countRecord(String hql) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		int count = 0;
		try{
			tx = session.beginTransaction();
			Query query = session.createQuery(hql);
			query.setMaxResults(1);
			count = ((Integer)query.uniqueResult()).intValue();
			tx.commit();
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行MerServiceImpl类中的countRecord方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return count;
	}
}