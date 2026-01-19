<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ezen.*" %>
<%
	response.setCharacterEncoding("UTF-8");
	String msg = request.getParameter("msg");
if(msg == null) return ;

String nick = (String)session.getAttribute("nick");

ezen.DBManager dbms = new ezen.DBManager();
dbms.DBOpen();
String sql = "";
sql  = "insert into chat (cname,cnote) ";
sql += "value ('" + nick + "','" + msg + "') ";
dbms.RunSQL(sql);
dbms.DBClose();
%>