<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String code = request.getParameter("code");
	if (code=="")
		response.sendRedirect("topup?forward=missing");
	else {
	String username=(String)session.getAttribute("username");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select POINT from Card where CODE='"+code+"';");
	if (!rs.next()) {
		st.close();
		response.sendRedirect("topup?forward=wrong");
	}
	else {
	SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
	Calendar cal = Calendar.getInstance();
	rs.last();
	int point1=rs.getInt(1);
	session.setAttribute("new_point", point1);
	rs=st.executeQuery("select VIP_POINT from Account where USER_NAME='"+username+"'");
	rs.last();
	int point2=rs.getInt(1);
	session.setAttribute("old_point", point2);
	int point3=point1+point2;
	session.setAttribute("all_point", point3);
	st.executeUpdate("delete from Card where CODE='"+code+"';");
	st.executeUpdate("update Account set VIP_POINT='"+point3+"' where USER_NAME='"+username+"';");
	st.executeUpdate("insert into History(USER_NAME, ACTION, LOG_TIME, TOPUP) values ('"+username+"','topup',unix_timestamp(date_format((select now()),'%Y-%m-%d %H:%i:%s')),'"+point1+"')");
	st.close();
	response.sendRedirect("topup?forward=success");}
	}
%>