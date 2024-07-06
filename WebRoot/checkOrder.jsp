<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="/struts-bean" prefix="bean" %>
<%@ taglib uri="/struts-html" prefix="html" %>
<%@ taglib uri="/struts-logic" prefix="logic" %>
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
		<A href="javascript:QuickSearch()"><IMG src="images/icon_search.gif" align="absMiddle" border="0"></A>    </TD>
    <td width="20">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TR align="center">
          <TD valign="top" width="9"><IMG src="images/icon02.gif"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="mer.do?method=browseIndexMer"><span class="whiteTitle"><bean:message key="menu.item1"/></span></A>		  </TD>
		  	
          <TD background="images/Bule_06.gif" width="2"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="gsjj.jsp"><span class="whiteTitle">网站简介</span></A>
		  </TD>		  	
		  	
		  	
          <TD background="images/Bule_06.gif" width="2"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="cart.do?method=browseCart"><span class="whiteTitle"><bean:message key="menu.item2"/></span></A>		  </TD>
          <TD background="images/Bule_06.gif" width="2"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="order.do?method=browseOrder"><span class="whiteTitle"><bean:message key="menu.item3"/></span></A>		  </TD>
          <TD background="images/Bule_06.gif" width="2"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="mem.do?method=browseWord"><span class="whiteTitle"><bean:message key="menu.item4"/></span></A>		  </TD>
          <TD background="images/Bule_06.gif" width="2"></TD>
          <TD class="header_menu" align="middle">
		  	<A href="mem.do?method=loadMember"><span class="whiteTitle"><bean:message key="menu.item5"/></span></A>		  </TD>
          <TD vAlign=top width=7><IMG src="images/icon07.gif"></TD>
        </TR>
    </TABLE></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="60"><img src="images/Car_icon_04.gif" /></td>
      </tr>
      <tr>
        <td><table cellspacing="0" cellpadding="0" border="0">
            <tr valign="center">
              <td><img hspace="5" src="images/Car_07.gif" /></td>
              <td class="C_Carbg_Default"><bean:message key="cart.step1"/></td>
              <td><img height="39" src="images/Car_15.gif" width="1" /></td>
              <td align="middle"><img hspace="5" src="images/Car_09.gif" /></td>
              <td class="C_Carbg_Current"><bean:message key="cart.step2"/></td>
              <td><img height="39" src="images/Car_15.gif" width="1" /></td>
              <td align="middle"><img hspace="5" src="images/Car_11.gif" /></td>
              <td class="C_Carbg_Default"><bean:message key="cart.step3"/></td>
              <td><img height="39" src="images/Car_15.gif" 
              width="1" /></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td>
			<form name="form1" action="cart.do?method=submitOrder" method="post" style="margin:0px;">
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
            <tr bgcolor="#F7F3F7" class="text">
              <td width="260" height="26" align="right"><bean:message key="member.level"/>：</td>
              <td>&nbsp;${member.memberlevel.levelName}</td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="260" height="26" align="right"><bean:message key="order.favourable"/>：</td>
              <td>&nbsp;${member.memberlevel.favourable}<bean:message key="order.zhe"/></td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="260" height="26" align="right"><bean:message key="order.consignee"/>：</td>
              <td>&nbsp;<input type="text" name="memName" id="memName" class="textBox" size="40" value="${member.memberName}"></td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="260" height="26" align="right"><bean:message key="order.phone"/>：</td>
              <td>&nbsp;<input type="text" name="phone" id="phone" class="textBox" size="40" value="${member.phone}"></td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="260" height="26" align="right"><bean:message key="order.zip"/>：</td>
              <td>&nbsp;<input type="text" name="zip" id="zip" class="textBox" size="40" value="${member.zip}"></td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="260" height="26" align="right"><bean:message key="order.address"/>：</td>
              <td>&nbsp;<input type="text" name="address" id="address" class="textBox" size="40" value="${member.address}"></td>
            </tr>							
        </table>
		</form>
		</td>
      </tr>
	  <tr height="20"><td></td></tr>	  
      <tr align="center">
        <td>
			<img style="CURSOR: hand" onclick="pre()" src="images/Car_icon_back.gif" border="0" />
			<img src="images/Car_icon_06.gif" width="137" height="40" border="0" style="CURSOR: hand" onclick="next()" />		</td>
      </tr>

      <tr align="right">
        <td height="20">&nbsp;</td>
      </tr>
    </table></td>
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
	
	//搜索水果
	function QuickSearch(){
		var url = "mer.do?method=searchMer&cateid="+document.all.category.value;
		var key = document.all.qKey.value;
		if (key !=null && key!="水果关键字" && key.length>0)url = url+"&key="+key;
		window.location = url;
	}
	
	//进入上一步
	function pre(){
		var url = "cart.do?method=browseCart";
		window.location = url;
	}	

	//进入下一步
	function next(){
		if (document.all.memName.value==''){
			alert('收货人姓名不能为空！');
		}else if (document.all.phone.value==''){
			alert('收货人电话不能为空！');
		}else if (document.all.zip.value==''){
			alert('收货人邮编不能为空！');
		}else if (document.all.address.value==''){
			alert('收货人地址不能为空！');
		}else{
			document.all.form1.submit();
		}				
	}		
</script>
</body>
</html>