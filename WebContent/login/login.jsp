<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String userName = request.getParameter("username");
	String password = request.getParameter("password");
	SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
	if (userName==""||password=="")
		response.sendRedirect("login?forward=missing");
	else {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
	Statement st = con.createStatement();
	ResultSet rs;
	rs = st.executeQuery("select PER, date_format(from_unixtime(VIP_TIME),'%H:%i:%s %d/%m/%Y') from Account where USER_NAME='"
			+ userName + "' and PASSWORD='" + password + "'");
	if (rs.next()) {
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		int vipTime=0;
		int per = rs.getInt(1);
		String time=rs.getString(2);
		session.setAttribute("per", per);
		rs = st.executeQuery("select ACTION from History where USER_NAME='"+userName+"'");
		int lg;
		String status=null;
		if (rs.next()) lg=1; else lg=0;
		if (lg==1) {rs.last();
		status=rs.getString(1);}
		if (lg==0||status.equals("logout")||status.equals("register")){
		st.executeUpdate("insert into History(USER_NAME, ACTION, LOG_TIME) values ('"+userName+"','login',unix_timestamp(date_format((select now()),'%Y-%m-%d %H:%i:%s')))");
		session.setAttribute("username", userName);
		if (per==0&&time==null) {session.setAttribute("vipTime", vipTime);response.sendRedirect("home");}
		else if (per==1&&time==null) response.sendRedirect("home");
		else {
		cal1.setTime(timeFormat.parse(time));
		if (cal1.after(cal2)) vipTime=1;
		else st.executeUpdate("update Account set VIP_TIME=0 where USER_NAME='"+userName+"'");
		session.setAttribute("vipTime", vipTime);
		if (per==0&&vipTime==0) response.sendRedirect("home");
		else if (per==0&&vipTime==1) response.sendRedirect("home");
		else response.sendRedirect("home");
		}
		}
		else response.sendRedirect("login?forward=conflict");
	} else response.sendRedirect("login?forward=wrong");
	}
%>