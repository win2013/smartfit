<%@page contentType="text/html"%>
<html>
<head><title>JSP Page</title></head>
<body>
<%
    String requests = request.getRequestURI();
    out.println(requests);
%>
</body>
</html>
