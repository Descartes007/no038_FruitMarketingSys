<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/struts-bean" prefix="bean"%> 
<%@ taglib uri="/struts-html" prefix="html"%> 
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
	<head>
		<title></title>
		<link rel="stylesheet" type="text/css" href="../CSS/stylesheet.css">
		<link rel="stylesheet" type="text/css" href="../CSS/displaytag.css" />		
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<style type="text/css">
		<!--
		body {
			background-color: #c0ebf3;
		}
		-->
	</style>
	</head>  
  <body>
	<c:set var="label1"><bean:message key="member.login.name"/></c:set>
	<c:set var="label2"><bean:message key="member.realname"/></c:set>
	<c:set var="label3"><bean:message key="member.level"/></c:set>
	<c:set var="label4"><bean:message key="member.phone"/></c:set>
	<c:set var="label5"><bean:message key="member.regdate"/></c:set>
	<c:set var="label6"><bean:message key="member.edit"/></c:set>	  	  
	<table border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#c0ebf3; border:0px;">
	  <tr>
		<td height="40" class="itemTitle" align="center"><bean:message key="member.manage"/></td>
	  </tr>
	  <tr>
		<td height="30" class="blueText" align="center">
			<html:link page="/Admin/adminMember.do?method=browseWord">
					 <span class="blueText"><bean:message key="word.manage"/></span>			
			</html:link>
		</td>
	  </tr>
	  <tr>
	    <td height="30" align="center">		
			<display:table name="memberList" id="row" pagesize="15" export="true" class="displaytag" requestURI="/Admin/adminMember.do?method=browseMember" >
				<display:column property="loginName" title="${label1}" sortable="true" headerClass="sortable" style="text-align:center;"/>
				<display:column property="memberName" title="${label2}" style="text-align:center;"/>
				<display:column property="memberlevel.levelName" title="${label3}" sortable="true" headerClass="sortable" style="text-align:center;"/>
				<display:column property="phone" title="${label4}" style="text-align:center;"/>
				<display:column property="regDate" title="${label5}" sortable="true" headerClass="sortable" style="text-align:center;"/>
				<display:column title="${label6}" media="html" style="text-align:center;">
					<html:link page="/Admin/adminMember.do?method=viewMember" 
							   paramId="id" 
							   paramName="row" 
							   paramProperty="id">
						<bean:message key="member.info"/>
					</html:link>					
					<html:link page="/Admin/adminMember.do?method=delMember" 
							   paramId="id" 
							   paramName="row" 
							   paramProperty="id">
						<bean:message key="member.del"/>
					</html:link>
				</display:column>
				<display:setProperty name="export.csv.filename" value="member.csv"/>
				<display:setProperty name="export.excel.filename" value="member.xls"/>
			</display:table>		
		</td>
      </tr>
      <tr>
	    <td height="30" align="center" class="redText"><html:errors property="delMemberStatus"/></td>
      </tr>
  </table>  
  </body>
</html>