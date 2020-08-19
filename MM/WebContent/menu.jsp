<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,mm.bean.*,mm.dao.*,java.util.ArrayList"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="menus">
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var itemHeight = 32;
var dividerHeight = 1;

function openMenu(obj) {
    menuTitleId = obj.id;
    menuId = "menu" + menuTitleId.substring(10);
    indicatorId = "indicator" + menuTitleId.substring(10);

    menu = document.getElementById(menuId);
    indicator = document.getElementById(indicatorId);
    height = menu.style.height;

    if (height == "0px" || height == "") {
        childAmount = menu.getElementsByTagName('div').length;
        dividerAmount = menu.getElementsByTagName('li').length;
        height = childAmount * itemHeight + dividerAmount * dividerHeight ;
        
        menu.style.height = height + "px";
        indicator.style.transform = "rotate(0deg)";
    } else {
        menu.style.height = "0px";
        indicator.style.transform = "rotate(180deg)";
    }
}
</script>

<style>
.menus { 
width: 190px; 
overflow: hidden; 
box-shadow: 1px 1px 4px gray; 
/* border-bottom: 1px solid black; 
border-top: 1px solid black; */ 
border: 1px solid gray; 
border-radius: 5px; 
}

.menu { 
overflow: hidden; 
height: 0px; 
transition: all 0.3s ease; 
}

.menu_title { 
width: 195px; 
height: 40px; 
line-height: 40px; 
background: #fafafa; 
color: gray; 
font-size: 15px; 
padding-left: 32px; 
transition: all 0.3s ease; 
cursor: pointer; 
position: relative; 
font-weight: bold; 
overflow: hidden; 
}

.menu_title:hover { 
background: #dedede; 
color: black; 
}

.indicator { 
width: 40px; 
height: 40px; 
font-weight: bold; 
position: absolute; 
left: 0px; 
top: 0px; 
transition: all 0.3s ease; 
font-weight: bold; 
text-align: center; 
transform: rotate(180deg);
}

.item { 
width: 195px; 
height: 32px; 
line-height: 32px; 
background: gray; 
color: white; 
padding-left: 30px; 
transition: all 0.3s ease; 
cursor: pointer; 
overflow: hidden; 
}

.item:hover { 
background: #B22222; 
}

.item a { 
width: 290px; 
height: 40px; 
display: block; 
text-decoration: none; 
color: white; 
text-decoration: none; 
}

.item_divider { 
width: 322px; 
height: 1px; 
background: white; 
display: block; 
opacity: 0.8; 
}

.menu_divider { 
width: 100%; 
height: 1px; 
background: gray; 
}

</style>
</head>

<body>
<%
@SuppressWarnings("unchecked")
ArrayList<Quotation> qolist= (ArrayList<Quotation>) session.getAttribute("qolist");
@SuppressWarnings("unchecked")
ArrayList<Vendor> venlist= (ArrayList<Vendor>) session.getAttribute("venlist");
for(int i=0;i<venlist.size();i++)
{
	int i1=i+1;
	out.print("<div id='menu_title"+i1+"' class='menu_title' onclick='openMenu(this)'>"+
		   " <div class='indicator' id='indicator"+i1+"' >^</div> " +venlist.get(i).getVname()+"</div>"  );
	out.print("<div class='menu' id='menu"+i1+"'>");//"+i1+"
	for(int j=0;j<qolist.size();j++)
	{
		Quotation qo=qolist.get(j);
		if(String.valueOf(qo.getVendor_code()).equals(venlist.get(i).getVcode()) )//如果是此供应商
		out.print("<div class='item'>");
		out.print("<a href='orderfin.jsp?quo="+qo.getQuotation_code()+"'>"+qo.getQuotation_code()+"</a></div>");
		out.print("<li class='item_divider'></li>");
	}
	out.print("<li class='menu_divider'></li>");
}


%>
</body>

</html>