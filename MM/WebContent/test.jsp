<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="mm.bean.DownList"%>
<%

	ArrayList<DownList> list1 = (ArrayList<DownList>) request.getAttribute("list1");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>hello world!</h1>
	<select>
		<c:forEach items="${list1}" begin="0" end="${list1.size()}" var="list1">
			<option value="${list1.currencyname}" ${list1.selected}>${list1.currencyname}</option>
		</c:forEach>
	</select>

</body>

</html>