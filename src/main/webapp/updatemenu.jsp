<%@page import="menu.MenuDto"%>
<%@page import="menu.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 //메뉴수정을 눌렀을때 text 칸에 메뉴내용을 보여줌
	 String menu_id = request.getParameter("menu_id"); //menu_id 가져오기
	 MenuDao menuDao = new MenuDao(); //MenuDao에 있는 menuDao 객체만들기
	 MenuDto menuDto = menuDao.getMenusById(menu_id);//menuDao에서 가져온 getMenusById(menu_id) 값을 menuDto에넣음
	 //menuDto객체에서 꺼내온다
	 String cmenu_id = menuDto.getMenu_id();
	 String cmenu_name = menuDto.getMenu_name();
	 int cmenu_seq = menuDto.getMenu_seq();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>메뉴수정</h2>
	<form action ="updateaction.jsp" method ="GET">
		<table>
			<tr>
				<td>메뉴아이디</td>
				<td><input type="text" name = "menu_id" value = "<%=cmenu_id%>" readonly/></td>
			</tr>
			<tr>
				<td>메뉴 이름</td>
				<td><input type="text" name = "menu_name" value="<%=cmenu_name%>"/></td>
			</tr>
			<tr>
				<td>메뉴 순번</td>
				<td><input type="text" name = "menu_seq" value="<%=cmenu_seq%>"/></td>
			</tr>
			<tr>
				<td colspan = "2"><input type="submit" value = "수정" onclick = "return confirm('수정하시겠습니까?');"/></td>
			</tr>
		</table>
	</form>
</body>
</html>