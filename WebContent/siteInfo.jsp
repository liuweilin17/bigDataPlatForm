<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="main.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>站点分布</title>
</head>
<body>
	<div class="col-md-10">
			<!-- baseline 列表 -->
			<table id="baselineTable">
				<thead>
					<tr>
						<th>ID</th>
						<th>监测站</th>
						<th>参考站</th>
						<th>操作</th>
				</thead>
				<tbody>
					
				</tbody>
			</table>
	</div>
	<script>
		var baselineTable;
		
		$(document).ready(function(){
			baselineTable = initBaselineTable();
		});
		
		function initBaselineTable(){
			var username = $('#u_name').text();
			var table = $('#baselineTable').dataTable({
 				"sAjaxSource": "AjaxServlet?flag=1&username="+username,
 				"bDestroy": true,
 				"bRetrieve": true,
 				"bProcessing": true,
 				"bJQuery": true,
 				"aoColumns":[
 				 	{"mDataProp": "bl_id"},
 				 	{"mDataProp": "m_name"},
 				 	{"mDataProp": "r_name"},
 				 	{"mDataProp": "bl_id",
 				 		"fnCreatedCell": function(nTd,sData,oData,iRow,iCol){
 		                		$(nTd).html("<a class='btn btn-info' href='siteInfoDetail.jsp?bl_id="
 		                				+oData.bl_id
 		                				+"'>查看</a><a class='btn btn-danger' href='AjaxServlet?flag=4&bl_id="
 		                				+oData.bl_id
 		                				+"'>删除</a>")
 		                }
 				 	}
 				 ],
				 
 			});
			return table;
		}
		
		function showBaseData(bl_id){
			console.log(bl_id);
			/* $('#basedataTable').dataTable({
				"processing" : true,  
	            "serverSide" : true,  
	            "paginationType":"full_numbers",  
	            "ajax" : "BasedataServlet?bl_id="+bl_id,  
            	"columns" : [   
		                {"data" : "b_time"},  
		                {"data" : "b_prec"},  
		                {"data" : "b_lat"},
		                {"data" : "b_lon"},
		                {"data" : "b_x"},
		                {"data" : "b_y"},
		                {"data" : "b_z"}
	             ]  

			}); */
			
		}
		
		function deleteBaseData(bl_id){
			console.log(bl_id);
			
		}
	</script>
</body>
</html>