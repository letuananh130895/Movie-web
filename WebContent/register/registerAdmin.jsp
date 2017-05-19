<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	int logic=1;
	String userName = request.getParameter("username");
	String password = request.getParameter("password");
	int vipPoint = 0;
	int vipTime = 0;
	int per = 1;
	if (userName==""||password==""){
		response.sendRedirect("register?forward=error");logic=0;}
	if (logic==1){
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
	Statement st = con.createStatement();
    st.executeUpdate("insert into Account(USER_NAME, PASSWORD, VIP_POINT, VIP_TIME, PER) values ('"
					+ userName
					+ "','" 
					+ password
					+ "'," 
					+ vipPoint
					+ ","
					+ vipTime
					+ ","
					+ per
					+ ")");
    		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
    		Calendar cal = Calendar.getInstance();
    		String cur_time =timeFormat.format(cal.getTime());
    		st.executeUpdate("insert into History(USER_NAME, ACTION, LOG_TIME) values ('"+userName+"','register', unix_timestamp(date_format((select now()),'%Y-%m-%d %H:%i:%s')))");
			
				response.sendRedirect("register?forward=success");
    	}
	
%>