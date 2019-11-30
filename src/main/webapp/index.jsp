<%@ page contentType="text/html; charset=utf-8"%>
<% 
String path = request.getContextPath(); 
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。 
pageContext.setAttribute("basePath",basePath); 
%> 
<!doctype html>
<html>
<script type="text/javascript" src="${pageScope.basePath }/resources/js/jquery-1.8.3.min.js"></script>
<body>
<h2>Hello World!123</h2>
<br>
<input value="添加"  type="button" onclick="add()">
</body>
<script type="text/javascript">

function add(){
	window.location.href="${pageScope.basePath }/user/addToPage";
}

</script>
</html>