<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="main.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目管理</title>
</head>
<body>
	<div class="col-md-offset-1 col-md-10">
		<%if(request.getAttribute("error")!=null){ %>
		<div class="alert alert-danger alert-dismissible" role="alert">
  			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  			<strong>Error!</strong> <%=request.getAttribute("error")%>
		</div>
		<%} %>
		<%if(request.getAttribute("tip")!=null){ %>
		<div class="alert alert-warning alert-dismissible" role="alert">
  			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  			<strong>Warning!</strong> <%=request.getAttribute("tip")%>
		</div>
		<%} %>
		<table class="table table-hover" id="projectTable">
					<thead>
						<tr>
							<th>项目ID</th>
							<th>项目名称</th>
							<th>描述信息</th>
							<!--  <th>权限</th> -->
							<th>操作</th>
					</thead>
					<tbody></tbody>
		</table>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProjectModal">
		  添加项目
		</button>
	</div>


<!-- Modal -->
<div class="modal fade" id="addProjectModal" tabindex="-1" role="dialog" aria-labelledby="addProjectModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="addProjectModalLabel">添加新项目</h4>
      </div>
      <form action="AddProjectServlet" method="POST">
      <div class="modal-body">
		  <div class="form-group">
		    <label class="control-label" for="username">项目名称</label>
		    <input type="text" class="form-control" id="projectName" name="projectName" placeholder="项目名称">
		  </div>
		  <div class="form-group">
		    <label class="control-label" for="username">项目描述</label>
		    <input type="text" class="form-control" id="projectInfo" name="projectInfo" placeholder="项目描述">
		  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">添加</button>
      </div>
      </form>
    </div>
  </div>
</div>
	
	<script>
		var projectTable;
		
		$(document).ready(function(){
			projectTable = initProjectTable();
		});
		
		function initProjectTable(){
			var u_name = $('#u_name').text();
			console.log('initProjectTable');
			//console.log(username);
			var table = $('#projectTable').dataTable({
 				"sAjaxSource": "AjaxServlet?flag=1",
 				"bDestroy": true,
 				"bRetrieve": true,
 				"bProcessing": true,
 				"bJQuery": true,
 				"aoColumns":[
 				 	{"mDataProp": "pro_id"},
 				 	{"mDataProp": "pro_name"},
 				 	{"mDataProp": "info"},
 				 	{"mDataProp": "pro_id",
 				 		"fnCreatedCell": function(nTd,sData,oData,iRow,iCol){
 		                		$(nTd).html("<a class='btn btn-info' href='projectDetail.jsp?pro_id="
 		                				+oData.pro_id
 		                				+"&pro_name="+oData.pro_name+"'>进入</a>")
 		                }
 				 	}
 				 ]
 			});
			return table;
		}

	</script>
</body>
</html>