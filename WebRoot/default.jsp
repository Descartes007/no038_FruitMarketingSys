<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="/struts-bean" prefix="bean" %>
<%@ taglib uri="/struts-html" prefix="html" %>
<%@ taglib uri="/struts-logic" prefix="logic" %>
<html>
<head>
<title></title>
<link href="CSS/stylesheet.css" rel="stylesheet" type="text/css">
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
    <TD height="50" align="right" valign="bottom"><IMG src="images/icon_login.gif" align="absmiddle"> 
		<INPUT id="qKey" name="qKey" value="水果关键字" onClick="this.value=''"> 
        <select id="category">
       		<option value="0">所有水果</option>
		  	<logic:present name="cateList">
		  		<logic:iterate id="cate" name="cateList" type="com.ORM.Category">
					<option value="${cate.id}">${cate.cateName}</option>					  		
		  		</logic:iterate>
		  	</logic:present>	       	
        </select>		
		<A href="javascript:QuickSearch()"><IMG src="images/icon_search.gif" align="absmiddle" border="0"></A>  &nbsp;&nbsp;&nbsp;
		<A href="Admin/adminLogin.jsp">后台管理</A>  	
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
        <td width="200" valign="top"><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
            <TR>
              <TD><IMG src="images/Bule_43.gif"></TD>
            </TR>
            <TR>
              <TD class="C_Item_bg">
              	<logic:present name="member">
				  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TR>
                      <TD class="C_login_Title"><bean:message key="member.login.label"/></TD>
                    </TR>
                    <TR>
                      <TD>
						  <TABLE cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
	                           <TR height="10"><TD></TD></TR>						  
	                           <TR height="30" class="text">
	                             <TD><bean:message key="member.logined" arg0="${member.memberName}" arg1="${member.memberlevel.levelName}"/></TD>
	                           </TR>
	                           <TR height="30">
	                             <TD align="center">
	                   			   <a href="login.do?method=logout"><span class="blueText"><bean:message key="member.logout"/></span></a>          
							    </TD>
	                         </TR>
                      </TABLE> 
					</TR>
				  </TABLE>              	
              	</logic:present>
              	<logic:notPresent name="member">
	                <html:javascript formName="memLoginForm"/>
					<html:form action="/login.do?method=login" style="margin:0px;" onsubmit="return validateMemLoginForm(this);">
					  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
	                    <TR>
	                      <TD class="C_login_Title"><bean:message key="member.login.label"/></TD>
	                    </TR>
	                    <TR>
	                      <TD>
							  <TABLE cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
		                           <TR height="30">
		                             <TD class="text"><bean:message key="member.login.name"/>：
								 	<html:text property="loginName" size="10" styleClass="textBox"/>
								  </TD>
		                           </TR>
		                           <TR height="30">
		                             <TD class="text"><bean:message key="member.login.pwd"/>：
									  <html:password property="loginPwd" size="10" styleClass="textBox"/>
								  </TD>
		                           </TR>
		                           <TR height="30">
		                             <TD class="UserRegster" align="right">
		                               <html:button property="btn" onclick="reg()"><bean:message key="member.reg.text"/></html:button>
								  	<html:submit><bean:message key="member.login.text"/></html:submit>
								  </TD>
		                         </TR>
	                      </TABLE> 
						</TR>
					  </TABLE>
					  <logic:messagesPresent>
					  	<script language="javascript">
					  		alert('<html:errors property="loginError"/>');
					  	</script>
					  </logic:messagesPresent>
					</html:form>              	
              	</logic:notPresent>
			  </TD>
            </TR>
            <TR>
              <TD><IMG src="images/Bule_58.gif"></TD>
            </TR>
          </TABLE>
          <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TR>
                <TD><IMG src="images/Bule_43.gif"></TD>
              </TR>
              <TR>
                <TD class="C_Item_bg" valign="top">
					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					  <TR>
						<TD class="C_Sort_Title"><bean:message key="mer.category"/></TD>
					  </TR>
					  <logic:notPresent name="cateList">
						  <TR>
							<TD class="redText"><bean:message key="cate.notExist"/></TD>
						  </TR>					  
					  </logic:notPresent>
					  <TR height="10"><TD></TD></TR>	
					  <logic:present name="cateList">
					  	<logic:iterate id="cate" name="cateList" type="com.ORM.Category">
						  <TR>
							<TD class="text">
								&nbsp;<img src="images/cateIcon.gif" border="0">
								<a href="mer.do?method=searchMer&cateid=${cate.id}">${cate.cateName}</a>
							</TD>
						  </TR>						  		
					  	</logic:iterate>
					  </logic:present>
					</TABLE>
				</TD>
              </TR>
              <TR>
                <TD><IMG src="images/Bule_58.gif"></TD>
              </TR>
          </TABLE></td>
        <td width="20">&nbsp;</td>
        <td valign="top"><br>
		<TABLE class="C_Goods_Title" cellSpacing=0 cellPadding=0 width="100%" border=0>			
			<TR>
			  <TD><IMG hspace=5 src="images/Icon_TeJia.gif"></TD>
			  <TD>&nbsp;</TD>
			  <TD align="right">
			  	<A href="mer.do?method=browseSMer"><IMG hspace=5 src="images/icon_more.gif" border=0></A>
			  </TD>
			</TR>
          </TABLE>
          <TABLE class="C_Goods_Border" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TR>
           		<logic:notPresent name="smerList">
           			<TD valign="top" class="redText" colspan="3">
           				<bean:message key="mer.notExist"/>
           			</TD>
           		</logic:notPresent>
           		<logic:present name="smerList">
					<logic:iterate id="mer" name="smerList" type="com.ORM.Merchandise">
		               <TD valign="top" width="33%">
					 	<table cellspacing=0 cellpadding=0 width=180 border=0>
		                 <tr>
		                   <td align="TOP">
							<table width="118" height="118" border="0" align="center" cellpadding="0" cellspacing="0" style="border:1px; border-style:solid; border-color:#888888">
								<tr align="center" valign="middle">
								  <td><a href="mer.do?method=showMer&id=${mer.id}" target=_blank> <img src=".${mer.picture}" width="100" height="100" border="0"> </a></td>
								</tr>
							</table>
							</td>
		                 </tr>
		                 <tr align="center" height="30">
		                   <td><a href="mer.do?method=showMer&id=${mer.id}" target=_blank><span  class="blueText">${mer.merName}</span></a></td>
		                 </tr>
		                 <tr align="center" height="20">
		                   <td class="text"><bean:message key="mer.price"/>： ￥${mer.price} </td>
		                 </tr>
		                 <tr align="center" height="20">
		                   <td class="text"><bean:message key="mer.sprice"/>： ￥${mer.sprice} </td>
		                 </tr>
		                 <tr>
		                   <td>
							<a href="mer.do?method=showMer&id=${mer.id}"><img src="images/icon_car.gif" border=0></a> 
							<a href="cart.do?method=addCart&id=${mer.id}"><img alt="" src="images/icon_buy.gif" border=0></a>
						  </td>
		                 </tr>
		               </table>
		               </TD>						
					</logic:iterate>
           		</logic:present>
			  </TR>
          </TABLE><br>		  
		  <TABLE class=C_Goods_Title cellSpacing=0 cellPadding=0 width="100%" border=0>            
            <TR>
              <TD><IMG hspace=5 src="images/NewGoods_03.gif"></TD>
              <TD>&nbsp;</TD>
              <TD align=right><A href="mer.do?method=browseMer"><IMG hspace=5 src="images/icon_more.gif" border=0></A></TD>
            </TR>
          </TABLE>
          <TABLE class="C_Goods_Border" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TR>
           		<logic:notPresent name="merList">
           			<TD valign="top" class="redText" colspan="3">
           				<bean:message key="mer.notExist"/>
           			</TD>
           		</logic:notPresent>
           		<logic:present name="merList">
					<logic:iterate id="mer" name="merList" type="com.ORM.Merchandise">
		               <TD valign="top" width="33%">
					 	<table cellspacing=0 cellpadding=0 width=180 border=0>
		                 <tr>
		                   <td align="TOP">
							<table width="118" height="118" border="0" align="center" cellpadding="0" cellspacing="0" style="border:1px; border-style:solid; border-color:#888888">
								<tr align="center" valign="middle">
								  <td><a href="mer.do?method=showMer&id=${mer.id}" target=_blank> <img src=".${mer.picture}" width="100" height="100" border="0"> </a></td>
								</tr>
							</table>
							</td>
		                 </tr>
		                 <tr align="center" height="30">
		                   <td><a href="mer.do?method=showMer&id=${mer.id}" target=_blank><span  class="blueText">${mer.merName}</span></a></td>
		                 </tr>
		                 <tr align="center" height="20">
		                   <td class="text"><bean:message key="mer.price"/>： ￥${mer.price} </td>
		                 </tr>
		                 <tr>
		                   <td class=GoodsItem_buy>
							<a href="mer.do?method=showMer&id=${mer.id}"><img src="images/icon_car.gif" border=0></a> 
							<a href="cart.do?method=addCart&id=${mer.id}"><img alt="" src="images/icon_buy.gif" border=0></a>
						  </td>
		                 </tr>
		               </table>
		               </TD>						
					</logic:iterate>
           		</logic:present>
			  </TR>
          </TABLE>          
		  </td>
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
	//会员注册
	function reg(){
		window.location = "reg.jsp";
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