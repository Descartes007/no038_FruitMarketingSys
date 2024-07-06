<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/struts-bean" prefix="bean"%> 
<%@ taglib uri="/struts-html" prefix="html"%> 
<%@ taglib uri="/struts-logic" prefix="logic" %>
<jsp:useBean id="JSONRPCBridge" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge"/>
<jsp:useBean id="ajax" class="com.base.AjaxBean"></jsp:useBean>
<%
	JSONRPCBridge.registerObject("ajax",ajax);
%>
<html> 
	<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="../CSS/stylesheet.css">
	<script type="text/javascript" src="../JS/jsonrpc.js"></script>				
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
	<table border="0" align="center" cellpadding="0" cellspacing="0" style="background-color:#c0ebf3; border:0px;">
	  <tr>
		<td height="40" class="itemTitle" align="center"><bean:message key="member.info"/></td>
	  </tr>
	  <tr>
	    <td height="30" align="center">
		<table width="94%" border="0" cellpadding="0" cellspacing="0">
          <logic:notPresent name="member">
            <tr align="center">
              <td colspan="2" height="30" class="redText"><bean:message key="member.notExist"/></td>
            </tr>
          </logic:notPresent>
          <logic:present name="member">
            <tr><td height="10" colspan="2"></td></tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="member.level"/>
                ：</td>
              <td>&nbsp;<select id="memberlevel"/>
			  	<input type="button" value='<bean:message key="member.modiLevel"/>' onClick="updateLevel(${member.id})"/>
			  </td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="member.login.name"/>
                ：</td>
              <td>&nbsp;${member.loginName}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="member.realname"/>
                ：</td>
              <td>&nbsp;${member.memberName}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="member.phone"/>
                ：</td>
              <td>&nbsp;${member.phone}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="member.address"/>
                ：</td>
              <td>&nbsp;${member.address}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="member.zip"/>
                ：</td>
              <td>&nbsp;${member.zip}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="member.email"/>
                ：</td>
              <td>&nbsp;${member.email}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="member.regdate"/>
                ：</td>
              <td>&nbsp;${member.regDate}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="member.logintimes"/>
                ：</td>
              <td>&nbsp;${member.loginTimes}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="member.lastdate"/>
                ：</td>
              <td>&nbsp;${member.lastDate}</td>
            </tr>
			
            <tr><td height="10" colspan="2"></td></tr>
          </logic:present>
        </table>
		</td>
      </tr>
  </table>
  <center>
	<html:link page="/Admin/adminMember.do?method=browseMember">
		<span><bean:message key="return.text"/></span>
	</html:link>
  </center>
<script language="javascript">
	//构造会员级别下拉列表
	jsonrpc = new JSONRpcClient("../JSON-RPC");
	var result = jsonrpc.ajax.getMemberLevel();
	for (var i=0;i<result.length;i++){
		option =document.createElement("OPTION");
		option.value = result[i][0];
		option.text = result[i][1];
		document.all.memberlevel.options.add(option);
	}
	for (var j=0;j<document.all.memberlevel.options.length;j++){
		if(document.all.memberlevel.options[j].value=='${member.memberlevel.id}')
		document.all.memberlevel.options[j].selected = true;
	}
	
	//调整会员级别
	function updateLevel(mId){
		var levelName = document.all.memberlevel.value;
		if (jsonrpc.ajax.updateLevel(mId,levelName)){
			alert('<bean:message key="member.modiLevel.suc"/>');
		}else{
			alert('<bean:message key="member.modiLevel.fail"/>');
		}		
	}
</script>
</body>
</html>