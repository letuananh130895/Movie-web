<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%
	String userName = request.getParameter("username");
	String password = request.getParameter("password");
	String repassword = request.getParameter("repassword");
	String email = request.getParameter("email");
	String confirm = request.getParameter("code");
	int vipPoint = 0;
	int vipTime=0;
	int per=0;
	if (userName==""||password==""||repassword==""||email==""||confirm=="") response.sendRedirect("register?forward=missing");
	else if (!password.equals(repassword)) response.sendRedirect("register?forward=passError");
	else if (userName.length()>8) response.sendRedirect("register?forward=nameOverChar");
	else if (password.length()>8) response.sendRedirect("register?forward=passOverChar");
	else if (email.length()>20) response.sendRedirect("register?forward=emailOverChar");
		else {
		int img = Integer.parseInt(request.getParameter("img"));
		int code=Integer.parseInt(confirm);
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from Captcha where code="+code+" and img="+img+";");
		if (rs.next()){
    	rs = st.executeQuery("select USER_NAME from Account where USER_NAME='"+userName+"';");
    	String duplicate = null;
    
    while(rs.next()){
    	duplicate = rs.getString(1);
    	}

    	if(duplicate == null){
    		st.executeUpdate("insert into Account(USER_NAME, PASSWORD, EMAIL, VIP_POINT, VIP_TIME, PER) values ('"
					+ userName
					+ "','" 
					+ password
					+ "','" 
					+ email
					+ "'," 
					+ vipPoint
					+ ","
					+ vipTime
					+ ","
					+ per
					+ ")");
    		st.executeUpdate("insert into History(USER_NAME, ACTION, LOG_TIME) values ('"+userName+"','register', unix_timestamp(date_format((select now()),'%Y-%m-%d %H:%i:%s')))");
			
				response.sendRedirect("register?forward=success");
    	}
    	
    	else response.sendRedirect("register?forward=duplicate");
		}
		else response.sendRedirect("register?forward=captcha");
	}
%>