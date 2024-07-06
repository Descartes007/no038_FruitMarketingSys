<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="/struts-bean" prefix="bean" %>
<%@ taglib uri="/struts-html" prefix="html" %>
<jsp:useBean id="JSONRPCBridge" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge"/>
<jsp:useBean id="ajax" class="com.base.AjaxBean"></jsp:useBean>
<%
	JSONRPCBridge.registerObject("ajax",ajax);
%>
<html>
<head>
<title></title>
<link href="../CSS/stylesheet.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../JS/jsonrpc.js"></script>
<style type="text/css">
	<!--
	body {
		background-color: #c0ebf3;
	}
	-->
</style>
</head>
<body>
<html:javascript formName="merForm"/>
<html:form action="/Admin/adminMer.do?method=modiMer" enctype="multipart/form-data" onsubmit="return validateMerForm(this);">
  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr height="40">
        <td colspan="2" class="itemTitle" align="center">
        	<bean:message key="mer.info.text"/>
        </td>
      </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.category"/>：</td>
        <td><html:text property="category" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.name"/>：</td>
        <td><html:text property="merName" size="41" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.model"/>：</td>
        <td><html:text property="merModel" size="41" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.picture"/>：</td>
        <td> <img id="picture" src="../images/default.jpg" height="80" width="80" border="1"/></td>
     </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.price"/>：</td>
        <td><html:text property="price" size="41" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.special"/>：</td>
        <td>
			<html:radio property="special" value="0"/>无&nbsp;&nbsp;
            <html:radio property="special" value="1"/>有
		</td>
     </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.sprice"/>：</td>
        <td><html:text property="sprice" size="41" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.desc"/>：</td>
        <td><html:textarea property="merDesc" cols="40" rows="10" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.manufacturer"/>：</td>
        <td><html:text property="manufacturer" size="41" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.leaveFactoryDate"/>：</td>
        <td><html:text property="leaveFactoryDate" size="41" readonly="true" styleClass="textBox"/></td>
     </tr>	 	 	 	 
      <tr height="24">
        <td colspan="2" align="center">
			<html:link page="/Admin/adminMer.do?method=browseMer">
				<bean:message key="return.text"/>
			</html:link>
		</td>
     </tr>
    </table>
</html:form>
<script language="javascript">
	//取得所属水果类别名称
	jsonrpc = new JSONRpcClient("../JSON-RPC");
	var result = jsonrpc.ajax.getCategory();
	var cateId = "<%=request.getAttribute("cateId")%>";
	var imgSrc ="<%=request.getAttribute("picture")%>";
	document.all.picture.src = imgSrc;
	for (var i=0;i<result.length;i++){
		if (result[i][0] == cateId){
			document.all.category.value = result[i][1];	
		}
	}
</script>	
</body>
</html>