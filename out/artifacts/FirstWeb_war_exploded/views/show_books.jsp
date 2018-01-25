<%@ page import="java.sql.*" %>
<%--
    Document   : list_books
    Created on : Nov 11, 2017, 3:27:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>รายการหนังสือ</title>
    </head>
    <body>
        <h1>รายการหนังสือ</h1>
        <%
            String driver = "com.mysql.jdbc.Driver";
            String utf_8 = "?useUnicode=true&characterEncoding=UTF-8";
            String url = "jdbc:mysql://localhost:3306/JAVA_OOP_V1" + utf_8;
            String username = "root";
            String password = "";

            Connection connect;

            try {
                Class.forName(driver);
                connect = DriverManager.getConnection(url, username, password);
                String sql = "SELECT * FROM BOOKS;";
                PreparedStatement ps = connect.prepareStatement(sql);
                ResultSet result = ps.executeQuery();

        %>



        <table width="40%" border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>ชื่อหนังสือ</th>
                    <th>ราคา</th>
                </tr>
            </thead>
            <tbody>

                <!-- ส่วนแสดงผล -->
            <%
                    while (result.next()) {
            %>
                <tr>
                    <td align ="center"><%= result.getInt("id")%></td>
                    <td><%= result.getString("title")%></td>
                    <td align ="right"><%= result.getInt("price")%></td>
                </tr>
                <!-- ส่วนแสดงผล -->
            <%
                        }
                        connect.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
            %>
            </tbody>

        </table>
    </body>
</html>
