<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
String path = request.getContextPath(); 
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。 
pageContext.setAttribute("basePath",basePath); 
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageScope.basePath }/resources/js/jquery-3.3.1..js"></script>
<script type="text/javascript" src="${pageScope.basePath }/resources/js/jquery-1.8.3.min.js"></script>
</head>
<body>

	<form action="${pageScope.basePath }/user/add/">
		<table>
			<tr><td>用户名：<input name="userName" style=""></td></tr> 
			<tr><td>密&nbsp&nbsp&nbsp码：<input name="password"></td></tr> 
			<tr><td>年&nbsp&nbsp&nbsp龄：<input name="age"></td></tr>
			
		</table>
	
		<button type="submit" >添加</button>
	</form>

</body>
</html>