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
        	<bean:message key="mer.modify.text"/>
        </td>
      </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.category"/>：</td>
        <td><html:select property="category" styleClass="textBox"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.name"/>：</td>
        <td><html:text property="merName" size="41" styleClass="textBox"/></td>
     </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.model"/>：</td>
        <td><html:text property="merModel" size="41" styleClass="textBox"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.picture"/>：</td>
        <td><html:file property="picture"  styleClass="textBox"/></td>
     </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.price"/>：</td>
        <td><html:text property="price" size="41" styleClass="textBox"/></td>
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
        <td><html:text property="sprice" size="41" styleClass="textBox"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.desc"/>：</td>
        <td><html:textarea property="merDesc" cols="40" rows="10" styleClass="textBox"/></td>
     </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.manufacturer"/>：</td>
        <td><html:text property="manufacturer" size="41" styleClass="textBox"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.leaveFactoryDate"/>：</td>
        <td><html:text property="leaveFactoryDate" size="41" readonly="true" onclick="popupWin(this)" styleClass="textBox"/></td>
     </tr>
      <tr height="24">
        <td colspan="2" align="center">
			<html:reset><bean:message key="reset.text"/></html:reset>
			<html:submit><bean:message key="submit.text"/></html:submit>
		</td>
     </tr>
      <tr>
        <td height="24" align="center" colspan="2" class="redText">
			<html:errors property="modiMerStatus"/>
		</td>
      </tr>
    </table>
	<input type="hidden" name="id" value="<%=request.getAttribute("id")%>">
</html:form>
<script language="javascript">
	//构造水果类别下拉列表
	jsonrpc = new JSONRpcClient("../JSON-RPC");
	var result = jsonrpc.ajax.getCategory();
	var cateId = "<%=request.getAttribute("cateId")%>";
	for (var i=0;i<result.length;i++){
		option =document.createElement("OPTION");
		option.value = result[i][0];
		option.text = result[i][1];
		document.all.category.options.add(option);
	}
	for(var j=0;j<document.all.category.options.length;j++){
		if (document.all.category.options[j].value == cateId){
			document.all.category.options[j].selected = "true";
		}
	}

	//日期选择
	function popupWin(temp){
		var xx=event.clientX;
		var yy=event.clientY;
		var value = window.showModalDialog("../JS/selectDate.htm",window,"dialogWidth:350px;dialogHeight:180px;center:0;dialogLeft:"+xx+";dialogTop:"+yy+";status:0;");
		temp.value=value;
	}
</script>
</body>
</html>
