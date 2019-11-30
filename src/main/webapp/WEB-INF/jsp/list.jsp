<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
<link rel="stylesheet" href="${pageScope.basePath }/resources/css/sweetalert2.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<a onclick="addUser()" style="color:red;cursor:pointer;">添加</a>
		 <table border='1'  width='600'  cellspacing='0' >
		 
                    <tr>
                        <td style="text-align:center;">用户名</td>
                        <td style="text-align:center;">年纪</td>
                         <td style="text-align:center;">操作</td>
                    </tr>
                    
                    <c:forEach items = "${list }" var="user">
				        <tr>
				            <td style="text-align:center;">${user.userName }</td>
				            <td style="text-align:center;">${user.age}</td>
				            <td style="text-align:center;">
				            	<a onclick="del(${user.id})" style="cursor:pointer;margin-left:-35px;">删除</a> 
				            	<a style="margin-left:-4px;">|</a>
				            	<a onclick="edit(${user.id},${user.userName},${user.age} )" style="cursor:pointer;position: absolute;">修改</a>
			            	</td>
				        </tr>
				    </c:forEach>
                    
           </table>
           
<script type="text/javascript" src="${pageScope.basePath }/resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageScope.basePath }/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageScope.basePath }/resources/js/sweetalert2.js"></script>

</body>
<script type="text/javascript">

function del(id){
	swal({
		  title: '警告！',
		  text: "你确定要删除用户吗？",
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then(function(isConfirm) {
		  if (isConfirm) {
			  $.ajax({
				  url:"${pageScope.basePath }/user/delete?id="+id,
				  data: {
				        id: 'id'
				    },
				  success: function(ret) {
					  
					  window.location.href="${pageScope.basePath }/user/list"
				    }
			  });
		   
		  }
		});
}

</script>
</html>