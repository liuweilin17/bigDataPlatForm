<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>在线用户列表</title>
</head>
<body>
	<table>
		<%
			Map<String,String> online = (Map<String,String>) application.getAttribute("online");
			if(online != null){
				for (String sessionId:online.keySet())
				{
		%>
		<tr>		
			<td><%=sessionId %>
			<td><%=online.get(sessionId) %>
		</tr>
		<%  
				}
			}
		%>
	</table>
</body>
</html>