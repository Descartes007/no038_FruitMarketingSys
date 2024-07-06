/*
	日期自动填充代码：
	A.调用方法：
		1.引入本js文件；
		2.在要选择日期的地方加上onclick='javascript:selectDate(this)'就行了，如：
		<input  type="text" name="aa" onclick='javascript:selectDate(this)'>
*/

 //中文月份,如果想显示英文月份，修改下面的注释
 /*var months = new Array("January?, "February?, "March",
    "April", "May", "June", "July", "August", "September",
    "October", "November", "December");*/
 var months = new Array("一月", "二月", "三月",
    "四月", "五月", "六月", "七月", "八月", "九月",
    "十月", "十一月", "十二月");
 var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31,
    30, 31, 30, 31);
  //中文周  如果想显示 英文的，修改下面的注释
 /*var days = new Array("Sunday", "Monday", "Tuesday",
    "Wednesday", "Thursday", "Friday", "Saturday");*/
 var days = new Array("星期日","星期一", "星期二", "星期三",
    "星期四", "星期五", "星期六");
 var getObject,oldObject;//取得当前对象
 function getDays(month, year) {
    //下面的这段代码是判断当前是否是闰年的
    if (1 == month)
       return ((0 == year % 4) && (0 != (year % 100))) ||
          (0 == year % 400) ? 29 : 28;
    else
       return daysInMonth[month];
 }

 function getToday() {
    //得到今天的年,月,日
    this.now = new Date();
    this.year = this.now.getFullYear();
    this.month = this.now.getMonth();
    this.day = this.now.getDate();
 }

 today = new getToday();

 function newCalendar() { 
    today = new getToday();
    var parseYear = parseInt(document.all.year
       [document.all.year.selectedIndex].text);
    var newCal = new Date(parseYear,
       document.all.month.selectedIndex, 1);
    var day = -1;
    var startDay = newCal.getDay();
    var daily = 0;
    if ((today.year == newCal.getFullYear()) &&(today.month == newCal.getMonth()))
       day = today.day;
    var tableCal = document.all.calendar.tBodies.dayList;
    var intDaysInMonth =getDays(newCal.getMonth(), newCal.getFullYear());
    for (var intWeek = 0; intWeek < tableCal.rows.length;intWeek++)
         for (var intDay = 0;intDay < tableCal.rows[intWeek].cells.length;intDay++)
         {
          var cell = tableCal.rows[intWeek].cells[intDay];
	  if ((intDay == startDay) && (0 == daily))
             daily = 1;
          if(day==daily)
              //今天，调用今天的Class
              cell.className = "today";
          else if(intDay==6)
              //周六
              cell.className = "sunday";
          else if (intDay==0)
              //周日
              cell.className ="satday";
          else
              //平常
              cell.className="normal";        
          if ((daily > 0) && (daily <= intDaysInMonth))
             { 
               cell.innerText = daily;
               daily++;
             }
          else
              cell.innerText = "";
       }
 }

 function getDate() {
    var sDate;
    //处理鼠标点击的情况
    if ("TD" == event.srcElement.tagName)
       if ("" != event.srcElement.innerText)
	 {//定义显示日期的格式
	   var sMonth = document.all.month.value;
	   var sDay = event.srcElement.innerText;
	   if (sMonth.length==1)sMonth = "0"+sMonth;
	   if (sDay.length==1)sDay = "0"+sDay;
	   sDate = document.all.year.value + "-" + sMonth + "-" + sDay;
	  			getObject.value=sDate;
			//	setUpdateFlag(getObject);//触发事件，保存数据
				//HideLayer();
				window.close();

	 	 }
 }

function HideLayer() {
	Layer.style.visibility = "hidden";
}

function LayerShow(){
	Layer.style.visibility = "visible";
}

function ShowLayer(t,l) {

	if(oldObject==null)oldObject=getObject;//赋值
		if(Layer.style.visibility != "visible" && oldObject==getObject){//判断是否操作同一表
				//if(l>480)l=l-131;
				Layer.style.top = t+document.body.scrollTop;
				Layer.style.left = l+document.body.scrollLeft;
				Layer.style.visibility = "visible";
				oldObject=getObject;
								}
	else if(oldObject==getObject){
		HideLayer();
	}
	else{
				//if(l>480)l=l-131;
				Layer.style.top = t+document.body.scrollTop;
				Layer.style.left = l+document.body.scrollLeft;
				Layer.style.visibility = "visible";
				oldObject=getObject;
	}
}
//定义div显示日期;
function getLayer(){

	document.write("<div id=\"Layer\" style=\"position:absolute; width:340; z-index:12;boder-color:#ffffff; border:0px outset white; background-color: #d4d0c8; layer-background-color: #d4d0c8; visibility: hidden; height: 38; left:58; top:137;\"><input type=\"hidden\" name=\"ret\"><table width='320' id=\"calendar\" cellpadding=\"0\" align=\"center\"><thead><tr><td height='4'></td></tr>    <tr><td colspan=7 align=CENTER>请选择月份：<select id=\"month\" onChange=\"newCalendar()\" name=\"select\" class=\"smallSel\">");
	 for (var intLoop = 0; intLoop < months.length;  intLoop++)
	 document.write("<OPTION VALUE= " + (intLoop + 1) + " " + (today.month == intLoop ? "Selected" : "") + ">" + months[intLoop]);
	document.write("</select> &nbsp;&nbsp;&nbsp;&nbsp;请选择年份：<select id=\"year\" onChange=\"newCalendar()\" name=\"select\" class=\"smallSel\">");
	 for (var intLoop = today.year-50; intLoop < (today.year + 10);                          intLoop++)
	 document.write("<OPTION VALUE= " + intLoop + " " +
	 (today.year == intLoop ?  "Selected" : "") + ">" + intLoop);
	document.write("</select></td></tr><tr><td height='6'></td></tr><tr class=\"days\">");
	document.write("<TD class=sunday>" + days[0] + "</TD>");
	for (var intLoop = 1; intLoop < days.length-1;intLoop++)
	document.write("<TD>" + days[intLoop] + "</TD>");
	document.write("<TD class=sunday>" + days[intLoop] + "</TD>");
	document.write("      </tr>      </thead> <tbody border=1 cellspacing=\"0\" cellpadding=\"0\" id=\"dayList\" align=CENTER ONCLICK='getDate()'>");
	 for (var intWeeks = 0; intWeeks < 6; intWeeks++) {
	document.write("<TR style='cursor:hand'>");
	 for (var intDays = 0; intDays < days.length;intDays++)
	document.write("<TD></TD>");
	document.write("</TR>");
	 }
	document.write("</tbody></table></div>");
}
//显示css
document.write("<style>TABLE	{font-family:宋体,SimSun; font-size:9pt;border:0px;bgcolor:#d4d0c8;}.drpdwn	{font-family:宋体,SimSun;font-size:9pt;color:#000000;background-color:#000000} SELECT.smallSel{    BACKGROUND-COLOR: #eeeeee;    COLOR: #000000;    FONT-SIZE: 9pt} .normal{BACKGROUND: #d4d0c8;} .today {font-weight:bold;background-image:  url(date.gif);} .satday{color:#800000} .sunday{color:#800000} .days {FONT-SIZE: 9pt;} .Arraw {color:#0000BB; cursor:hand; font-family:Webdings; font-size:9pt}</style>");

getLayer();//显示div

function selectDate(x){
getObject=x;
var xx=event.clientX;//取得x坐标;
var yy=event.clientY;//取得y坐标;
newCalendar();
ShowLayer(0,0);//显示出div
//x=getObject;
}
