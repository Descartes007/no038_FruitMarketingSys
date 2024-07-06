<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="/struts-bean" prefix="bean" %>
<jsp:include page="isLogined.jsp"/>
<html>
<head>
<title></title>
<STYLE type=text/css>
	.navPoint{
		FONT-SIZE: 9pt; CURSOR: hand; COLOR: black; FONT-FAMILY: Webdings
	}
	.main {
		font-size: 9px;
		background-color: #c0ebf3;
	}
</STYLE>
</head>
<body style="MARGIN:0px" scroll=no>
<SCRIPT>
	if(self!=top){top.location=self.location;}
	function switchSysBar(){
		if (switchPoint.innerText==3){
			switchPoint.innerText=4;
			document.all("frmTitle").style.display="none";
		} else {
			switchPoint.innerText=3;
			document.all("frmTitle").style.display="";
		}
	}
</SCRIPT>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
<TR><TD id=frmTitle vAlign=center noWrap align=middle>
<script language="javascript">
	var table_width = 180;
	var left_url = "../adminMenu.jsp";
	
	if (navigator.appName=="Netscape") {
		left_url = "../adminMenu.jsp"; 
	}
	
	if(screen.availWidth==800) {    
		document.write("<IFRAME id=menu style='Z-INDEX: 2; VISIBILITY: inherit; WIDTH: 180px; HEIGHT: 100%' name=menu src='");
		document.write(left_url);
		document.write("'");
		document.write(" frameBorder=0 scrolling=no></IFRAME></TD>");
	} else if (screen.availWidth>=1024) {
		table_width = 180;
		document.write("<IFRAME id=menu style='Z-INDEX: 2; VISIBILITY: inherit; WIDTH: 180px; HEIGHT: 100%' name=menu src='");
		document.write(left_url);
		document.write("'");
		document.write(" frameBorder=0 scrolling=no></IFRAME></TD>");
	}
</script>
	<TD style="WIDTH: 9pt" class="main">
		<TABLE height="100%" border=0 cellPadding=0 cellSpacing=0 background="../images/onOffLeft_back.jpg" style="border-left:1px; border-right:1px; border-color:#d4d0c8; border-style:solid; ">
		<TR><TD style="HEIGHT: 100%" onclick=switchSysBar()>
			<FONT style="FONT-SIZE: 9pt; CURSOR: default;" color="000000"><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
			<SPAN class=navPoint style="font-size: 9pt;" id=switchPoint title=¹Ø±Õ/´ò¿ª×óÀ¸>3</SPAN><BR>
			<BR><BR><BR><BR><BR><BR><BR>
			</FONT><br>
		</TD></TR>
		</TABLE>
	</TD>
	<TD style="WIDTH: 100%">
		<IFRAME name="frame1" style="Z-INDEX:1; VISIBILITY:inherit; WIDTH:100%; HEIGHT:100%; background-color:#c0ebf3;"  
			src="version.jsp" frameBorder=0 scrolling=yes>
		</IFRAME>
	</TD>
</TR></TABLE>
</body>
</html>