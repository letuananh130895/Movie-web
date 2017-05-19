<jsp:include page="/interface/#header.jsp"></jsp:include>
<%
	if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "") || (!session.getAttribute("per").equals(1))){
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/home">
<center>You are not admin! You will be redirected to "Home" page in 3 seconds.</center>
<%} else {%>

<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>

<html>
<body>
<title>Message</title>
<jsp:include page="/interface/#menu_admin.jsp"></jsp:include>
<div id="content">


    <table border="1" width="100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Time</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>


            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
                Statement stmt = conn.createStatement();
                String query = "select NAME, EMAIL, MESSAGE, date_format(from_unixtime(TIME),'%H:%i:%s %d/%m/%Y'), TIME from Contact";
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next()){
            %>
            <tr>
                <%
                	String name = rs.getString(1);
                    String email = rs.getString(2);
                    String message = rs.getString(3);
                    String showtime = rs.getString(4);
                    int time = rs.getInt(5);
                %>
                <td><%=name %></td>
                <td><%=email %></td>
                <td><%=message %></td>
                <td><%=showtime %></td>
                <td><a href='delMessage?message=<%=time %>'>Delete</a></td>
                
                
           </tr>               

            <%      
                }
            %>

        </tbody>
    </table>
    
</div>
</body>
</html>
<% } %>
<jsp:include page="/interface/#footer.jsp"></jsp:include>