package com.service;

import com.ORM.*;
import java.util.*;

public interface OrderService {
	/** 新增订单 */	
	public boolean addOrder(Orders order) throws Exception;
	/** 浏览某会员的所有订单 */
	public List browseOrder(Member member) throws Exception;
	/** 浏览所有订单 */
	public List browseOrder() throws Exception;
	/** 浏览某订单的所有水果记录 */
	public List browseOrderMer(Cart cart) throws Exception;			
	/** 删除订单 */	
	public boolean delOrder(Integer id) throws Exception;	
	/** 装载订单 */	
	public Orders loadOrder(Integer id) throws Exception;
	/** 修改订单 */	
	public boolean updateOrder(Orders order) throws Exception;
}
