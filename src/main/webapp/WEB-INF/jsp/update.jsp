<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="${pageScope.basePath }/user/update/">
		<table>
			<tr><td>用户名：<input name="userName" style="" value="${user.userName }"></td></tr> 
			<tr><td>密&nbsp&nbsp&nbsp码：<input name="password" value="${user.password }"></td></tr> 
			<tr><td>年&nbsp&nbsp&nbsp龄：<input name="age" value="${user.age }"></td></tr>
			
		</table>
	
		<button type="submit" >修改</button>
	</form>

</body>
</html>