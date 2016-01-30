<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">

<title>注册界面</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" >
	  <div class="container" >
	    	<p class="navbar-text">大数据存储展示平台 </p>
	    	<p class="navbar-text navbar-right">欢迎注册</p>
	  </div>
	</nav>
	<div class="container">
		
		<form class="form-horizontal" style="margin-top:200px;margin-left:150px;border:3px solid #333" 
		action="RegisterServlet" method="POST">
		  <div class="form-group" style="margin-top:20px">
		    <label for="username" class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="password" class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-5">
		      <input type="password" class="form-control" id="password" name="password" placeholder="密码">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-success">注册</button>
		    </div>
		  </div>
		  <%if (request.getAttribute("error")!=null){ %>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		     	<p class="text-danger">
		     		<%=request.getAttribute("error") %>
		     	</p> 
		    </div>
		  </div>
		  <%} %>
		</form>
		
	</div>
	
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="js/jquery-1.11.3.min.js"></script>

	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>