package com.service;

import java.util.*;
import com.ORM.*;

public interface MemService {
	/** 会员登录 */
	public Member memLogin(String loginName,String loginPwd) throws Exception;	
	/** 浏览会员级别 */
	public List browseMemberLevel() throws Exception;
	/** 装载会员级别 */
	public Memberlevel loadMemberLevel(Integer id) throws Exception;
	/** 检测登录帐号是否有效 */	
	public boolean chkLoginName(String loginName) throws Exception;	
	/** 新增注册会员 */	
	public boolean addMember(Member member) throws Exception;
	/** 修改注册会员 */	
	public boolean updateMember(Member member) throws Exception;
	
	/** 浏览注册会员*/
	public List browseMember() throws Exception;
	/** 删除注册会员 */	
	public boolean delMember(Integer id) throws Exception;
	/**装载注册会员 */	
	public Member loadMember(Integer id) throws Exception;	
}
