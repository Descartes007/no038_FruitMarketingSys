<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="/struts-bean" prefix="bean" %>
<%@ taglib uri="/struts-html" prefix="html" %>
<html>
<head>
<title></title>
<link href="../CSS/stylesheet.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#265215"><br><br><br><br>
<html:form action="/Admin/login.do?method=login">
	<table width="500" height="294" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/login_back.jpg">
	  <tr>
		<td height="203">&nbsp;</td>
	  </tr>
	  <tr>
		<td><table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="50" class="blackTitle">
				<bean:message key="admin.loginName"/>£º
			</td>
			<td>
				<html:text property="loginName" size="15" styleClass="textBox"/>
			</td>
			<td width="50" class="blackTitle">
				<bean:message key="admin.loginPwd"/>£º
			</td>
			<td>
				<html:password property="loginPwd" size="15" styleClass="textBox"/>
			</td>
			<td width="80">
				<div align="right">				
					<input type="image" src="../images/login_button.jpg" border="0">
				</div>
			</td>
		  </tr>
		  <tr>
		  <td height="20" colspan="5" class="redText">
			<html:errors/>
		  </td>
		</tr>
		</table></td>
	  </tr>
	</table>
</html:form>
</body>
</html>
