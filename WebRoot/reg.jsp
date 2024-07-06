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
<link href="CSS/stylesheet.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="JS/jsonrpc.js"></script>
</head>
<body class="body">
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td height="197" background="images/fg_top.jpg"></td>
  </tr>
</table>
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="border:1px; border-style:solid; border-color:#888888">
  <tr>
    <td width="20">&nbsp;</td>
    <TD height="50" align="right" valign="bottom">
		<IMG src="images/icon_login.gif" align=absMiddle> 
		<INPUT id="qKey" name="qKey" value="水果关键字" onClick="this.value=''"> 
		<SELECT id="category" name="category">
			<option value="0">所有水果</option>
		</SELECT>
		<A href="javascript:QuickSearch()"><IMG src="images/icon_search.gif" align="absMiddle" border="0"></A>
    </TD>
    <td width="20">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TR align="center">
          <TD valign="top" width="9"><IMG src="images/icon02.gif"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="mer.do?method=browseIndexMer"><span class="whiteTitle"><bean:message key="menu.item1"/></span></A>
		  </TD>
		  
          <TD background="images/Bule_06.gif" width="2"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="gsjj.jsp"><span class="whiteTitle">网站简介</span></A>
		  </TD>			  
          <TD background="images/Bule_06.gif" width="2"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="cart.do?method=browseCart"><span class="whiteTitle"><bean:message key="menu.item2"/></span></A>
		  </TD>
          <TD background="images/Bule_06.gif" width="2"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="order.do?method=browseOrder"><span class="whiteTitle"><bean:message key="menu.item3"/></span></A>
		  </TD>
          <TD background="images/Bule_06.gif" width="2"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="mem.do?method=browseWord"><span class="whiteTitle"><bean:message key="menu.item4"/></span></A>
		  </TD>
          <TD background="images/Bule_06.gif" width="2"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="mem.do?method=loadMember"><span class="whiteTitle"><bean:message key="menu.item5"/></span></A>
		  </TD>
          <TD vAlign=top width=7><IMG src="images/icon07.gif"></TD>
        </TR>
    </TABLE></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
    <html:javascript formName="memberForm"/>
	<html:form action="/mem.do?method=reg" style="margin:0px;" onsubmit="return validateMemberForm(this);">
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
		  <tr>
			<td height="80" colspan="2"><IMG src="images/icon_regster.gif"></td>
			</tr>
		  <tr bgcolor="#F7F3F7">
			<td width="260" height="26" class="text" align="right"><bean:message key="member.level"/>：</td>
			<td height="26"><html:select property="memberlevel"/></td>
		  </tr>
		  <tr bgcolor="#F7F3F7">
			<td width="260" height="26" class="text" align="right"><bean:message key="member.realname"/>：</td>
			<td height="26"><html:text property="memberName" size="30" styleClass="textBox"/></td>
		  </tr>
		  <tr bgcolor="#F7F3F7">
			<td width="260" height="26" class="text" align="right"><bean:message key="member.login.name"/>：</td>
			<td height="26"><html:text property="loginName" size="30" styleClass="textBox" onblur="checkLoginName()"/></td>
		  </tr>
		  <tr bgcolor="#F7F3F7">
			<td width="260" height="26" class="text" align="right"><bean:message key="member.login.pwd"/>：</td>
			<td height="26"><html:password property="loginPwd" size="30" styleClass="textBox"/></td>
		  </tr>
		  <tr bgcolor="#F7F3F7">
			<td width="260" height="26" class="text" align="right"><bean:message key="member.login.repwd"/>：</td>
			<td height="26"><input type="password" id="reLoginPwd" size="30" class="textBox" onblur="checkPwd()"/></td>
		  </tr>
		  <tr bgcolor="#F7F3F7">
			<td width="260" height="26" class="text" align="right"><bean:message key="member.phone"/>：</td>
			<td height="26"><html:text property="phone" size="30" styleClass="textBox"/></td>
		  </tr>
		  <tr bgcolor="#F7F3F7">
			<td width="260" height="26" class="text" align="right"><bean:message key="member.address"/>：</td>
			<td height="26"><html:text property="address" size="30" styleClass="textBox"/></td>
		  </tr>
		  <tr bgcolor="#F7F3F7">
			<td width="260" height="26" class="text" align="right"><bean:message key="member.zip"/>：</td>
			<td height="26"><html:text property="zip" size="30" styleClass="textBox"/></td>
		  </tr>
		  <tr bgcolor="#F7F3F7">
			<td width="260" height="26" class="text" align="right"><bean:message key="member.email"/>：</td>
			<td height="26"><html:text property="email" size="30" styleClass="textBox"/></td>
		  </tr>
		  <tr>
			<td height="40" colspan="2" align="center">
				<html:submit property="C_Input" styleClass="C_Input">
					<bean:message key="member.reg.text"/>
				</html:submit><br>
				<span class="redText"><html:errors property="addMemStatus"/></span>
			</td>
		  </tr>
		</table>
	</html:form>              	
	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="30">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="30" bgcolor="green" class="whiteText" align="center">
		<bean:message key="website.foot"/>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<script language="javascript">
	//构造水果类别下拉列表
	jsonrpc = new JSONRpcClient("JSON-RPC");
	var result = jsonrpc.ajax.getCategory();
	for (var i=0;i<result.length;i++){
		option =document.createElement("OPTION");
		option.value = result[i][0];
		option.text = result[i][1];
		document.all.category.options.add(option);
	}
	
	//构造会员级别下拉列表
	result = jsonrpc.ajax.getMemberLevel();
	for (var i=0;i<result.length;i++){
		option =document.createElement("OPTION");
		option.value = result[i][0];
		option.text = result[i][1];
		document.all.memberlevel.options.add(option);
	}
	
	//密码核对
	function checkPwd(){
		if (document.all.loginPwd.value != document.all.reLoginPwd.value){
			alert('对不起，两次输入的密码不一致，请重新输入！');
			document.all.loginPwd.value = "";
			document.all.reLoginPwd.value ="";
			document.all.loginPwd.focus();
		}
	}
	
	//登录帐号有效性检查
	function checkLoginName(){
		var lname = document.all.loginName.value;
		if ((lname !=null)&&(lname.length>0)&&(!jsonrpc.ajax.chkLoginName(lname))){
			alert('对不起，该登录帐号已被占用，请重新输入！');
			document.all.loginName.focus();
		}
	}	
	
	//搜索水果
	function QuickSearch(){
		var url = "mer.do?method=searchMer&cateid="+document.all.category.value;
		var key = document.all.qKey.value;
		if (key !=null && key!="水果关键字" && key.length>0)url = url+"&key="+key;
		window.location = url;
	}
</script>	
</body>
</html>