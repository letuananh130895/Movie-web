<jsp:include page="/interface/#header.jsp"></jsp:include>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/login">
<center>You are not logged in! You will be redirected to "Login" page in 3 seconds.</center>
<%} else {%>
<jsp:include page="/interface/#menu_user.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/home">
<center>Congratulation <%=session.getAttribute("username")%>!
Your VIP time: <%=session.getAttribute("yourtime")%>
Before: <%=session.getAttribute("b_point")%>
Now: <%=session.getAttribute("c_point")%>
</br>You will be redirected to "Home" page in 3 seconds.</center>
<%
    }
%>
<jsp:include page="/interface/#footer.jsp"></jsp:include>