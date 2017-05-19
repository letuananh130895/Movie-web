<title>${movie.name}</title>
<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
int point=0, vipTime=0;
%>

<div id="content">

    

    <table id="t01">
        <thead>
            <tr>
            	<th>Movie</th>
                <th>Info</th>
           </tr>
        </thead>
        <tbody>
        
        <td>${movie.name}</br><hr><img src="http://localhost/img/movie/${movie.img}"></td>
        <td>Year: ${movie.year}</br><hr>Type: ${movie.type}</br><hr>${movie.des}</br><hr>${movie.view} views</br><hr>
        <% if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")){
        %>
        <button onclick="window.location=('register')">Register now!</button>
        <% } else {
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
        	Statement stmt = conn.createStatement();
        	String username= (String)session.getAttribute("username");
            String query = "select VIP_POINT, date_format(from_unixtime(VIP_TIME),'%H:%i:%s %d/%m/%Y') from Account where USER_NAME='"+username+"'";
            ResultSet rs = stmt.executeQuery(query);
            rs.last();
            String time=null;
            point=rs.getInt(1);
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
    		Calendar cal1 = Calendar.getInstance();
    		Calendar cal2 = Calendar.getInstance();
            if (rs.getString(2)==null||rs.getString(2)=="") vipTime=0;
            else {
            time=rs.getString(2);
            cal1.setTime(timeFormat.parse(time));
            if (cal1.after(cal2)) vipTime=1;
            else vipTime=0;
            }
        	if (point<7){
        %>
        <button onclick="window.location=('topup')">Top-up now!</button>
        <% } else if (vipTime==0){%>
        <button onclick="window.location=('getvip')">Become a VIP!</button>
        <% } }%>
        </br>or</br>
        <button onclick="goBack()">Back to Movie list</button>
        </td>
                               

       </tbody>
    </table>
	
    </div>