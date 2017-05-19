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
<title>User Manager</title>
<jsp:include page="/interface/#menu_admin.jsp"></jsp:include>
<center><b><p style="color: red;">${errorString}</p></b></center>
<jsp:include page="/interface/#userManager.jsp"></jsp:include>
<div id="content">
    

    <table border="1" width="100%">
        <thead>
            <tr>
                <th>User Name</th>
                <th>Password</th>
                <th>Email</th>
                <th>VIP Point</th>
                <th>VIP Time</th>
                <th>Permission</th>
                <th>Status</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>


            <%
            	Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
                Statement stmt = conn.createStatement();
                Statement stmt1 = conn.createStatement();
                String sql = "select ACTION from History where USER_NAME=?";
                String query = "select USER_NAME, PASSWORD, EMAIL, VIP_POINT, date_format(from_unixtime(VIP_TIME),'%H:%i:%s %d/%m/%Y'), PER from Account";
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
                    PreparedStatement pstm1 = conn.prepareStatement(sql);
         	       	pstm1.setString(1, userName);
         	       	ResultSet rs1 = pstm1.executeQuery();
         	       	String status="online";
         	       	rs1.last();
         	       	String action=rs1.getString(1);
         	       	if ((action.equals("logout"))||(action.equals("register"))) status="offline";
                    if (time.equals("07:00:00 01/01/1970")) time="Expired";
                    int per = rs.getInt(6);
                    if (per==1){
                %><font color="red">
                <td><font color="red"><b><%=userName %></b></font></td>
                <td><font color="red"><b><%=password %></b></font></td>
                <td><font color="red"><b><%=email %></b></font></td>
                <td><font color="red"><b><%=point %></b></font></td>
                <td><font color="red"><b><%=time %></b></font></td>
                <td><font color="red"><b>Admin</b></font></td>
                <td><img src="http://localhost/img/button/<%=status %>.jpg"></td>
                <td>
                 <a href="editAccount?code=<%=userName %>"><img src="http://localhost/img/button/edit.jpg"></a>
              </td>
              <td>
                 <a href="deleteAccount?code=<%=userName %>"><img src="http://localhost/img/button/delete.jpg"></a>
              </td>
                
           </tr>               

            <%      
                } else {
            %>
            	<td><%=userName %></td>
                <td><%=password %></td>
                <td><%=email %></td>
                <td><%=point %></td>
                <td><%=time %></td>
                <td>User</td>
                <td><img src="http://localhost/img/button/<%=status %>.jpg"></td>
                <td>
                 <a href="editAccount?code=<%=userName %>"><img src="http://localhost/img/button/edit.jpg"></a>
              </td>
              <td>
                 <a href="deleteAccount?code=<%=userName %>"><img src="http://localhost/img/button/delete.jpg"></a>
              </td>
            <% }} %>

        </tbody>
    </table>
    
    </div>
</body>
</html>
<% } %>
<jsp:include page="/interface/#footer.jsp"></jsp:include>