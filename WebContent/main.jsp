<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/jquery.dataTables.css">
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	
	<!-- 可选的Bootstrap主题文件（一般不用引入） -->
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	
	
	
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="js/jquery-1.11.3.min.js"></script>
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="js/bootstrap.min.js"></script>
		
	<script src="js/highcharts.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/jquery.dataTables.js"></script>
	
	<title>主界面</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" >
		<div class="container" >
		  	<div class="navbar-header">
		  		<img class="navbar-brand" src="images/mark.jpg">
		    	<p class="navbar-text">大数据存储展示平台 </p>
		    </div>
		    <div class="collapse navbar-collapse">
		    	<ul class="nav navbar-nav navbar-right">
		    		<li><p class="navbar-text">您好！</p></li>
			    	<li><p class="navbar-text" id="u_name">
			    	<%= request.getSession().getAttribute("username") %></p></li>
			    	<li><a href="./ExitServlet">退出</a></li>
		    	</ul>
		    </div>
		</div>
	</nav>
	<div class="jumbotron">
		<div class="container">
		<h3>欢迎使用本系统！</h3>
		<p>本系统实现大数据的存储，展示，预警功能</p>
		</div>
	</div>	
	<!-- Add File Modal -->
<!-- 	<div class="modal fade" id="addfileModal" tabindex="-1" role="dialog" aria-labelledby="addfileModalLabel"> -->
<!-- 	  <div class="modal-dialog" role="document"> -->
<!-- 	    <div class="modal-content"> -->
<!-- 		    <form name="addfileForm" id="addfileForm" action="AddfileServlet" method="post" enctype="multipart/form-data"> -->
<!-- 		      <div class="modal-header"> -->
<!-- 		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!-- 		        <h4 class="modal-title" id="addfileModalLabel">输入数据文件路径</h4> -->
<!-- 		      </div> -->
<!-- 		      <div class="modal-body"> -->
<!-- 			          <div class="form-group"> -->
<!-- 			            <label for="fileName" class="control-label">文件路径</label> -->
<!-- 				        <input type="file" class="file" id="fileName" name="fileName"> -->
<!-- 			          </div> -->
<!-- 		      </div> -->
<!-- 		      <div class="modal-footer"> -->
<!-- 		        	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> -->
<!-- 		        	<button type="submit" class="btn btn-primary" name="addfile">加载</button> -->
<!-- 		      </div> -->
<!-- 		    </form>  -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	</div> -->
	
<!-- 	<nav class="navbar navbar-inverse navbar-fixed-bottom"> -->
<!-- 	  <div class="container"> -->
<!-- 	    	<p class="navbar-text">copyright...</p> -->
<!-- 	  </div> -->
<!-- 	</nav> -->
</body>
</html>