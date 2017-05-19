<jsp:include page="/interface/#header.jsp"></jsp:include>
<%
	if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "") || (!session.getAttribute("per").equals(1))){
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/home">
<center>You are not admin! You will be redirected to "Home" page in 3 seconds.</center>
<%} else {%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>
		<jsp:include page="/interface/#menu_admin.jsp"></jsp:include>
		<center><b><p style="color: red;">${errorString}</p></b></center>
        <form method="post" action="doEditMovie">
            <center>
            <input type="hidden" name="view" value="${movie.view}" />
            <input type="hidden" name="id" value="${movie.id}" />
            <table border="1" width="30%" cellpadding="5" bgcolor="yellow">
                <tr>
                 <td>ID</td>
                 <td style="color:red;">${movie.id}</td>
              </tr>
              <tr>
                 <td>Movie name</td>
                 <td><input type="text" name="name" value="${movie.name}" /></td>
              </tr>
              <tr>
                 <td>Image url</td>
                 <td><input type="text" name="img" value="${movie.img}" /></td>
              </tr>
              <tr>
                 <td>Year</td>
                 <td><input type="text" name="year" value="${movie.year}" /></td>
              </tr>
              <tr>
                 <td>Type</td>
                 <td><input type="text" name="type" value="${movie.type}" /></td>
              </tr>
              <tr>
                 <td>Description</td>
                 <td><textarea rows="5" cols="22" name="des" id="des" textareaObject.value="text" >${movie.des}</textarea></td>
              </tr>
              <tr>
                 <td>Movie url</td>
                 <td><input type="text" name="url" value="${movie.url}" /></td>
              </tr>
              <tr>
                 <td>View</td>
                 <td style="color:red;">${movie.view}</td>
              </tr>
              <tr>
                 <td colspan = "2">
                     <input type="submit" value="Submit" />
                     <button onclick="goBack()">Cancel</button>
                     
                 </td>
              </tr>
            </table>
            </center>
        </form>
        
    </body>
</html>
<% } %>
<jsp:include page="/interface/#footer.jsp"></jsp:include>