package com.service;

import java.sql.*;
import java.util.*;
import com.ORM.*;
import com.base.BaseLog;
import org.hibernate.*;

public class CartServiceImpl extends BaseLog implements CartService {

	/** 选购水果 */	
	public boolean addCart(Member member, Merchandise mer, int number)
			throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			Cartselectedmer sel = null;
			int favourable = member.getMemberlevel().getFavourable().intValue();			
			//判断该会员是否已经有使用中的购物车
			String hql ="from Cart as a where a.member=:member and a.cartStatus=0";
			Query query = session.createQuery(hql);
			query.setEntity("member", member);
			query.setMaxResults(1);
			tx = session.beginTransaction();
			Cart cart = (Cart)query.uniqueResult();
			if (cart==null){
				cart = new Cart();
				cart.setCartStatus(new Integer(0));
				cart.setMember(member);
				cart.setMoney(Double.valueOf(number*mer.getPrice().doubleValue()));
				cart.getMerchandises().add(mer);
				session.save(cart);
			}else{				
				//如果选购的是已经选购过的水果则只增加水果数量即可
				hql = "select a from Cartselectedmer as a where a.cart=:cartid and a.merchandise=:merid order by a.id desc";
				query = session.createQuery(hql);
				query.setInteger("cartid", cart.getId().intValue());
				query.setInteger("merid", mer.getId().intValue());
				query.setMaxResults(1);
				sel = (Cartselectedmer)query.uniqueResult();
				int total = number;
				System.out.println((total*mer.getPrice().doubleValue()*favourable/100));
				if(sel!=null){
					total = number+sel.getNumber().intValue();
					sel.setNumber(Integer.valueOf(total));
					if (mer.getSpecial().intValue()==1){//特价水果
						sel.setPrice(mer.getSprice());
						sel.setMoney(Double.valueOf(total*mer.getSprice().doubleValue()));
					}else{//普通水果
						sel.setPrice(Double.valueOf(mer.getPrice().doubleValue()*favourable/100));
						sel.setMoney(Double.valueOf(total*mer.getPrice().doubleValue()*favourable/100));
					}						
					session.update(sel);
				}else{
					cart.getMerchandises().add(mer);
				}
				if (mer.getSpecial().intValue()==1){//特价水果
					cart.setMoney(Double.valueOf(cart.getMoney().doubleValue()+number*mer.getSprice().doubleValue()));
				}else{//普通水果
					cart.setMoney(Double.valueOf(cart.getMoney().doubleValue()+number*mer.getPrice().doubleValue()*favourable/100));
				}				
				session.update(cart);
			}
			tx.commit();

			//如果是尚未选购过的则要修改选购记录的有关字段
			if(sel==null){
				tx = session.beginTransaction();				
				hql = "select a from Cartselectedmer as a where a.cart=:cartid and a.merchandise=:merid order by a.id desc";
				query = session.createQuery(hql);
				query.setInteger("cartid", cart.getId().intValue());
				query.setInteger("merid", mer.getId().intValue());
				query.setMaxResults(1);
				sel = (Cartselectedmer)query.uniqueResult();
				if(sel!=null){
					sel.setNumber(Integer.valueOf(number));
					if (mer.getSpecial().intValue()==1){//特价水果
						sel.setPrice(mer.getSprice());
						sel.setMoney(Double.valueOf(number*mer.getSprice().doubleValue()));
					}else{//普通水果
						sel.setPrice(Double.valueOf(mer.getPrice().doubleValue()*favourable/100));
						sel.setMoney(Double.valueOf(number*mer.getPrice().doubleValue()*favourable/100));
					}					
					session.update(sel);
				}
				tx.commit();
			}			
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行CartServiceImpl类中的addCart方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 查看购物车中的选购水果 */
	public List browseCart(Member member) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		List result = null;
		try{
			//取得该会员的使用中购物车ID
			Integer cartid = new Integer(0);
			String hql ="from Cart as a where a.member=:member and a.cartStatus=0";
			Query query = session.createQuery(hql);
			query.setEntity("member", member);
			query.setMaxResults(1);
			tx = session.beginTransaction();
			Cart cart = (Cart)query.uniqueResult();
			if (cart!=null){
				cartid = cart.getId();
			}
			tx.commit();

			//浏览购物车中的所有选购记录
			hql ="from Cartselectedmer as a where a.cart=:cartid";
			query = session.createQuery(hql);
			query.setInteger("cartid", cartid.intValue());
			tx = session.beginTransaction();
			result = query.list();
			if(!Hibernate.isInitialized(result)){
				Hibernate.initialize(result);
			}
			tx.commit();
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行CartServiceImpl类中的browseCart方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return result;
	}

