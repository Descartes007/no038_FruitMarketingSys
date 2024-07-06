<%@ page language="java" pageEncoding="gb2312"%>
<%@ taglib uri="/struts-bean" prefix="bean"%> 
<%@ taglib uri="/struts-html" prefix="html"%> 
<%@ taglib uri="/struts-logic" prefix="logic" %>
<html> 
	<head>
		<title></title>
		<link rel="stylesheet" type="text/css" href="../CSS/stylesheet.css">
		<link rel="stylesheet" type="text/css" href="../CSS/displaytag.css" />		
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
		<td height="40" class="itemTitle" align="center"><bean:message key="order.view"/></td>
	  </tr>
	  <tr>
	    <td height="30" align="center">
		<table width="94%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
          <logic:notPresent name="order">
            <tr align="center" bgcolor="#F7F3F7">
              <td colspan="2" height="26" class="redText"><bean:message key="order.notExist"/></td>
            </tr>
          </logic:notPresent>
          <logic:present name="order">
            <tr bgcolor="#F7F3F7"><td height="10" colspan="2"></td></tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="220" height="26" align="right"><bean:message key="order.no"/>
                ：</td>
              <td>&nbsp;${order.orderNo}</td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="220" height="26" align="right"><bean:message key="sel.money"/>
                ：</td>
              <td>&nbsp;￥${order.cart.money}</td>
            </tr>
            <fmt:formatDate value="${order.orderDate}" var="orderDateTime" type="both" pattern="yyyy年MM月dd日 hh:mm:ss"/>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="220" height="26" align="right"><bean:message key="order.date"/>
                ：</td>
              <td>&nbsp;${orderDateTime}</td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="220" height="26" align="right"><bean:message key="member.level"/>
                ：</td>
              <td>&nbsp;${order.member.memberlevel.levelName}</td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="220" height="26" align="right"><bean:message key="order.favourable"/>
                ：</td>
              <td>&nbsp;${order.member.memberlevel.favourable}
                  <bean:message key="order.zhe"/></td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="220" height="26" align="right"><bean:message key="order.consignee"/>
                ：</td>
              <td>&nbsp;${order.member.memberName}</td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="220" height="26" align="right"><bean:message key="order.phone"/>
                ：</td>
              <td>&nbsp;${order.member.phone}</td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="220" height="26" align="right"><bean:message key="order.zip"/>
                ：</td>
              <td>&nbsp;${order.member.zip}</td>
            </tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td width="220" height="26" align="right"><bean:message key="order.address"/>
                ：</td>
              <td>&nbsp;${order.member.address}</td>
            </tr>
            <tr bgcolor="#F7F3F7"><td height="10" colspan="2"></td></tr>
            <tr bgcolor="#F7F3F7" class="text">
              <td height="40" colspan="2" align="center" bgcolor="#FFFFFF" valign="bottom"></td>
            </tr>
          </logic:present>
        </table>
		  <div align="center" class="itemTitle"><bean:message key="order.list"/></div>
		  <table cellspacing="1" cellpadding="0" width="100%" border="0" bgcolor="#F7F3F7">
			  <tr height="30" bgcolor="#F7F3F7">
				<td class="blackTitle" align="center"><bean:message key="mer.name"/></td>
				<td class="blackTitle" align="center"><bean:message key="mer.price"/></td>
				<td class="blackTitle" align="center"><bean:message key="sel.price"/></td>
				<td class="blackTitle" align="center"><bean:message key="sel.number"/></td>
				<td class="blackTitle" align="center"><bean:message key="sel.money"/></td>
			  </tr>
			  <logic:iterate id="row" name="result" type="java.util.Map">
				<tr class="text" align="center" bgcolor="#FFFFFF">
				  <td>&nbsp;${row.merName}</td>
				  <td>￥${row.price}</td>
				  <td>￥${row.memprice}</td>
				  <td>${row.number}</td>
				  <td>￥${row.money}</td>
				</tr>
			  </logic:iterate>
			  <tr height="10" bgcolor="#F7F3F7">
				<td colspan="5"></td>
			  </tr>
		  </table>		
		</td>
      </tr>
  </table>
  <center>
	<html:link page="/Admin/adminOrder.do?method=browseOrder">
		<span class="redText"><bean:message key="return.text"/></span>
	</html:link>
  </center>
  </body>
</html>