<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>

<%
            	Class.forName("com.mysql.jdbc.Driver");
            	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
            	Statement stmt = conn.createStatement();
                String query = "select * from Movie";
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next()){
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String img = rs.getString(3);
                    int year = rs.getInt(4);
                    String type = rs.getString(5);
                    String des = rs.getString(6);
                    String url = rs.getString(7);
                    int view = rs.getInt(8);
                }
                %>