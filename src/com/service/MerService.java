package com.service;

import java.util.*;
import com.ORM.*;

/** 水果类别、水果及特价水果业务逻辑处理接口 */
public interface MerService {	
	/** 浏览水果类别 */
	public List browseCategory() throws Exception;	
	/** 装载指定的水果类别 */	
	public Category loadCategory(Integer id) throws Exception;	
	/** 删除指定的水果类别 */	
	public boolean delCategory(Integer id) throws Exception;	
	/** 新增水果类别 */	
	public boolean addCategory(Category cate) throws Exception;	
	/** 更新水果类别 */	
	public boolean updateCategory(Category cate) throws Exception;
	
	/** 浏览水果 */
	public List browseMer(String hql) throws Exception;	
	/** 装载指定的水果 */	
	public Merchandise loadMer(Integer id) throws Exception;	
	/** 删除指定的水果 */	
	public boolean delMer(Integer id) throws Exception;	
	/** 新增水果 */	
	public boolean addMer(Merchandise mer) throws Exception;	
	/** 更新水果 */	
	public boolean updateMer(Merchandise mer) throws Exception;
	
	/** 分页浏览水果 */
	public List browseMer(int pageSize,int pageNo,int cateId,boolean isSpecial) throws Exception;
	/** 检索水果 */
	public List browseMer(int pageSize,int pageNo,String hql) throws Exception;	
	/** 统计记录条数 */
	public int countRecord(String hql) throws Exception;	
}