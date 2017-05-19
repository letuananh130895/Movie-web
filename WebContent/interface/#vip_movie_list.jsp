<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>

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
                <td><a href="getMovieVip?id=<%=id %>"><%=name %></a></br><%=view %> views<hr><a href="getMovieVip?id=<%=id %>"><img src="http://localhost/img/movie/<%=img %>"></a></td></tr><tr>
                <% } else {%>
                <td><a href="getMovieVip?id=<%=id %>"><%=name %></a></br><%=view %> views<hr><a href="getMovieVip?id=<%=id %>"><img src="http://localhost/img/movie/<%=img %>"></a></td>
                <% } %>
                <% } %> 

			</tbody>
    </table>
    </div>