<jsp:include page="/interface/#header.jsp"></jsp:include>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/login">
<center>You are not logged in! You will be redirected to "Login" page in 3 seconds.</center>
<%} else {%>

<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>

<html>
<body>
<title>Your Profile</title>
      <jsp:include page="/interface/#menu_user.jsp"></jsp:include>
<div id="content">


    

    <table border="1" width="100%">
        <thead>
            <tr>
                <th>User Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>Point</th>
                <th>Time</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>


            <%
            	Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
                Statement stmt = conn.createStatement();
                String username= (String)session.getAttribute("username");
                String query = "select USER_NAME, PASSWORD, EMAIL, VIP_POINT, date_format(from_unixtime(VIP_TIME),'%H:%i:%s %d/%m/%Y') from Account where USER_NAME='"+username+"'";
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next()){
            %>
            <tr>
                <%
                    String userName = rs.getString(1);
                    String password = rs.getString(2);
                    String email = rs.getString(3);
                    String point = rs.getString(4);
                    String time = rs.getString(5);
                    if (time.equals("07:00:00 01/01/1970")) time="Expired!";
                %>
                <td><%=userName %></td>
                <td><%=password %></td>
                <td><%=email %></td>
                <td><%=point %></td>
                <td><%=time %></td>
                <td>
                 <a href="editMyAccount?code=<%=userName %>"><img src="http://localhost/img/button/edit.jpg"></a>
              </td>
              <td>
                 <a href="deleteMyAccount?code=<%=userName %>"><img src="http://localhost/img/button/delete.jpg"></a>
              </td>
                
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