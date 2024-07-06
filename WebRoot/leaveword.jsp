<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="/struts-bean" prefix="bean" %>
<%@ taglib uri="/struts-html" prefix="html" %>
<%@ taglib uri="/struts-logic" prefix="logic" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="JSONRPCBridge" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge"/>
<jsp:useBean id="ajax" class="com.base.AjaxBean"></jsp:useBean>
<%
	JSONRPCBridge.registerObject("ajax",ajax);
	
	//得到本页的参数内容
	int totals=0,totalPages=1,pageNo=1,prePageNo=1,nextPageNo=1,preOk=1,nextOk=1;
	String action = "mem.do?method=browseWord&";
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
        <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
          <tr>
            <td height="40"><img src="images/icon_liuyan.gif" /></td>
          </tr>
          <tr>
            <td height="26" align="center">
			<logic:notPresent name="wordList">
				<span class="redText"><bean:message key="word.empty"/></span>
			</logic:notPresent>
			<logic:present name="wordList">
			  <logic:iterate id="word" name="wordList" type="com.ORM.Leaveword">
				<fmt:formatDate value="${word.leaveDate}" var="leaveDate" type="both" pattern="yyyy年MM月dd日"/>			
				<table width="90%" border="0" cellpadding="4" cellspacing="0" style="border:1px; border-color:black; border-style:solid;">
				  <tr bgcolor="#F7F3F7">
					<td class="text"><span class="blackTitle"><bean:message key="word.title"/></span>：${word.title}</td>
					<td align="right" class="text">
						<span class="blackTitle">
						<bean:message key="word.user"/></span>：${word.member.memberName}&nbsp;
						<span class="blackTitle"><bean:message key="word.date"/></span>：${leaveDate}</td>
				  </tr>
				  <tr>
					<td class="text" colspan="2">${word.content}</td>
				  </tr>
				  <logic:present name="word" property="answerContent">
				  <tr>
					<td colspan="2" bgcolor="#F7F3F7" class="blackTitle"><bean:message key="answer.text"/>：</td>
				  </tr>
				  <tr>
					<td class="text" colspan="2">${word.answerContent}</td>
				  </tr>
				  </logic:present>
				</table>
				<table cellpadding="0" cellspacing="0"><tr height="10"><td></td></tr></table>
			</logic:iterate>
		</logic:present>			</td>
          </tr>
          <tr bgcolor="#F7F3F7">
            <td height="26" bgcolor="#FFFFFF" align="center" class="text">
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
          <tr bgcolor="#F7F3F7">
            <td height="26" bgcolor="#FFFFFF">
			<form name="form1" action="mem.do?method=addWord" method="post" style="margin:0px;">
			   <table width="94%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td colspan="2"><img src="images/icon_LeaveWord.gif" width="140" height="45" /></td>
                  </tr>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="30" align="right" class="blackTitle"><bean:message key="word.title"/>：</td>
                    <td height="30"><input type="text" id="wordTitle" name="wordTitle" class="textBox" size="61"/></td>
                  </tr>
                  <tr>
                    <td align="right" class="blackTitle"><bean:message key="word.content"/>：</td>
                    <td><textarea id="content" name="content" rows="4" cols="60" class="textBox"></textarea></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td height="35"><input type="button" class="C_Input" onClick="checkForm()" value="提交留言"/></td>
                  </tr>
            </table>
			</form>
			</td>
          </tr>
        </table></td>
      </tr>
	  <tr height="20"><td colspan="5"></td></tr>      
      <tr align="right">
        <td height="20">&nbsp;</td>
      </tr>
    </table>
	</td>
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
	
	//检测留言表单
	function checkForm(){
		if (document.all.wordTitle.value==''){
			alert("对不起，留言标题不能为空！");
		}else if (document.all.content.value==''){
			alert("对不起，留言内容不能为空！");
		}else{
			document.all.form1.submit();
		}
	}
</script>
<logic:messagesPresent property="addWordStatus">
	<script language="javascript">
		alert('<html:errors property="addWordStatus"/>');
	</script>
</logic:messagesPresent>
</body>
</html>