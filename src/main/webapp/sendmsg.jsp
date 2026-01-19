<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ezen.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String msg = request.getParameter("msg");
    String nick = (String)session.getAttribute("nick");

    if (nick == null || msg == null || msg.trim().isEmpty()) {
        out.print("{\"status\": \"error\", \"message\": \"Invalid session or message\"}");
        return;
    }

    DBManager dbms = new DBManager();
    if (dbms.DBOpen()) {
        String sql = "insert into chat (cname, cnote) values (?, ?)";
        boolean success = dbms.RunSQL(sql, nick, msg);
        dbms.DBClose();
        
        if (success) {
            out.print("{\"status\": \"success\"}");
        } else {
            out.print("{\"status\": \"error\", \"message\": \"Database error\"}");
        }
    } else {
        out.print("{\"status\": \"error\", \"message\": \"Connection error\"}");
    }
%>