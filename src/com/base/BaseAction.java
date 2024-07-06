package com.base;

import org.apache.struts.actions.DispatchAction;
import org.apache.log4j.*;

/** 具有日志功能的DispatchAction子类 */
public class BaseAction extends DispatchAction {
	/** 取得日志记录器Logger */
	public static Logger logger = Logger.getLogger(BaseAction.class);
}