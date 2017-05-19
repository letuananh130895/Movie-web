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
<title>Movie Manager</title>
<jsp:include page="/interface/#menu_admin.jsp"></jsp:include>

<jsp:include page="/interface/#movieManager.jsp"></jsp:include>

<div id="content">

    

    <table id="t01">
    	<thead>
            <tr>
                <th colspan="3">Movie list</th>
                
            </tr>
        </thead>
    	
    	<tbody>

			<tr>
            <%
            	Class.forName("com.mysql.jdbc.Driver");
            	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
            	Statement stmt = conn.createStatement();
                String query = "select * from Movie";
                ResultSet rs = stmt.executeQuery(query);
                int count=0;
                while(rs.next()){
                	
            
            		count=count+1;
                	int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String img = rs.getString(3);
                    int view = rs.getInt(8);
                    if (count%3==0){
                %>
                <td><a href="getMovieAdmin?id=<%=id %>"><%=name %></a></br><%=view %> views<hr><a href="editMovie?id=<%=id %>"><img src="http://localhost/img/button/edit.jpg"></a><a href="deleteMovie?id=<%=id %>"><img src="http://localhost/img/button/delete.jpg"></a><hr><a href="getMovieAdmin?id=<%=id %>"><img src="http://localhost/img/movie/<%=img %>"></a></td></tr><tr>
                <% } else {%>
                <td><a href="getMovieAdmin?id=<%=id %>"><%=name %></a></br><%=view %> views<hr><a href="editMovie?id=<%=id %>"><img src="http://localhost/img/button/edit.jpg"></a><a href="deleteMovie?id=<%=id %>"><img src="http://localhost/img/button/delete.jpg"></a><hr><a href="getMovieAdmin?id=<%=id %>"><img src="http://localhost/img/movie/<%=img %>"></a></td>
                <% } %>
                <% } %> 

			</tbody>
    </table>
    </div>
</body>
</html>
<% } %>
<jsp:include page="/interface/#footer.jsp"></jsp:include>