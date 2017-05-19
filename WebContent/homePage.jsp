<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<html>
<body>
<title>Home Page</title>
<jsp:include page="/interface/#header.jsp"></jsp:include>

<%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
                Statement stmt = conn.createStatement();
                String query = "select * from Account where PER=1";
                ResultSet rs = stmt.executeQuery(query);
                if (!rs.next()){
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="5;URL=${pageContext.request.contextPath}/register?forward=admin">
<center>Welcome! This is your first time!</br>Register Admin account to Setup Website now!</br>
You will be redirected to "Register" page in 5 seconds.</center>
<%} else {%>

<% if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")){
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<jsp:include page="/interface/#movieSort.jsp"></jsp:include>
<jsp:include page="/interface/#movie_list.jsp"></jsp:include>
<%} else if (session.getAttribute("per").equals(0) && session.getAttribute("vipTime").equals(0)){
%>
<jsp:include page="/interface/#menu_user.jsp"></jsp:include>
<jsp:include page="/interface/#movieSort.jsp"></jsp:include>
<jsp:include page="/interface/#user_movie_list.jsp"></jsp:include>
<%} else if (session.getAttribute("per").equals(0) && session.getAttribute("vipTime").equals(1)){
%>
<jsp:include page="/interface/#menu_user.jsp"></jsp:include>
<jsp:include page="/interface/#movieSort.jsp"></jsp:include>
<jsp:include page="/interface/#vip_movie_list.jsp"></jsp:include>
<%} else if (session.getAttribute("per").equals(1)){
%>
<jsp:include page="/interface/#menu_admin.jsp"></jsp:include>
<jsp:include page="/interface/#movieSort.jsp"></jsp:include>
<jsp:include page="/interface/#admin_movie_list.jsp"></jsp:include>
<% } %>

<%}%>
    <jsp:include page="/interface/#footer.jsp"></jsp:include>
</body>
</html>