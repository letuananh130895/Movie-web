<jsp:include page="/interface/#header.jsp"></jsp:include>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/login">
<center>You are not logged in! You will be redirected to "Login" page in 3 seconds.</center>
<%} else {%>
<META http-equiv="refresh" content="0;URL=${pageContext.request.contextPath}/home">
<% } %>
<jsp:include page="/interface/#footer.jsp"></jsp:include>