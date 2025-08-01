<%@page import="menu.MenuDao"%>
<%@page import="menu.MenuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//주소에 입력된 파라미터값 받아오기
//request.setCharacterEncoding("utf-8"); //get parameter는 변수 영향을 안받음
String menu_id = request.getParameter("menu_id"); 

//정보 저장
MenuDto delmenu = new MenuDto(); //객체 생성
delmenu.setMenu_id(menu_id);

//menuDao 에 있는 delmenu 호출
MenuDao menuDao = new MenuDao(); //객체 생성
String delmenuResult = menuDao.delmenu(menu_id);


//메인으로 경로이동
String loc ="menulist.jsp";
response.sendRedirect(loc);

%>