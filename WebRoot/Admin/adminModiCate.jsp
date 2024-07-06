<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="/struts-bean" prefix="bean" %>
<%@ taglib uri="/struts-html" prefix="html" %>
<html>
<head>
<title></title>
<link href="../CSS/stylesheet.css" rel="stylesheet" type="text/css">
<style type="text/css">
	<!--
	body {
		background-color: #c0ebf3;
	}
	-->
</style>
</head>
<body>
<html:javascript formName="cateForm"/>
<html:form action="/Admin/adminCate.do?method=modiCate" onsubmit="return validateCateForm(this);">
  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr height="40">
        <td colspan="2" class="itemTitle" align="center">
        	<bean:message key="category.table.modify"/>
        </td>
      </tr>
      <tr height="30">
        <td width="160" align="right"><bean:message key="category.table.label1"/>£º</td>
        <td><html:text property="cateName" size="41" styleClass="textBox"/></td>
     </tr>
      <tr height="30">
        <td valign="top"  align="right"><bean:message key="category.table.label2"/>£º</td>
        <td><html:textarea property="cateDesc" cols="40" rows="10" styleClass="textBox"/></td>
     </tr>
      <tr height="30">
        <td colspan="2" align="center">
			<html:reset><bean:message key="reset.text"/></html:reset>
			<html:submit><bean:message key="submit.text"/></html:submit>
		</td>
     </tr>
      <tr>
        <td height="30" align="center" colspan="2" class="redText">
			<html:errors property="modiCateStatus"/>
		</td>
      </tr>
    </table>	
	<input type="hidden" name="id" value="<%=request.getAttribute("id")%>">
</html:form>
</body>
</html>