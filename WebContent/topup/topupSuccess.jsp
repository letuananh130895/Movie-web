<jsp:include page="/interface/#header.jsp"></jsp:include>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/login">
<center>You are not logged in! You will be redirected to "Login" page in 3 seconds.</center>
<%} else {%>
<jsp:include page="/interface/#menu_user.jsp"></jsp:include>
	<%if (session.getAttribute("vipTime").equals(0)) {
%>
<center>Congratulation <%=session.getAttribute("username")%>!
Your account is charged <%=session.getAttribute("new_point")%> US$ successfully!
Before: <%=session.getAttribute("old_point")%>
Now Total: <%=session.getAttribute("all_point")%>
</br>Are you want to be redirected to "Get VIP" page?</center>
</br><center><a href='getvip'><input type="button" value="Yes"/></a>
<a href='home'><input type="button" value="No"/></a></center>
<%} else {%>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/home">
<center>Congratulation <%=session.getAttribute("username")%>!
Your account is charged <%=session.getAttribute("new_point")%> US$ successfully!
Before: <%=session.getAttribute("old_point")%>
Now Total: <%=session.getAttribute("all_point")%>
</br>You will be redirected to "Home" page in 3 seconds.</center>
<% } } %>
<jsp:include page="/interface/#footer.jsp"></jsp:include>