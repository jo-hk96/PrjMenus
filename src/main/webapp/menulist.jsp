<%@page import="menu.MenuDto"%>
<%@page import="menu.MenuDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String message = request.getParameter("message");
    %>
    
    
    <%	
    	MenuDao     dao = new MenuDao();
    	ArrayList<MenuDto> menuList = dao.getMenulist();
    	String      html = "";
    	for(int i =0; i<menuList.size(); i++){
    		MenuDto menu = menuList.get(i);
    		html += "<tr>";
    		html += "<td>" + menu.getMenu_id()   + "</td>";
    		html += "<td>" + menu.getMenu_name() + "</td>";
    		html += "<td>" + menu.getMenu_seq()  + "</td>";
    		html += "<td><a href ='delmenuaction.jsp?menu_id=" + menu.getMenu_id() + "'onclick = 'return confirm(\"삭제하시겠습니까?\");'>삭제</a></td>";
    		html += "<td><a href ='updatemenu.jsp?menu_id="+ menu.getMenu_id() + "'>수정</a></td>";
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
	<h2 align ="center">메뉴 목록</h2>
	<table border = "1" width = "978" align = "center" style = "border-collapse: collapse">
		<tr>
			<td>Menu_id</td>
			<td>Menu_name</td>
			<td>Menu_seq</td>
			<td><a href = "menulist2.jsp">목록조회</a></td>
			<td><a href = "addmenu.jsp">메뉴추가</a></td>
		</tr>
		<%=html %>
	</table>
</body>
</html>