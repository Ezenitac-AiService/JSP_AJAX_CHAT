<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ezen.*, java.util.*, com.google.gson.Gson" %>
<%
    String no = request.getParameter("cno");
    if (no == null) no = "0";

    List<ChatDTO> messages = new ArrayList<>();
    DBManager dbms = new DBManager();
    
    if (dbms.DBOpen()) {
        String sql = "select cno, cdate, cname, cnote from chat where cno > ? order by cno asc";
        if (dbms.OpenQuery(sql, Integer.parseInt(no))) {
            while (dbms.GetNext()) {
                ChatDTO dto = new ChatDTO(
                    dbms.GetInt("cno"),
                    dbms.GetValue("cdate"),
                    dbms.GetValue("cname"),
                    dbms.GetValue("cnote")
                );
                messages.add(dto);
            }
            dbms.CloseQuery();
        }
        dbms.DBClose();
    }

    Gson gson = new Gson();
    String json = gson.toJson(messages);
    out.print(json);
%>