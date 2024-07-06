<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/struts-bean" prefix="bean"%> 
<%@ taglib uri="/struts-html" prefix="html"%> 
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
	<head>
		<title><bean:message key="admin.pageTitle"/></title>
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
	<c:set var="label1"><bean:message key="admin.realname"/></c:set>
	<c:set var="label2"><bean:message key="admin.loginName"/></c:set>
	<c:set var="label3"><bean:message key="admin.type"/></c:set>
	<c:set var="label4"><bean:message key="admin.edit.text"/></c:set>		  
	<table border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#c0ebf3; border:0px;">
	  <tr>
		<td height="40" class="itemTitle" align="center"><bean:message key="admin.table.title"/></td>
	  </tr>
	  <tr>
		<td height="30" class="blueText" align="center">
			<html:link forward="addAdmin">
					 <span class="blueText"><bean:message key="admin.add"/></span>			
			</html:link>
		</td>
	  </tr>
	  <tr>
	    <td height="30" align="center">		
			<display:table name="adminList" id="row" pagesize="15" export="true" class="displaytag" requestURI="/Admin/admin.do?method=browseAdmin" >
				<display:column property="adminName" title="${label1}" sortable="true" headerClass="sortable" style="text-align:center;"/>
				<display:column property="loginName" title="${label2}" sortable="true" headerClass="sortable" style="text-align:center;"/>
				<display:column property="adminType" title="${label3}" sortable="true" headerClass="sortable" style="text-align:center;"/>
				<display:column title="${label4}" media="html" style="text-align:center;">
					<html:link page="/Admin/admin.do?method=loadAdmin" 
							   paramId="id" 
							   paramName="row" 
							   paramProperty="id">
						<bean:message key="admin.modify"/>
					</html:link>
					<html:link page="/Admin/admin.do?method=delAdmin" 
							   paramId="id" 
							   paramName="row" 
							   paramProperty="id">
						<bean:message key="admin.delete"/>
					</html:link>
				</display:column>
				<display:setProperty name="export.csv.filename" value="Admin.csv"/>
				<display:setProperty name="export.excel.filename" value="Admin.xls"/>
			</display:table>		
		</td>
      </tr>
      <tr>
	    <td height="30" align="center" class="redText"><html:errors property="delAdminStatus"/></td>
      </tr>
  </table>
  </body>
</html>