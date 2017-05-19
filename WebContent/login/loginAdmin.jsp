<jsp:include page="/interface/#header.jsp"></jsp:include>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "") ||
    		(!session.getAttribute("per").equals(1))){
%>
<jsp:include page="/interface/#menu.jsp"></jsp:include>
<META http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/login">
<center>You are not admin! You will be redirected to "Login" page in 3 seconds.</center>
<%} else {
%>
<jsp:include page="/interface/#menu_admin.jsp"></jsp:include>
<META http-equiv="refresh" content="0;URL=${pageContext.request.contextPath}/home">
<%
    }
%>
<jsp:include page="/interface/#footer.jsp"></jsp:include>