/*****************************************************************************
Default browsercheck - Leave this one
******************************************************************************/
function lib_bwcheck(){ //Browsercheck (needed)
	this.ver=navigator.appVersion; this.agent=navigator.userAgent
	this.dom=document.getElementById?1:0
	this.ie5=(this.ver.indexOf("MSIE 5")>-1 && this.dom)?1:0;
	this.ie6=(this.ver.indexOf("MSIE 6")>-1 && this.dom)?1:0;
	this.ie4=(document.all && !this.dom)?1:0;
	this.ie=this.ie4||this.ie5||this.ie6
	this.mac=this.agent.indexOf("Mac")>-1
	this.opera5=this.agent.indexOf("Opera 5")>-1
	this.ns6=(this.dom && parseInt(this.ver) >= 5) ?1:0;
	this.ns4=(document.layers && !this.dom)?1:0;
	this.bw=(this.ie6 || this.ie5 || this.ie4 || this.ns4 || this.ns6 || this.opera5 || this.dom)
	return this
}
var bw=new lib_bwcheck() 

var mDebugging=2 

oCMenu=new makeCoolMenu("oCMenu") 
oCMenu.useframes=0 
oCMenu.frame="" 

oCMenu.useclick=0 

oCMenu.useNS4links=1
oCMenu.NS4padding=2



oCMenu.checkselect=0

oCMenu.offlineUrl="file:///C|/Inetpub/wwwroot/dhtmlcentral/" 

oCMenu.onlineUrl="http://www.dhtmlcentral.com/coolmenus/examples/withoutframes/" 

oCMenu.pagecheck=1 
oCMenu.checkscroll=0 
oCMenu.resizecheck=1 
oCMenu.wait=1000 


oCMenu.usebar=1 
oCMenu.barcolor="lightblue" 
oCMenu.barwidth="850" 
oCMenu.barheight="menu" 
oCMenu.barx=0 
oCMenu.bary="menu" 
oCMenu.barinheritborder=0 


oCMenu.rows=1 
oCMenu.fromleft=20 
oCMenu.fromtop=50 
oCMenu.pxbetween=30 

oCMenu.menuplacement=0

oCMenu.level[0]=new Array() 
oCMenu.level[0].width=110 
oCMenu.level[0].height=20 
oCMenu.level[0].style="padding:2px; font-family:tahoma,arial,helvetica; font-size:12px; font-weight:bold" 
oCMenu.level[0].border=0 
oCMenu.level[0].bordercolor="blue" 
oCMenu.level[0].offsetX=1 
oCMenu.level[0].offsetY=1 
oCMenu.level[0].NS4font="tahoma,arial,helvetica"
oCMenu.level[0].NS4fontSize="2"

oCMenu.level[0].clip=0 
oCMenu.level[0].clippx=0 
oCMenu.level[0].cliptim=0 

oCMenu.level[0].filter=0 
oCMenu.level[0].align="bottom" 

oCMenu.level[1]=new Array() 
oCMenu.level[1].width=150
oCMenu.level[1].height=20
oCMenu.level[1].style="padding:2px; font-family:tahoma, arial,helvetica; font-size:8pt"
oCMenu.level[1].align="bottom"
oCMenu.level[1].offsetX=-4
oCMenu.level[1].offsetY=0
oCMenu.level[1].border=1
oCMenu.level[1].bordercolor="#006699"


oCMenu.level[2]=new Array() 
oCMenu.level[2].width=oCMenu.level[0].width
oCMenu.level[2].height=20


oCMenu.level[2].style="padding:2px; font-family:tahoma,arial,helvetica; font-size:8pt"
oCMenu.level[2].align="bottom"
oCMenu.level[2].offsetX=0
oCMenu.level[2].offsetY=0
oCMenu.level[2].border=1
oCMenu.level[2].bordercolor="#006699"
oCMenu.level[2].NS4font="tahoma,arial,helvetica"
oCMenu.level[2].NS4fontSize="1"


// Struts Menu specific javascript variables 

// menu arrows
cmTopMenuImage='&nbsp;&nbsp;&nbsp;<img src="images/Darrow.gif">'
cmSubMenuImage='&nbsp;&nbsp;&nbsp;<img src="images/Rarrow.gif">'

// normal menu colors
cmBGColorOn='blue'
cmBGColorOff='lightblue'
cmTxtColor='black'
cmHoverColor='white'

// disabled menu colors
cmDisBGColorOn='#c0ebf3'
cmDisBGColorOff='#c0ebf3'
cmDisTxtColor='white'
cmDisHoverColor='white'
