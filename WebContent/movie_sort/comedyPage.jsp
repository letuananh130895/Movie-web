<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<html>
<body>
<jsp:include page="/interface/#header.jsp"></jsp:include>


<% String get=null;
if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")){
	get="getMovie";
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<%} else if ((!session.getAttribute("per").equals("admin")) && (session.getAttribute("vipTime").equals(0))){
	get="getMovie";
%>
<jsp:include page="/interface/#menu_user.jsp"></jsp:include>
<%} else if ((!session.getAttribute("per").equals("admin")) && (session.getAttribute("vipTime").equals(1))){
	get="getMovieVip";
%>
<jsp:include page="/interface/#menu_user.jsp"></jsp:include>
<%} else if ((session.getAttribute("per").equals("admin"))){
	get="getMovieAdmin";
%>
<jsp:include page="/interface/#menu_admin.jsp"></jsp:include>
<% } %>

<jsp:include page="/interface/#movieSort.jsp"></jsp:include>

<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>

<div id="content">

    

    <table id="t01">
    	<thead>
            <tr>
                <th colspan="3"> Movie list about Comedy</th>
                
            </tr>
        </thead>
    	
    	<tbody>

			<tr>
            <%
            	Class.forName("com.mysql.jdbc.Driver");
            	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
            	Statement stmt = conn.createStatement();
                String query = "select * from Movie where TYPE='Comedy'";
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
                <td><a href="<%=get %>?id=<%=id %>"><%=name %></a></br><%=view %> views<hr><a href="<%=get %>?id=<%=id %>"><img src="http://localhost/img/movie/<%=img %>"></a></td></tr><tr>
                <% } else {%>
                <td><a href="<%=get %>?id=<%=id %>"><%=name %></a></br><%=view %> views<hr><a href="<%=get %>?id=<%=id %>"><img src="http://localhost/img/movie/<%=img %>"></a></td>
                <% } %>
                <% } %> 

			</tbody>
    </table>
    </div>
    
    
    
    
    <jsp:include page="/interface/#footer.jsp"></jsp:include>
</body>
</html>