	/** 清空购物车 */	
	public boolean clearCart(Member member) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			//取得该会员的使用中购物车ID
			Integer cartid = new Integer(0);
			String hql ="from Cart as a where a.member=:member and a.cartStatus=0";
			Query query = session.createQuery(hql);
			query.setEntity("member", member);
			query.setMaxResults(1);
			tx = session.beginTransaction();
			Cart cart = (Cart)query.uniqueResult();
			if (cart!=null){
				cartid = cart.getId();
				cart.setMoney(Double.valueOf(0));
				session.update(cart);
			}
			tx.commit();

			//删除购物车中的所有选购记录(通过JDBC进行批量删除)
			Connection con = session.connection();
			Statement stat = con.createStatement();			
			String sql ="delete from Cartselectedmer where cart="+cartid;
			tx = session.beginTransaction();
			stat.executeUpdate(sql);
			tx.commit();
			if (stat!=null)stat.close();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行CartServiceImpl类中的clearCart方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 删除已选购水果 */	
	public boolean delCart(Integer id) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			//删除指定的选购记录
			double money = 0;
			Integer cartid = new Integer(0);
			tx = session.beginTransaction();
			Cartselectedmer sel = (Cartselectedmer)session.get(Cartselectedmer.class, id);			
			if (sel!=null){
				money = sel.getMoney().doubleValue();
				cartid = sel.getCart();
				session.delete(sel);				
			}
			tx.commit();

			//更新购物车总金额
			tx = session.beginTransaction();
			Cart cart = (Cart)session.get(Cart.class, cartid);
			if (cart!=null){
				cart.setMoney(Double.valueOf(cart.getMoney().doubleValue()-money));
				session.update(cart);
			}
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行CartServiceImpl类中的delCart方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 装载指定会员的购物车 */	
	public Cart loadCart(Member member) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		Cart cart = null;
		try{
			//取得该会员的使用中购物车
			String hql ="from Cart as a where a.member=:member and a.cartStatus=0";
			Query query = session.createQuery(hql);
			query.setEntity("member", member);
			query.setMaxResults(1);
			tx = session.beginTransaction();
			cart = (Cart)query.uniqueResult();
			tx.commit();
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行CartServiceImpl类中的loadCart方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return cart;
	}

	/** 调整选购水果的数量 */	
	public boolean modiCart(Integer id, int number) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			//修改指定的选购记录
			double diff = 0;
			Integer cartid = new Integer(0);
			tx = session.beginTransaction();
			Cartselectedmer sel = (Cartselectedmer)session.get(Cartselectedmer.class, id);			
			if (sel!=null){
				cartid = sel.getCart();
				diff = (number - sel.getNumber().intValue())*sel.getPrice().doubleValue();
				sel.setNumber(Integer.valueOf(number));
				sel.setMoney(Double.valueOf(sel.getPrice().doubleValue()*number));
				session.update(sel);				
			}
			tx.commit();

			//更新购物车总金额
			tx = session.beginTransaction();
			Cart cart = (Cart)session.get(Cart.class, cartid);
			if (cart!=null){
				cart.setMoney(Double.valueOf(cart.getMoney().doubleValue()+diff));
				session.update(cart);
			}
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行CartServiceImpl类中的modiCart方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

	/** 更新购物车 */	
	public boolean updateCart(Cart cart) throws Exception {
		Session session = MySessionFactory.getSession();
		Transaction tx = null;
		boolean status = false;
		try{
			tx = session.beginTransaction();
			session.update(cart);
			tx.commit();
			status = true;
		}catch(Exception ex){
			if(tx!=null)tx.rollback();
			logger.info("在执行CartServiceImpl类中的updateCart方法时出错：\n");
			ex.printStackTrace();
		}finally{
			MySessionFactory.closeSession();
		}	
		return status;
	}

}
