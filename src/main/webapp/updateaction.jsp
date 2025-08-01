<%@ page import="menu.MenuDto" %>
<%@ page import="menu.MenuDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//정보받기
request.setCharacterEncoding("utf-8");//인코딩 utf-8로 정보받기

//request :  form 데이터 호출
String menu_id = request.getParameter("menu_id");
String menu_name = request.getParameter("menu_name");

//문자열로 넘어오는 seq값을 int로 변환
int menu_seq_int = 0; 
menu_seq_int = Integer.parseInt(request.getParameter("menu_seq"));

//MenuDto 객체에 수정한 정보 담기
MenuDto updatedmenu = new MenuDto(); //MenuDto 에 setter로 정보 저장
updatedmenu.setMenu_id(menu_id);
updatedmenu.setMenu_name(menu_name);
updatedmenu.setMenu_seq(menu_seq_int);

//menuDao에서 DB데이터수정하는 로직을 가져와서 객체로 만듬
MenuDao menuDao = new MenuDao(); 
int updateResult = menuDao.updateMenu(updatedmenu);



//입력값이 0보다 크면 menulist.jsp로 이동
if(updateResult > 0 ){
	String loc = "menulist.jsp";
	response.sendRedirect(loc);
}else{
	String loc = "menulist.jsp?message=Failed";
	response.sendRedirect(loc);
}


%>
