<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	if (request.getParameter("7days") == null&&request.getParameter("30days") == null)
		response.sendRedirect("getvip?forward=missing");
	else {
	int limit=0;
	if (request.getParameter("7days") != null) limit=7;
	if (request.getParameter("30days") != null) limit=30;
	SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
	SimpleDateFormat std = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String username= (String)session.getAttribute("username");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
	Statement st = con.createStatement();
	ResultSet rs= st.executeQuery("select VIP_POINT from Account where USER_NAME='"+username+"';");
	rs.last();
	int point=rs.getInt(1);
	session.setAttribute("b_point", point);
	if (point<limit) {
		st.close();
		response.sendRedirect("getvip?forward=notEnough");
	}
	else {
		session.setAttribute("vipTime", 1);
		rs=st.executeQuery("select date_format(from_unixtime(VIP_TIME),'%H:%i:%s %d/%m/%Y') from Account where USER_NAME='"+username+"';");
		rs.last();
		String vip_time=rs.getString(1);
		Calendar cal = Calendar.getInstance();
		if (vip_time.equals("07:00:00 01/01/1970")) {
			cal.add(Calendar.DATE, limit);
			String out_of_date =std.format(cal.getTime());
			String showTime =timeFormat.format(cal.getTime());
			session.setAttribute("yourtime", showTime);
			point=point-limit;
			session.setAttribute("c_point", point);
			st.executeUpdate("update Account set VIP_TIME=unix_timestamp('"+out_of_date+"') where USER_NAME='"+username+"';");
			st.executeUpdate("update Account set VIP_POINT="+point+" where USER_NAME='"+username+"';");
			response.sendRedirect("getvip?forward=success");
		
		}
		else {
			cal.setTime(timeFormat.parse(vip_time));
			cal.add(Calendar.DATE, limit);
			String out_of_date =std.format(cal.getTime());
			String showTime =timeFormat.format(cal.getTime());
			session.setAttribute("yourtime", showTime);
			point=point-limit;
			session.setAttribute("c_point", point);
			st.executeUpdate("update Account set VIP_TIME=unix_timestamp('"+out_of_date+"') where USER_NAME='"+username+"';");
			st.executeUpdate("update Account set VIP_POINT="+point+" where USER_NAME='"+username+"';");
			response.sendRedirect("getvip?forward=success");
		}
		st.executeUpdate("insert into History(USER_NAME, ACTION, LOG_TIME, POINT_USED) values ('"+username+"','regvip',unix_timestamp(date_format((select now()),'%Y-%m-%d %H:%i:%s')),'"+limit+"')");
		st.close();
	}
	}
%>