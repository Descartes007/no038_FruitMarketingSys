package com.service;

import com.ORM.*;
import java.util.*;

public interface WordService {
	/** 新增留言 */	
	public boolean addWord(Leaveword word) throws Exception;
	/** 分页浏览所有留言 */
	public List browseWord(int pageSize,int pageNo) throws Exception;
	/** 浏览所有留言 */
	public List browseWord() throws Exception;
	/** 统计留言条数 */
	public int countWord() throws Exception;	
	/** 删除留言 */	
	public boolean delWord(Integer id) throws Exception;	
	/** 装载留言 */	
	public Leaveword loadWord(Integer id) throws Exception;
	/** 回复留言 */	
	public boolean updateWord(Leaveword word) throws Exception;
}
