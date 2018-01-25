<%@ page import="java.sql.*" %><%--
    Document   : confirm
    Created on : Nov 11, 2017, 3:27:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>เพิ่มข้อมูล</title>
    </head>
    <body>
        <%
           // เซตภาษา
           request.setCharacterEncoding("UTF-8");
           response.setContentType("text/html;charset=UTF-8");
        %>
        <%
            String driver = "com.mysql.jdbc.Driver";
            String utf_8 = "?useUnicode=true&characterEncoding=UTF-8";
            String url = "jdbc:mysql://localhost:3306/JAVA_OOP_V1" + utf_8;
            String username = "root";
            String password = "";

            Connection connect;

            try {
               String title = request.getParameter("title").trim();
               String price = request.getParameter("price").trim();

               Class.forName(driver);
               connect = DriverManager.getConnection(url, username, password);

               String sql = "INSERT INTO BOOKS VALUES (?, ?, ?)";
               PreparedStatement ps = connect.prepareStatement(sql);
               ps.setInt(1, 0);
               ps.setString(2, title);
               ps.setInt(3, Integer.parseInt(price));

               int result = ps.executeUpdate();

               if (result > 0) {
                   out.print("<h3>Success</h3>");
               }

               connect.close();
            } catch (Exception e) {
                out.print("<h3>Fail</h3>");
                e.printStackTrace();
            }
        %>

        <p><a href="show_books.jsp">ดูรายการหนังสือ</a></p>

    </body>
</html>
