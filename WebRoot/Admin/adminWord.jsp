<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/struts-bean" prefix="bean"%> 
<%@ taglib uri="/struts-html" prefix="html"%> 
<%@ taglib uri="/struts-logic" prefix="logic" %>
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
	<c:set var="label1"><bean:message key="word.title"/></c:set>
	<c:set var="label2"><bean:message key="word.user"/></c:set>
	<c:set var="label3"><bean:message key="word.answered"/></c:set>
	<c:set var="label4"><bean:message key="word.date"/></c:set>
	<c:set var="label5"><bean:message key="member.edit"/></c:set>	  	  
	<table border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#c0ebf3; border:0px;">
	  <tr>
		<td height="40" class="itemTitle" align="center"><bean:message key="word.manage"/></td>
	  </tr>
	  <tr>
		<td height="30" class="blueText" align="center">
			<html:link page="/Admin/adminMember.do?method=browseMember">
					 <span class="blueText"><bean:message key="member.manage"/></span>			
			</html:link>
		</td>
	  </tr>
	  <tr>
	    <td height="30" align="center">		
			<display:table name="wordList" id="row" pagesize="15" export="true" class="displaytag" requestURI="/Admin/adminMember.do?method=browseWord" >
				<display:column property="title" title="${label1}" sortable="true" headerClass="sortable" style="text-align:center;"/>
				<display:column property="member.memberName" title="${label2}" style="text-align:center;"/>
				<display:column title="${label3}" media="html" style="text-align:center;">
					<logic:notEmpty name="row" property="answerContent">
						<bean:message key="word.answered.yes"/>
					</logic:notEmpty>
					<logic:empty name="row" property="answerContent">
						<bean:message key="word.answered.not"/>
					</logic:empty> 					 
				</display:column>				
				<display:column property="leaveDate" title="${label4}" sortable="true" headerClass="sortable" style="text-align:center;"/>				
				<display:column title="${label5}" media="html" style="text-align:center;">
					<html:link page="/Admin/adminMember.do?method=viewWord" 
							   paramId="id" 
							   paramName="row" 
							   paramProperty="id">
						<bean:message key="word.info"/>
					</html:link>					
					<html:link page="/Admin/adminMember.do?method=delWord" 
							   paramId="id" 
							   paramName="row" 
							   paramProperty="id">
						<bean:message key="word.del"/>
					</html:link>
				</display:column>
				<display:setProperty name="export.csv.filename" value="word.csv"/>
				<display:setProperty name="export.excel.filename" value="word.xls"/>
			</display:table>		
		</td>
      </tr>
	<logic:messagesPresent property="delWordStatus">
      <tr>
	    <td height="30" align="center" class="redText"><html:errors property="delWordStatus"/></td>
      </tr>
	</logic:messagesPresent>
	<logic:messagesPresent property="answerWordStatus">
      <tr>
	    <td height="30" align="center" class="redText"><html:errors property="answerWordStatus"/></td>
      </tr>
	</logic:messagesPresent>
  </table>
  </body>
</html>