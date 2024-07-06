package com.service;

import com.ORM.*;
import java.util.*;

/** 管理员管理接口 */
public interface AdminService {

	/** 系统管理员登录 */
	public Admin adminLogin(String loginName,String loginPwd) throws Exception;
	
	/** 浏览管理员 */
	public List browseAdmin() throws Exception;	
	/** 装载指定的管理员 */	
	public Admin loadAdmin(Integer id) throws Exception;	
	/** 删除指定的管理员 */	
	public boolean delAdmin(Integer id) throws Exception;	
	/** 新增管理员 */	
	public boolean addAdmin(Admin admin) throws Exception;	
	/** 更新管理员 */	
	public boolean updateAdmin(Admin admin) throws Exception;	
}