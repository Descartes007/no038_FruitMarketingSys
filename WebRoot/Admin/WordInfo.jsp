<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/struts-bean" prefix="bean"%> 
<%@ taglib uri="/struts-html" prefix="html"%> 
<%@ taglib uri="/struts-logic" prefix="logic" %>
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
          <logic:notPresent name="word">
            <tr align="center">
              <td colspan="2" height="30" class="redText"><bean:message key="word.notExist"/></td>
            </tr>
          </logic:notPresent>
          <logic:present name="word">
            <tr><td height="10" colspan="2"></td></tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="word.title"/>
                ：</td>
              <td>&nbsp;${word.title}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="word.user"/>
                ：</td>
              <td>&nbsp;${word.member.memberName}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="word.date"/>
                ：</td>
              <td>&nbsp;${word.leaveDate}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="word.content"/>
                ：</td>
              <td>&nbsp;${word.content}</td>
            </tr>
            <tr>
              <td width="160" height="30" align="right"><bean:message key="answer.text"/>
                ：</td>
              <td>&nbsp;
				<form name="form1" action="adminMember.do?method=answerWord" method="post" style="margin:0px;">		              
				  	<textarea class="textBox" id="answerContent" name="answerContent" rows="6" cols="60">${word.answerContent}</textarea>
					<input type="hidden" name="id" value="${word.id}"/>
				</form>							  	
			  </td>
            </tr>
            <tr>
              <td height="40" colspan="2" align="center"><input type="button" value='<bean:message key="word.answer"/>' onClick="checkForm()"/></td>
            </tr>
            <tr><td height="10" colspan="2"></td></tr>
          </logic:present>
        </table>
		</td>
      </tr>
  </table>
  <center>
	<html:link page="/Admin/adminMember.do?method=browseWord">
		<span><bean:message key="return.text"/></span>
	</html:link>
  </center>
 <script language="javascript">
 	//表单验证
	function checkForm(){
		if (document.all.answerContent.value==''){
			alert("回复内容不能为空！");
			return false;
		}else{
				document.form1.submit();
		}
	}
 </script>
</body>
</html>