package com.service;

import com.ORM.*;
import java.util.*;

public interface CartService {
	/** 选购水果 */	
	public boolean addCart(Member member,Merchandise mer,int number) throws Exception;
	/** 查看购物车中的选购水果 */
	public List browseCart(Member member) throws Exception;		
	/** 清空购物车 */	
	public boolean clearCart(Member member) throws Exception;		
	/** 调整选购水果的数量 */	
	public boolean modiCart(Integer id,int number) throws Exception;	
	/** 删除已选购水果 */	
	public boolean delCart(Integer id) throws Exception;
	/** 装载指定会员的购物车 */	
	public Cart loadCart(Member member) throws Exception;
	/** 更新购物车 */	
	public boolean updateCart(Cart cart) throws Exception;
}
