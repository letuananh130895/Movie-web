<jsp:include page="/interface/#header.jsp"></jsp:include>
<jsp:include page="/interface/#menu_user.jsp"></jsp:include>
<html>
<body>
<%
    if (session.getAttribute("vipTime").equals(0)) {
%>
<META http-equiv="refresh" content="0;URL=${pageContext.request.contextPath}/login?forward=success">
<%} else {%>
<jsp:include page="/interface/#vip_movie_list.jsp"></jsp:include>
<%}%>

<jsp:include page="/interface/#footer.jsp"></jsp:include>
</body>
</html>