<%@page import="menu.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//addmenu.jsp 가 보낸준 데이터를 받는다.
String menu_id     = request.getParameter("menu_id");
String menu_name   = request.getParameter("menu_name");
String menu_seq_in = request.getParameter("menu_seq");
int    menu_seq    = Integer.parseInt( menu_seq_in); // 문자를 숫자로 바꿈



//저장한다
MenuDao menuDao = new MenuDao();//import : ctrl + shift + m 
menuDao.addMenu(menu_id, menu_name, menu_seq);//menuDao class의 addMenu 부르기




//목록으로 돌아간다
String loc = "menulist.jsp";
response.sendRedirect(loc);

%>