<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	int logic=1, code=0;
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String message = request.getParameter("message");
	String confirm = request.getParameter("code");
	if (confirm==""||confirm==null||name==""||email==""||message=="") response.sendRedirect("contact?forward=missing");
	else if (name.length()>8) response.sendRedirect("contact?forward=nameOverChar");
	else if (email.length()>20) response.sendRedirect("contact?forward=emailOverChar");
	else if (message.length()>365) response.sendRedirect("contact?forward=messageOverChar");
	else {
	code = Integer.parseInt(confirm);
	int img = Integer.parseInt(request.getParameter("img"));
	SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
	if (logic==1){
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdmovie", "root", "aswq1234");
	Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from Captcha where code="+code+" and img="+img+";");
    if (rs.next()){
    	Calendar cal = Calendar.getInstance();
    	String cur_time =timeFormat.format(cal.getTime());
    	st.executeUpdate("insert Contact(NAME, EMAIL, MESSAGE, TIME) values ('"+name+"','"+email+"','"+message+"',unix_timestamp(date_format((select now()),'%Y-%m-%d %H:%i:%s')))");
    	response.sendRedirect("contact?forward=success");
    	}
    	
    	else response.sendRedirect("contact?forward=captcha");
    
	}
	}
%>