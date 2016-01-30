<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="main.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据展示</title>
</head>
<body>
		<div class="col-md-2">
		<ul class="nav nav-stacked" role="tablist">
	      <li role="presentation" class="active"><a href="#addPage" id="add-tab" role="tab" data-toggle="tab" aria-controls="addPage" aria-expanded="true">折线图</a></li>
	      <li role="presentation"><a href="#searchPage" role="tab" id="search-tab" data-toggle="tab" aria-controls="searchPage">直方图</a></li>
	      <li role="presentation"><a href="#deletePage" role="tab" id="delete-tab" data-toggle="tab" aria-controls="deletePage">散点图</a></li>
	      <li role="presentation"><a href="#modifyPage" role="tab" id="modify-tab" data-toggle="tab" aria-controls="modifyPage">3D图</a></li>
	    </ul>
    </div>
    <div class="col-md-10">
	    <div class="tab-content">
	      <div role="tabpanel" class="tab-pane fade in active" id="addPage" aria-labelledBy="add-tab">
	        <p>折线图</p>
	      </div>
	      <div role="tabpanel" class="tab-pane fade" id="searchPage" aria-labelledBy="search-tab">
	        <p>直方图</p>
	      </div>
	      <div role="tabpanel" class="tab-pane fade" id="deletePage" aria-labelledBy="delete-tab">
	        <p>散点图</p>
	      </div>
	      <div role="tabpanel" class="tab-pane fade" id="modifyPage" aria-labelledBy="modify-tab">
	        <p>3D图</p>
	      </div>
	    </div>
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