<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="main.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加设备</title>
</head>
<body>
<div class="row">
	<div style="margin-left:270px;margin-bottom:20px">
		<span class="label label-info" id="pro_id"><%=request.getParameter("pro_id")%></span>
		<span class="label label-success" id="pro_name"><%=request.getParameter("pro_name")%></span>
		<span class="label label-warning">添加设备</span>
		<button class="btn btn-primary" style="float:right;margin-right:30px" onclick="backDevice()">返回设备列表</button>
	</div>
</div>
	<div class="col-md-2">
		<ul class="nav nav-stacked" role="tablist">
	      <li role="presentation" class="active"><a href="#devicePage" id="device-tab" role="tab" data-toggle="tab" aria-controls="devicePage" aria-expanded="true">设备管理</a></li>
	      <li role="presentation"><a href="#displayPage" role="tab" id="display-tab" data-toggle="tab" aria-controls="displayPage">数据展示</a></li>
	      <li role="presentation"><a href="#warningPage" role="tab" id="warning-tab" data-toggle="tab" aria-controls="warningPage">预警</a></li>
	      <li role="presentation"><a href="#setPage" role="tab" id="set-tab" data-toggle="tab" aria-controls="setPage">设置</a></li>
	    </ul>
    </div>
    <div class="col-md-10">
    </div>
    <script>
    	function backDevice(){
    		var pro_id = $('#pro_id').text();
    		var pro_name = $('#pro_name').text();
    		location.href = "projectDetail.jsp?pro_id="+pro_id+"&pro_name="+pro_name;
    	}
    </script>
</body>
</html>