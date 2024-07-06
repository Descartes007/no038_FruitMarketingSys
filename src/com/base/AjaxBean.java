package com.base;

import com.service.*;
import com.ORM.*;
import java.util.*;

/** 供JSON-RPC组件远程调用的AjaxBean */
public class AjaxBean extends BaseLog {
	/**取得水果类别列表*/
	public String[][] getCategory(){
		String[][] options = null;
		MerService service = new MerServiceImpl();
		try{
			List list = service.browseCategory();
			Category cate = null;
			int i = 0;
			if (list!=null){
				options = new String[list.size()][2];
				Iterator it = list.iterator();
				while(it.hasNext()){
					cate = (Category)it.next();
					options[i][0] =cate.getId().toString();
					options[i][1] =cate.getCateName().trim();
					i++;
				}
			}else{
				options = new String[1][2];
				options[0][0] ="0";
				options[0][1] ="无水果类别";
			}
		}catch(Exception ex){
			logger.info("在执行AjaxBean类中的getCategory方法时出错：\n");
			ex.printStackTrace();			
		}
		return options;
	}
	
	/**取得会员级别*/
	public String[][] getMemberLevel(){
		String[][] options = null;
		MemService service = new MemServiceImpl();
		try{
			List list = service.browseMemberLevel();
			Memberlevel ml = null;
			int i = 0;
			if (list!=null){
				options = new String[list.size()][2];
				Iterator it = list.iterator();
				while(it.hasNext()){
					ml = (Memberlevel)it.next();
					options[i][0] =ml.getId().toString();
					options[i][1] =ml.getLevelName().trim();
					i++;
				}
			}else{
				options = new String[1][2];
				options[0][0] ="0";
				options[0][1] ="无会员级别";
			}
		}catch(Exception ex){
			logger.info("在执行AjaxBean类中的getMemberLevel方法时出错：\n");
			ex.printStackTrace();			
		}
		return options;
	}
	
	/**注册登录帐号有效性验证*/
	public boolean chkLoginName(String loginName){
		MemService service = new MemServiceImpl();
		boolean result = false;
		try{
			result = service.chkLoginName(loginName);
		}catch(Exception ex){
			logger.info("在执行AjaxBean类中的chkLoginName方法时出错：\n");
			ex.printStackTrace();			
		}
		return result;
	}
	
	/**修改选购水果数量*/
	public boolean modiCart(int id,int number){
		CartService service = new CartServiceImpl();
		boolean result = false;
		try{
			result = service.modiCart(Integer.valueOf(id), number);
		}catch(Exception ex){
			logger.info("在执行AjaxBean类中的modiCart方法时出错：\n");
			ex.printStackTrace();			
		}
		return result;
	}
	
	/**调整会员级别*/
	public boolean updateLevel(Integer id,Integer levelId){
		MemService service = new MemServiceImpl();
		boolean result = false;
		try{
			Member member = service.loadMember(id);
			Memberlevel level = service.loadMemberLevel(levelId);
			member.setMemberlevel(level);
			service.updateMember(member);
			result = true;
		}catch(Exception ex){
			logger.info("在执行AjaxBean类中的updateLevel方法时出错：\n");
			ex.printStackTrace();
		}
		return result;
	}	
}