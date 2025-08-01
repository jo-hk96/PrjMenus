<%@page import="menu.MenuDto"%>
<%@page import="menu.MenuDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%	
    
    	
    	MenuDao     dao = new MenuDao();//Dao 객체
    	ArrayList<MenuDto> menuList = dao.getMenulist();
    	String      html = "";
    	for(int i =0; i<menuList.size(); i++){
    		MenuDto menu = menuList.get(i);
    		html += "<tr>";
    		html += "<td>" + menu.getMenu_id()   + "</td>";
    		html += "<td>" + menu.getMenu_name() + "</td>";
    		html += "<td>" + menu.getMenu_seq()  + "</td>";
			html += "<tr>";
    	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>목록 조회</h2>
	<table border = "1" width = "978" align = "center" style = "border-collapse: collapse">
		<tr>
			<td>Menu_id</td>
			<td>Menu_name</td>
			<td>Menu_seq</td>
		</tr>
		<%=html %>
	</table>
</body>
</html>