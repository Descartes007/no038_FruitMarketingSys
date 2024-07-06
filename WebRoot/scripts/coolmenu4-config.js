/*** 
This is the menu creation code - place it right after you body tag
Feel free to add this to a stand-alone js file and link it to your page.
**/

//Menu object creation
oCMenu=new makeCM("oCMenu") //Making the menu object. Argument: menuname

oCMenu.frames = 0

//Menu properties   
oCMenu.pxBetween=0
oCMenu.fromLeft=40 
oCMenu.fromTop=0   
oCMenu.rows=1 
oCMenu.menuPlacement="left"
                                                             
oCMenu.offlineRoot="file:///C|/Inetpub/wwwroot/dhtmlcentral/projects/coolmenus/examples/" 
oCMenu.onlineRoot="" 
oCMenu.resizeCheck=1 
oCMenu.wait=100 
oCMenu.fillImg="../images/cm_fill.gif"
oCMenu.zIndex=400
oCMenu.pagecheck=0
oCMenu.checkscroll=0

//Background bar properties
oCMenu.useBar=1
oCMenu.barWidth="100%"
oCMenu.barHeight="menu" 
oCMenu.barClass="clBar"
oCMenu.barX=0 
oCMenu.barY=0
oCMenu.barBorderX=0
oCMenu.barBorderY=0
oCMenu.barBorderClass=""

//Level properties - ALL properties have to be spesified in level 0
oCMenu.level[0]=new cm_makeLevel() //Add this for each new level
oCMenu.level[0].width=100
oCMenu.level[0].height=25 
oCMenu.level[0].regClass="cmMenu"
oCMenu.level[0].overClass="cmMenuOver"
oCMenu.level[0].borderX=1
oCMenu.level[0].borderY=1
oCMenu.level[0].borderClass="cmMenuBorder"
oCMenu.level[0].offsetX=0
oCMenu.level[0].offsetY=0
oCMenu.level[0].rows=0
oCMenu.level[0].arrow=0
oCMenu.level[0].arrowWidth=0
oCMenu.level[0].arrowHeight=0
oCMenu.level[0].align="bottom"
oCMenu.level[0].filter="progid:DXImageTransform.Microsoft.Fade(duration=0.5)"
oCMenu.level[0].arrow="images/Rarrow.gif"
oCMenu.level[0].arrowWidth=12
oCMenu.level[0].arrowHeight=12

//EXAMPLE SUB LEVEL[1] PROPERTIES - You have to specify the properties you want different from LEVEL[0] - If you want all items to look the same just remove this
oCMenu.level[1]=new cm_makeLevel() //Add this for each new level (adding one to the number)
oCMenu.level[1].width=oCMenu.level[0].width-2
oCMenu.level[1].height=22
oCMenu.level[1].regClass="cmItem"
oCMenu.level[1].overClass="cmItemOver"
oCMenu.level[1].borderX=1
oCMenu.level[1].borderY=1
oCMenu.level[1].align="right" 
oCMenu.level[1].offsetX=-5
oCMenu.level[1].offsetY=0
oCMenu.level[1].borderClass="cmItemBorder"

