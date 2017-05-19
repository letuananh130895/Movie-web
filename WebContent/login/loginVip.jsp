<jsp:include page="/interface/#header.jsp"></jsp:include>
<jsp:include page="/interface/#menu_user.jsp"></jsp:include>
<html>
<body>
<%
    if (session.getAttribute("vipTime").equals(0)) {
%>
<META http-equiv="refresh" content="0;URL=${pageContext.request.contextPath}/getvip">
<%} else {%>
<META http-equiv="refresh" content="0;URL=${pageContext.request.contextPath}/home">
<%}%>

<jsp:include page="/interface/#footer.jsp"></jsp:include>
</body>
</html>