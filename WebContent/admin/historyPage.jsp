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
<title>Log</title>
<jsp:include page="/interface/#menu_admin.jsp"></jsp:include>
<jsp:include page="/interface/#logManager.jsp"></jsp:include>
<div id="content">


    <table border="1" width="100%">
        <thead>
            <tr>
                <th>User Name</th>
                <th>Action</th>
                <th>Log Time</th>
                <th>Top up</th>
                <th>Point used</th>
            </tr>
        </thead>
        <tbody>


            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
                Statement stmt = conn.createStatement();
                String query = "select USER_NAME, ACTION, date_format(from_unixtime(LOG_TIME),'%H:%i:%s %d/%m/%Y'), TOPUP, POINT_USED from History";
                ResultSet rs = stmt.executeQuery(query);
                while(rs.next()){
            %>
            <tr>
                <%
                    String userName = rs.getString(1);
                    String action = rs.getString(2);
                    String logTime = rs.getString(3);
                    int topup = rs.getInt(4);
                    int pointUsed = rs.getInt(5);
                %>
                <td><%=userName %></td>
                <td><%=action %></td>
                <td><%=logTime %></td>
                <% if (topup>0) {%>
                <td><font color="red"><b><%=topup %></b></font></td>
                <%} else {%>
                <td><%=topup %></td>
                <%} if (pointUsed>0) {%>
                <td><font color="red"><b><%=pointUsed %></b></font></td>
                <%} else {%>
                <td><%=pointUsed %></td>
                <%}%>
                
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