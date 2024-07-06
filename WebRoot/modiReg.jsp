<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="/struts-bean" prefix="bean" %>
<%@ taglib uri="/struts-logic" prefix="logic" %>
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
<script type="text/javascript" src="JS/checkform.js"></script>
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
	<form action="mem.do?method=updateMember" style="margin:0px;" method="post" onSubmit="return CheckForm.Check(this,2)">             	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
      <tr>
        <td height="30" colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td height="40" colspan="2"><img src="images/EditUser_01.gif" /></td>
      </tr>
      <tr bgcolor="#F7F3F7">
        <td width="260" height="26" class="text" align="right"><bean:message key="member.level"/>
          ：</td>
        <td height="26" class="text">${member.memberlevel.levelName}</td>
      </tr>
      <tr bgcolor="#F7F3F7">
        <td width="260" height="26" class="text" align="right"><bean:message key="member.realname"/>
          ：</td>
        <td height="26"><input type="text" name="memberName" size="30" class="textBox" value="${member.memberName}" require="true" dataType="Require" msg="真实姓名不能为空!"/></td>
      </tr>
      <tr bgcolor="#F7F3F7">
        <td width="260" height="26" class="text" align="right"><bean:message key="member.login.name"/>
          ：</td>
        <td height="26"><input type="text" name="loginName" size="30" class="textBox" value="${member.loginName}" require="true" dataType="Require" msg="登录名不能为空!"/></td>
      </tr>
      <tr bgcolor="#F7F3F7">
        <td width="260" height="26" class="text" align="right"><bean:message key="member.login.pwd"/>
          ：</td>
        <td height="26"><input type="password" name="loginPwd" size="30" class="textBox"/></td>
      </tr>
      <tr bgcolor="#F7F3F7">
        <td width="260" height="26" class="text" align="right"><bean:message key="member.login.repwd"/>
          ：</td>
        <td height="26"><input name="password" type="password" class="textBox" id="reLoginPwd" onBlur="checkPwd()" size="30"/></td>
      </tr>
      <tr bgcolor="#F7F3F7">
        <td width="260" height="26" class="text" align="right"><bean:message key="member.phone"/>
          ：</td>
        <td height="26"><input type="text" name="phone" size="30" class="textBox" value="${member.phone}" require="true" dataType="Phone" msg="联系电话不正确!"/></td>
      </tr>
      <tr bgcolor="#F7F3F7">
        <td width="260" height="26" class="text" align="right"><bean:message key="member.address"/>
          ：</td>
        <td height="26"><input type="text" name="address" size="30" class="textBox" value="${member.address}" require="true" dataType="Require" msg="联系地址不能为空!"/></td>
      </tr>
      <tr bgcolor="#F7F3F7">
        <td width="260" height="26" class="text" align="right"><bean:message key="member.zip"/>
          ：</td>
        <td height="26"><input type="text" name="zip" size="30" class="textBox" value="${member.zip}" require="true" dataType="Zip" msg="邮政编码不正确!"/></td>
      </tr>
      <tr bgcolor="#F7F3F7">
        <td width="260" height="26" class="text" align="right"><bean:message key="member.email"/>
          ：</td>
        <td height="26"><input type="text" name="email" size="30" class="textBox" value="${member.email}" require="false" dataType="Email" msg="电子邮箱不正确!"/></td>
      </tr>
      <tr>
        <td height="40" colspan="2" align="center">
			<input class="C_Input" type="submit" value="保存"/>
	   </td>
      </tr>
    </table>
	</form> 
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
	
	//密码核对
	function checkPwd(){
		if (document.all.loginPwd.value != document.all.reLoginPwd.value){
			alert('对不起，两次输入的密码不一致，请重新输入！');
			document.all.loginPwd.value = "";
			document.all.reLoginPwd.value ="";
			document.all.loginPwd.focus();
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
<logic:messagesPresent property="modiMemberStatus">
	<script language="javascript">
		alert('<html:errors property="modiMemberStatus"/>');
	</script>
</logic:messagesPresent>	
</body>
</html>