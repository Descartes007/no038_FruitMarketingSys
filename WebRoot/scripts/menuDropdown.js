/*
 * menuDropdown.js - implements an dropdown menu based on a HTML list
 * Author: Dave Lindquist (http://www.gazingus.org)
 *
 * Modified to support 1 level of submenus 2/27/2004 by Ryan Tyer
 */

var currentMenu = null;
var currentSub = null;

if (!document.getElementById) {
    document.getElementById = function() { return null; }
}

function initializeMenu(menuId, actuatorId) {
    var menu = document.getElementById(menuId);
    var actuator = document.getElementById(actuatorId);

    if (menu == null || actuator == null) return;
        
    if (menu.className == "submenu") {
        initializeSubMenu(menuId, actuatorId);
        return;
    }
    
    actuator.onmouseover = function() {
        if (currentMenu) {
            currentMenu.style.visibility = "hidden";
            this.showMenu();
            
      	    if (currentSub != null) {
                currentSub.style.visibility = "hidden";
      	    }
	      }
    }
  
    actuator.onclick = function() {
        if (currentMenu == null) {
            this.showMenu();
        }
        else {
            currentMenu.style.visibility = "hidden";
            currentMenu = null;
        }

        return false;
    }

    actuator.showMenu = function() {
        menu.style.left = this.offsetLeft + "px";
        menu.style.top = this.offsetTop + this.offsetHeight + "px";
        currentMenu = menu;
        menu.style.visibility = "visible";

    }
}

function initializeSubMenu(menuId, actuatorId) {
    var menu = document.getElementById(menuId);
    var actuator = document.getElementById(actuatorId);
    if (menu == null || actuator == null) return;
    
    actuator.className += " subactuator";
    
    actuator.onmouseover = function() {
        if (currentSub) {
            currentSub.style.visibility = "hidden";
            this.showMenu();
        }
    }
    
    actuator.onclick = function() {
        if (currentSub == null) {
            this.showMenu();
        } else {
            currentSub.style.visibility = "hidden";
            currentSub = null;
        }
	      return false;
    }
    
    actuator.showMenu = function() {
        menu.style.left = 140 + "px";
        menu.style.top = this.offsetTop - 1 + "px";
        menu.style.visibility = "visible";
        currentSub = menu;
    }
}

function expandMenus() {
    // empty method - this is here b/c the ListDisplayer
    // calls this method for expanding menus and the list
    // type is determined by JavaScript, rather than Java
}

// This function loops through all the <ul>'s in the document and
// initializes the menus for them if they have menu classes
function initializeMenus() {
    var uls = document.getElementsByTagName("ul");
    for (i = 0; i < uls.length; i++) {
        if (uls[i].className == "menuList") {
            decorateMenu(uls[i]);
        }
    }
}

function decorateMenu(menu) {
    var links = menu.getElementsByTagName("a");
    var lists = document.getElementsByTagName("ul");

    var actuators = new Array();
    var nonActuators = new Array();
    // build an array of actuators
    for (i=0; i < links.length; i++) {
        if (links[i].className == "actuator") {
            actuators[actuators.length] = links[i];
        } else {
            nonActuators[nonActuators.length] = links[i];
        }
    }

    var menus = new Array();
    // build an array of menus
    for (i=0; i < lists.length; i++) {
        if (lists[i].className == "menu" || lists[i].className == "submenu") {
            menus[menus.length] = lists[i];
        }
    }

    // initialize actuators and menus (number should be the same)
    for (i=0; i < actuators.length; i++) {
        initializeMenu(menus[i].id, actuators[i].id);
    }
    
    // Begin custom code to remember last item clicked (with cookies)
    // add an onclick event to set a cookie on the non-actuators
    for (i=0; i < nonActuators.length; i++) {
        nonActuators[i].onclick=function() {
            setCookie(itemCookie,this.href);
        }
    }
}

/* You can call initializeMenus() manually from your JSP if this doesn't work.
 * Just put the following code after the last menu tag.
 * <script type="text/javascript">
 *     initializeMenus();
 * </script>
 */
window.onload = initializeMenus;