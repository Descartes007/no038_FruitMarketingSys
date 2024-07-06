<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="/struts-bean" prefix="bean" %>
<%@ taglib uri="/struts-html" prefix="html" %>
<%@ taglib uri="/struts-logic" prefix="logic" %>
<jsp:useBean id="JSONRPCBridge" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge"/>
<jsp:useBean id="ajax" class="com.base.AjaxBean"></jsp:useBean>
<%
	JSONRPCBridge.registerObject("ajax",ajax);

	//得到本页的参数内容
	int totals=0,totalPages=1,pageNo=1,prePageNo=1,nextPageNo=1,preOk=1,nextOk=1;
	String action = "mer.do?method=browseSMer&";
	if (request.getAttribute("totals")!=null) totals = Integer.parseInt(request.getAttribute("totals").toString());
	if (request.getAttribute("totalPages")!=null) totalPages = Integer.parseInt(request.getAttribute("totalPages").toString());
	if (request.getAttribute("pageNo")!=null) pageNo = Integer.parseInt(request.getAttribute("pageNo").toString());
	if (totalPages<1)totalPages=1;
	
	//计算上一页和下一页的页码及按钮的状态
	prePageNo = pageNo;
	nextPageNo = pageNo;
	if (pageNo > 1) prePageNo--;
		else prePageNo = 1;
	if (pageNo < totalPages) nextPageNo++;
		else nextPageNo = totalPages;
	if (pageNo == 1) preOk=0;
	if (pageNo == totalPages) nextOk=0;
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
		<IMG src="images/icon_login.gif" align="absmiddle"> 
		<INPUT id="qKey" name="qKey" value="水果关键字" onClick="this.value=''"> 
        <select id="category">
       	<option value="0">所有水果</option>
		  <logic:present name="cateList">
		  	<logic:iterate id="cate" name="cateList" type="com.ORM.Category">
				<option value="${cate.id}">${cate.cateName}</option>					  		
		  	</logic:iterate>
		  </logic:present>	       	
        </select>		
		<A href="javascript:QuickSearch()"><IMG src="images/icon_search.gif" align="absmiddle" border="0"></A>    	
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
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><br>
		<TABLE width="96%" border=0 align="center" cellPadding=0 cellSpacing=0 class="C_Goods_Title">			
			<TR>
			  <TD><IMG hspace=5 src="images/NewGoods_05.gif"></TD>
			  </TR>
          </TABLE>
          <table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#F7F3F7">
            <tr bgcolor="#F7F3F7" valign="middle" align="center">
              <td height="30" class="blackTitle"><bean:message key="mer.picture"/></td>
              <td height="30" class="blackTitle"><bean:message key="mer.base.info"/></td>
              <td height="30" class="blackTitle"><bean:message key="mer.desc"/></td>
              <td height="30" class="blackTitle"><bean:message key="mer.base.option"/></td>
            </tr>
			<logic:notPresent name="smerList">
				<tr>
				  <td colspan="4" height="26" class="redText">&nbsp;<bean:message key="mer.notExist"/></td>
				</tr>
			</logic:notPresent>
			<logic:present name="smerList">
				<logic:iterate id="mer" name="smerList" type="com.ORM.Merchandise">
					<tr valign="middle" bgcolor="#FFFFFF">
					  <td width="100" align="center" >
						<a href="mer.do?method=showMer&id=${mer.id}" target=_blank> <img src=".${mer.picture}" width="60" height="60" border="1"> </a>
					  </td>
					  <td width="160" class="text">
						  <a href="mer.do?method=showMer&id=${mer.id}" target=_blank><span  class="blueText">${mer.merName}</span></a><br>
						  <bean:message key="mer.price"/>： ￥${mer.price}<br>
						  <bean:message key="mer.sprice"/>： ￥${mer.sprice}<br>
						  <bean:message key="mer.manufacturer"/>：${mer.manufacturer}<br>
					  </td>
					  <td class="text">${mer.merDesc}</td>
					  <td width="100">
						<a href="mer.do?method=showMer&id=${mer.id}"><img src="images/icon_car.gif" border=0></a><br>
						<a href="cart.do?method=addCart&id=${mer.id}"><img alt="" src="images/icon_buy.gif" border=0></a>
					  </td>
					</tr>
					<tr>
					  <td colspan="4" height="2" bgcolor="#F7F3F7"></td>
					</tr>				
				</logic:iterate>
			</logic:present>
            <tr>
              <td colspan="4" height="30" bgcolor="#F7F3F7" class="text" align="center">
				<a href="<%=action%>pageNo=1" class="blueText"><span class="blueText">首页</span></a>&nbsp;
				<%if (preOk==1){%>
					<a href="<%=action%>pageNo=<%=prePageNo%>" class="blueText"><span class="blueText">上一页</span></a>&nbsp;
				<%}else{%>
					<span class="grayText">上一页</span>&nbsp;
				<%}%>
				<%if (nextOk==1){%>
					<a href="<%=action%>pageNo=<%=nextPageNo%>" class="blueText"><span class="blueText">下一页</span></a>&nbsp;
				<%}else{%>
					<span class="grayText">下一页</span>&nbsp;
				<%}%>
					<a href="<%=action%>pageNo=<%=totalPages%>" class="blueText"><span class="blueText">末页</span></a>　
				去第<input type="text" id="willGoPage" name="willGoPage" class="control" size="2" onKeyPress="return isNumber()">
				页<input type="button" class="button" id="go" value="GO" name="go" onClick="goPage()">   　
				第<span class="redText"><%=pageNo%></span>页/共<span class="redText"><%=totalPages%></span>页　
			总数<span class="redText"><%=totals%></span>			  
			  </td>
            </tr>
          </table></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="30" bgcolor="green" class="whiteText" align="center">
		<bean:message key="website.foot"/>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" colspan="3">&nbsp;</td>
  </tr>
</table>
<script type="text/javascript">
	//构造水果类别下拉列表
	jsonrpc = new JSONRpcClient("JSON-RPC");
	var result = jsonrpc.ajax.getCategory();
	for (var i=0;i<result.length;i++){
		option =document.createElement("OPTION");
		option.value = result[i][0];
		option.text = result[i][1];
		document.all.category.options.add(option);
	}

	//是否输入数字
	function isNumber(){
		return ((event.keyCode>47)&&(event.keyCode<58));
	}
	
	//响应“GO”按钮
	function goPage(goPageNo){
		var maxPageNo = <%=totalPages%>;
		var goPageNo = document.all.willGoPage.value;
		var url = "<%=action%>pageNo="+goPageNo;
		if (goPageNo<1 || goPageNo>maxPageNo || goPageNo==''){
			alert("对不起，您输入的页号无效，请您核对后重新输入！");
			return ;
		}else
		{
			window.location = url;
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