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

<div>
<a onclick="tijiao()" style="color:red;cursor:pointer;margin-left: 50px;">导出</a>
<!-- <a onclick="look()" style="color:red;cursor:pointer;margin-left: 60px;">查看</a> -->
</div>

		 <table border='1'  width='260'  cellspacing='0'  style="margin-top:35px;">
		 
                    <tr>
                        <td style="text-align:center;">BP号</td>
                        <td style="text-align:center;">
                       		 <input  type="text" name="code"  id="code1"  value="1903"/>
                        	<input  type="text" name="code"  id="code"/>
                        </td>
                    </tr>

           </table></br>
            
           <span id="tip" style="color:red;"></span></br>
           <a onclick="addCode()" style="color:red;cursor:pointer;margin-left: 50px;">添加</a></br>
          <!--  <table border='1'  width='260'  cellspacing='0'  style="margin-top:20px;">
                    <tr>
                        <td style="text-align:center;">BP号</td>
                        <td style="text-align:center;">
                        	<input  type="text" name="code"  id="code"/>
                        </td>
                    </tr>
           </table> -->
<script type="text/javascript" src="${pageScope.basePath }/resources/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageScope.basePath }/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageScope.basePath }/resources/js/sweetalert2.js"></script>

</body>
<script type="text/javascript">

var arrayObj = new Array();// 定义全局数组
$(document).keydown(function (event) {
	        if (event.keyCode == 13) {
	                var po = $("#code").val();
	/* var po1 = $("#code1").val();
					var id = po1 + po;
					if(arrayObj.length <= 144){
						arrayObj.push(id);
						$("#code").val('');
						$("#tip").text("");
					}else{
						$("#tip").text("提示:你输入的个数已经超出文档存储的总数，请先导出！");
					} */
					if(po != "" && po.length == 4){
						var po1 = $("#code1").val();
						var id = po1 + po;
						if(arrayObj.length <= 108){
							arrayObj.push(id);
							$("#code").val('');
							$("#tip").text("");
						}else{
							$("#tip").text("提示:你输入的个数已经超出文档存储的总数，请先导出！");
						}
					}else{
						$("#tip").text("提示:请输入正确的编号");
					}
	            }
	        });

//  添加编号到数组中
function addCode(){
	
	var po = $("#code").val();
	
	/* var po1 = $("#code1").val();
	var id = po1 + po;
	if(arrayObj.length <= 144){
		arrayObj.push(id);
		$("#code").val('');
		$("#tip").text("");
	}else{
		$("#tip").text("提示:你输入的个数已经超出文档存储的总数，请先导出！");
	} */
	if(po != ""){
		var po1 = $("#code1").val();
		var id = po1 + po;
		if(arrayObj.length <= 144){
			arrayObj.push(id);
			$("#code").val('');
			$("#tip").text("");
		}else{
			$("#tip").text("提示:你输入的个数已经超出文档存储的总数，请先导出！");
		}
	}else{
		$("#tip").text("提示:请输入编号");
	}
} 


//导出word
function tijiao(){
	
	for(var o=1;o<145;o++){
		if(o.toString().length == 1){
			arrayObj.push("1908000"+o);
		}else if(o.toString().length == 2){
			arrayObj.push("190800"+o);
		}else if(o.toString().length == 3){
			arrayObj.push("19080"+o);
		}
	}
	
	//  判断导出的数据是否为空
	if(arrayObj.length != 0){
		var ids = "";
		for(var i=0, len=arrayObj.length; i<len; i++) {
			         ids += arrayObj[i] + ",";
	      }
		 $.ajax({
			  url:"${pageScope.basePath }/erweima/word?ids="+ids,
		  });
	}else{
		$("#tip").text("提示:请输入编号");
	}
}

</script>
</html>