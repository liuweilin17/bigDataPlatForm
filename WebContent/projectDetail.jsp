<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="main.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的项目</title>
</head>
<body>
<div class="row">
	<div style="margin-left:270px;margin-bottom:20px">
		<span class="label label-info" id="pro_id"><%=request.getParameter("pro_id")%></span>
		<span class="label label-success" id="pro_name"><%=request.getParameter("pro_name")%></span>
		<a class="btn btn-primary" style="float:right;margin-right:30px" href="project.jsp">返回项目列表</a>
	</div>
</div>
	<div class="col-md-2">
		<ul class="nav nav-stacked" role="tablist">
	      <li role="presentation" class="active"><a href="#devicePage" id="device-tab" role="tab" data-toggle="tab" aria-controls="devicePage" aria-expanded="true">设备管理</a></li>
	      <li role="presentation"><a href="#displayPage" role="tab" id="display-tab" data-toggle="tab" aria-controls="displayPage">数据展示</a></li>
	      <li role="presentation"><a href="#warningPage" role="tab" id="warning-tab" data-toggle="tab" aria-controls="warningPage">预警</a></li>
	      <%if(request.getSession().getAttribute("userRole").toString().equals("1")) {%>
	      <li role="presentation"><a href="#setPage" role="tab" id="set-tab" data-toggle="tab" aria-controls="setPage">设置</a></li>
	      <%} %>
	    </ul>
    </div>
    <div class="col-md-10">
	    <div class="tab-content">
	    <!-- device page  -->
	      <div role="tabpanel" class="tab-pane fade in active" id="devicePage" aria-labelledBy="device-tab">
	      
		      <ul class="nav nav-tabs" role="tablist">
			    <li role="presentation" class="active"><a href="#deviceTypePage" aria-controls="deviceTypePage" role="tab" data-toggle="tab">查看设备类型</a></li>
			    <%if(request.getSession().getAttribute("userRole").toString().equals("1")) {%>
			    <li role="presentation"><a href="#addDeviceTypePage" aria-controls="addDeviceTypePage" role="tab" data-toggle="tab">添加设备类型</a></li>
			    <%} %>
			    <li role="presentation"><a href="#deviceInstancePage" aria-controls="deviceInstancePage" role="tab" data-toggle="tab">查看设备信息</a></li>
			    <%if(request.getSession().getAttribute("userRole").toString().equals("1")) {%>
			    <li role="presentation"><a href="#addDeviceInstancePage" aria-controls="addDeviceInstancePage" role="tab" data-toggle="tab">添加设备</a></li>
			    <%} %>
			  </ul>
		
			  <!-- Tab panes -->
			  <div class="tab-content">
			  	<!-- device type page -->
			    <div role="tabpanel" class="tab-pane active" id="deviceTypePage">
			    	<div style="margin-top:20px">
					    <table class="table table-hover" id="deviceTypeTable">
							<thead>
								<tr>
									<th>类型ID</th>
									<th>类型名称</th>
									<th>操作</th>	
							</thead>
							<tbody></tbody>
						</table>
						<div class="panel panel-success">
							<div class="panel-heading" id="deviceTypeDetailHeading"></div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>数据名称</th>
										<th>数据类型</th>
									</tr>
								</thead>
								<tbody id="deviceTypeDetailTbody"></tbody>
							</table>
						</div>
		        	</div>
			    </div>
			    <!-- device type page end -->
			    
			    <!-- add device type page -->
			    <div role="tabpanel" class="tab-pane" id="addDeviceTypePage">
			    	<div style="margin-top:20px">
				        <form class="form-horizontal" action="" method="POST">
						  <div class="form-group">
						    <label for="deviceTypeName" class="col-md-2 control-label">类型名称</label>
						    <div class="col-md-5">
						      <input type="text" class="form-control" id="deviceTypeName" name="deviceTypeName" placeholder="设备名">
						    </div>
						  </div>
						  <div class="form-group" id="varNumFormGroup">
						  <label for="tab" class="col-md-2 control-label">数据格式</label>
						  <div class="col-md-offset-2">
						    <table id="formatTable" class="table table-hover" >
						        <thead>
						        	<tr>
							            <th>变量名</th>
							            <th>变量类型</th>
							            <th>操作</th>
						            </tr>
						       </thead>
						       <tbody></tbody>
						    </table>
						    </div>
						    <button style="margin-bottom:10px" class="btn btn-warning col-md-offset-2" type="button" id="but" >
						    	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						    </button>
						  </div>
						  <div class="form-group">
						    <div class="col-md-offset-1">
						      <button type="submit" class="btn btn-success">添加</button>
						    </div>
						  </div>
					  	</form>
				    </div>
			    </div>
			    <!-- add device type page end -->
			    
			    <!-- device instance page -->
			    <div role="tabpanel" class="tab-pane" id="deviceInstancePage">
			    	<div style="margin-top:20px">
					    <table class="table table-hover" id="deviceTable">
							<thead>
								<tr>
									<th>设备ID</th>
									<th>设备名称</th>
									<th>设备类型</th>
									<th>操作</th>
							</thead>
							<tbody></tbody>
						</table>
		        	</div>
			    </div>
			    <!-- device instance page end -->
			    
			    <!-- add device instance page -->
			    <div role="tabpanel" class="tab-pane" id="addDeviceInstancePage">
				    <div style="margin-top:20px">
				        <form class="form-horizontal" action="" method="POST">
				        
				          <div class="form-group">
				          	<label class="radio-inline col-md-2 control-label">
							  <input type="radio" name="batchOptions" id="single" value="0" checked>个例添加
							</label>
							<label class="radio-inline col-md-2 control-label">
							  <input type="radio" name="batchOptions" id="batch" value="1">批量添加
							</label>
				          </div>
				          
						  <div class="form-group" id="deviceNameInput">
						    <label for="deviceName" class="col-md-2 control-label">设备名</label>
						    <div class="col-md-5">
						      <input type="text" class="form-control" id="deviceName" name="deviceName" placeholder="设备名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="deviceType" class="col-md-2 control-label">设备类型</label>
						    <div class="col-md-5">
						      <select class="form-control" id="deviceType" name="deviceType">
							  </select>
						    </div>
						  </div>
						  <div class="form-group" id="deviceNumInput" style="display:none">
						    <label for="deviceNum" class="col-md-2 control-label">设备数量</label>
						    <div class="col-md-5">
						      <input type="text" class="form-control" id="deviceNum" name="deviceNum" placeholder="设备数量">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-success">添加</button>
						    </div>
						  </div>
					  	</form>
				    </div>
			    </div>
			    <!-- add device instance page end -->
			    
			  </div>
		    
		  </div>
		  <!-- device page end -->
		  
	      <!-- display page -->
	      <div role="tabpanel" class="tab-pane fade" id="displayPage" aria-labelledBy="display-tab">
	        <div class="col-md-10" id="displayPage1">
	        	<div class="panel panel-success">
				  <div class="panel-heading">设备列表</div>
				  <div class="panel-body">
				    <table class="table table-hover" id="displayTable">
						<thead>
							<tr>
								<th>设备ID</th>
								<th>设备名称</th>
								<th>操作</th>
						</thead>
						<tbody></tbody>
					</table>
				  </div>
				</div>
	        </div>
	        <div class="col-md-10">
	        <ul class="nav nav-tabs" role="tablist">
			    <li role="presentation" class="active"><a href="#dataTablePage" aria-controls="dataTablePage" role="tab" data-toggle="tab">数据表格</a></li>
			    <li role="presentation"><a href="#dataChartPage" aria-controls="dataChartPage" role="tab" data-toggle="tab">数据图表</a></li>
			</ul>
			  <!-- Tab panes -->
			  <div class="tab-content">
			    <div role="tabpanel" class="tab-pane active" id="dataTablePage">
				    <table class="table table-hover" id="deviceDataTable">
						<thead>
							<tr>
								<th>ID</th>
								<th>height</th>
								<th>width</th>
						</thead>
						<tbody></tbody>
					</table>
			    </div>
			    <div role="tabpanel" class="tab-pane" id="dataChartPage">
				  <div class="col-md-10">
				    <div class="col-md-3">
				    	<ul class="nav nav-stacked" role="tablist">
					      <li role="presentation" class="active"><a href="#line" id="line-tab" role="tab" data-toggle="tab" aria-controls="line" aria-expanded="true">折线图</a></li>
					      <li role="presentation"><a href="#area" role="tab" id="area-tab" data-toggle="tab" aria-controls="area">区域图</a></li>
					      <li role="presentation"><a href="#pie" role="tab" id="pie-tab" data-toggle="tab" aria-controls="pie">饼状图</a></li>
					      <li role="presentation"><a href="#scatter" role="tab" id="scatter-tab" data-toggle="tab" aria-controls="scatter">散点图</a></li>
					    </ul>
				    </div>
				    <div class="col-md-7">
				    	<div class="form-group" style="margin-top:20px">
						    <label for="xType" class="col-md-1 control-label">x</label>
						    <div class="col-md-5">
						      <select class="form-control" id="xType" name="xType">
						      <option>latitude</option>
						      <option>longtitude</option>
						      <option>timestamp</option>
							  </select>
						    </div>
						    <label for="yType" class="col-md-1 control-label">y</label>
						    <div class="col-md-5">
						      <select class="form-control" id="yType" name="yType">
						      <option>latitude</option>
						      <option>longtitude</option>
						      <option>timestamp</option>
							  </select>
						    </div>
						</div>
						
					    <div class="tab-content">
					    	<div role="tabpanel" class="tab-pane fade in active" id="line" aria-labelledBy="line-tab">
					    		1
					    	</div>
					    	<div role="tabpanel" class="tab-pane fade" id="area" aria-labelledBy="area-tab">
					    		2
					    	</div>
					    	<div role="tabpanel" class="tab-pane fade" id="pie" aria-labelledBy="pie-tab">
					    		3
					    	</div>
					    	<div role="tabpanel" class="tab-pane fade" id="scatter" aria-labelledBy="scatter-tab">
					    		4
					    	</div>
					    </div>
				    </div>
				  </div>
	        	</div>
			   </div>
			  </div>
	        </div>
	      <!-- display page end-->
	      
	      <!-- warning page -->
	      <div role="tabpanel" class="tab-pane fade" id="warningPage" aria-labelledBy="warning-tab">
	        <p>预警</p>
	      </div>
	      <!-- warning page end-->
	      
	      <!-- set page -->
	      <div role="tabpanel" class="tab-pane fade" id="setPage" aria-labelledBy="set-tab">
	        <form class="form-horizontal" style="margin-top:20px" 
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
		      <button type="submit" class="btn btn-success">添加</button>
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
	      <!-- set page end-->
	    </div>
	</div>
	<script>
		var deviceTable;
		var deviceTypeTable;
		$("#but").click(function(){
            var _len = $("#formatTable tbody tr").length;        
            $("#formatTable tbody").append("<tr id="+_len+">"
                                +"<td><input type='text'></td>"
                                +"<td><input type='text'></td>"
                                +"<td><button class='btn btn-danger' onclick='deltr("+_len+")'>"
                                +"<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
                                +"</button></td>"
                            +"</tr>");            
        }); 
		function deltr(index){
	    	var _len = $("#formatTable tbody tr").length;
	       	if( _len == 1){
	       		$("tr[id='"+index+"']").remove();
	       	}else{
		        for(var i=index;i<_len-1;i++){
		        	$("tr[id=\'"+(i+1)+"\']").each(function(trindex,tritem){
		    		 value1 = jQuery(tritem).find("td").eq(0).find("input").val();
		    		 value2 = (jQuery(tritem).find("td").eq(1).find("input").val());
		    		}); 
		        	$("tr[id=\'"+i+"\']")
	         		.replaceWith("<tr id="+i+">"
	                                +"<td><input type='text' value='" + value1 + "'/></td>"
	                                +"<td><input type='text' value='" + value2 + "'/></td>"
	                                +"<td><button class='btn btn-danger' onclick=\'deltr(" + i + ")\'>"
	                                +"<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
	                                +"</button></td>"
	                            +"</tr>");
		        }
		        $("tr[id='"+(_len-1)+"']").remove();
	       	}
		}
		$('input[id=single]').click(function(){
			//console.log(0);
			$('div[id=deviceNameInput]').css('display','block');
			$('div[id=deviceNumInput]').css('display','none');
		});
		$('input[id=batch]').click(function(){
			//console.log(1);
			$('div[id=deviceNameInput]').css('display','none');
			$('div[id=deviceNumInput]').css('display','block');
		});
		function initSelect(){
			var pro_id = $('#pro_id').text();
			$.get("AjaxServlet?flag=3&pro_id="+pro_id,function(data,status){
				var obj = jQuery.parseJSON(data);
				var len = obj.aaData.length;
				for(var i = 0;i<len;i++){
					$("select[id='deviceType']").append("<option>"+obj.aaData[i].for_name+"</option>");
					//$("select[id='xType']").append("<option>"+obj.aaData[i].for_name+"</option>");
					//$("select[id='yType']").append("<option>"+obj.aaData[i].for_name+"</option>");
				}
			});
		}
		$(document).ready(function(){
			deviceTable = initDeviceTable();
			deviceTypeTable = initDeviceTypeTable();
			displayTable = initDisplayTable();
			lineChart = initLineChart();
			areaChart = initAreaChart();
			pieChart = initPieChart();
			scatterChart = initScatterChart();
			initSelect();
		});
		function getFormatName(nTd,oData){
			$.ajax({  
				      type: "GET",  
				      url: "AjaxServlet",
				      async: "true",
				      dataType: "json",  
				      cache: false,  
			      	  data: {  
				          "flag": "4",  
				          "for_id": oData.for_id    
				      },  
				      success: function(data) {
				    	  //alert("success");
				    	  ret = data.data.for_name;
				    	  $(nTd).html("<button class='btn btn-info' onclick='showFormat("
 		                				+oData.for_id
 		                				+")'>" + ret + "</button>");
				      }  
				  });
		}
		function initDeviceTable(){
			var pro_id = $('#pro_id').text();
			console.log('initDeviceTable');
			console.log(pro_id);
			var table = $('#deviceTable').dataTable({
 				"sAjaxSource": "AjaxServlet?flag=2&pro_id="+pro_id,
 				"bDestroy": true,
 				"bRetrieve": true,
 				"bProcessing": true,
 				"bJQuery": true,
 				"aoColumns":[
 				 	{"mDataProp": "dev_id"},
 				 	{"mDataProp": "dev_name"},
 				 	{"mDataProp": "for_id",
 				 		"fnCreatedCell": function(nTd,sData,oData,iRow,iCol){
 		                		//$(nTd).html("<button class='btn btn-info' onclick='showFormat("
 		                				//+oData.for_id
 		                				//+")'>" + getFormatName(oData.for_id) + "</button>");
 		                		getFormatName(nTd,oData);
 		                }
 				 	},
 				 	{"mDataProp": "dev_id",
 				 		"fnCreatedCell": function(nTd,sData,oData,iRow,iCol){
		                		$(nTd).html("<button class='btn btn-danger' onclick='deleteDevice("
		                				+oData.dev_id
		                				+")'>删除</button>")
		                }
 				 	}
 				 	
 				 ],
				 
 			});
			return table;
		}
		function initDeviceTypeTable(){
			var pro_id = $('#pro_id').text();
			console.log('initDeviceTypeTable');
			console.log(pro_id);
			var table = $('#deviceTypeTable').dataTable({
 				"sAjaxSource": "AjaxServlet?flag=3&pro_id="+pro_id,
 				"bDestroy": true,
 				"bRetrieve": true,
 				"bProcessing": true,
 				"bJQuery": true,
 				"aoColumns":[
 				 	{"mDataProp": "for_id"},
 				 	{"mDataProp": "for_name"},
 				 	{"mDataProp": "for_id",
 				 		"fnCreatedCell": function(nTd,sData,oData,iRow,iCol){
 		                		$(nTd).html("<button class='btn btn-info' onclick='showFormat("
 		                				+oData.for_id
 		                				+")'>查看</button><button class='btn btn-danger' onclick='deleteFormat("
 		                				+oData.for_id
 		                				+")'>删除</button")
 		                }
 				 	}
 				 ],
				 
 			});
			return table;
		}
		function initDisplayTable(){
			var pro_id = $('#pro_id').text();
			console.log('initDisplayTable');
			console.log(pro_id);
			var table = $('#displayTable').dataTable({
 				"sAjaxSource": "AjaxServlet?flag=2&pro_id="+pro_id,
 				"bDestroy": true,
 				"bRetrieve": true,
 				"bProcessing": true,
 				"bJQuery": true,
 				"aoColumns":[
 				 	{"mDataProp": "dev_id"},
 				 	{"mDataProp": "dev_name"},
 				 	{"mDataProp": "for_id",
 				 		"fnCreatedCell": function(nTd,sData,oData,iRow,iCol){
 		                		$(nTd).html("<button class='btn btn-info' onclick='setChart("
 		                				+oData.dev_id
 		                				+")'>查看</button>")
 		                }
 				 	}
 				 ],
 			});
			return table;
		}
		function initLineChart(){
		    var chart=new Highcharts.Chart({
		    	 chart: {
		    		 renderTo: line
		    	 },
		    	 title: {
		             text: 'Monthly Average Temperature',
		             x: -20 //center
		         },
		         subtitle: {
		             text: 'Source: WorldClimate.com',
		             x: -20
		         },
		         xAxis: {
		             categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
		         },
		         yAxis: {
		             title: {
		                 text: 'Temperature (°C)'
		             },
		             plotLines: [{
		                 value: 0,
		                 width: 1,
		                 color: '#808080'
		             }]
		         },
		         tooltip: {
		             valueSuffix: '°C'
		         },
		         legend: {
		             layout: 'vertical',
		             align: 'right',
		             verticalAlign: 'middle',
		             borderWidth: 0
		         },
		         series: [{
		             name: 'Tokyo',
		             data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
		         }, {
		             name: 'New York',
		             data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
		         }, {
		             name: 'Berlin',
		             data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
		         }, {
		             name: 'London',
		             data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
		         }]
		     });
		    return chart;
		}
		function initAreaChart(){
			var chart = new Highcharts.Chart({
				 chart: {
			            type: 'area',
			            renderTo: 'area'
			        },
			        title: {
			            text: 'US and USSR nuclear stockpiles'
			        },
			        subtitle: {
			            text: 'Source: thebulletin.metapress.com'
			        },
			        xAxis: {
			            labels: {
			                formatter: function() {
			                    return this.value; // clean, unformatted number for year
			                }
			            }
			        },
			        yAxis: {
			            title: {
			                text: 'Nuclear weapon states'
			            },
			            labels: {
			                formatter: function() {
			                    return this.value / 1000 +'k';
			                }
			            }
			        },
			        tooltip: {
			            pointFormat: '{series.name} produced <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
			        },
			        plotOptions: {
			            area: {
			                pointStart: 1940,
			                marker: {
			                    enabled: false,
			                    symbol: 'circle',
			                    radius: 2,
			                    states: {
			                        hover: {
			                            enabled: true
			                        }
			                    }
			                }
			            }
			        },
			        series: [{
			            name: 'USA',
			            data: [null, null, null, null, null, 6 , 11, 32, 110, 235, 369, 640,1005, 1436,
			            		2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,27387, 29459, 31056, 31982,
			            		32040, 31233, 29224, 27342, 26662,26956, 27912, 28999, 28965, 27826, 25579,
			            		25722, 24826, 24605,24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344,
			            		23586,22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,
			                10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104 
			            ]
			        }, {
			            name: 'USSR/Russia',
			            data: [null, null, null, null, null, null, null , null , null ,null,5, 25, 50,
			            	120, 150, 200, 426, 660, 869, 1060, 1605, 2471, 3322,4238, 5221, 6129,
			            	7089, 8339, 9399, 10538, 11643, 13092, 14478,15915, 17385, 19055, 21205,
			            	23044, 25393, 27935, 30062, 32049,33952, 35804, 37431, 39197, 45000, 43000,
			            	41000, 39000, 37000,35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000,
			            	22000,21000, 20000, 19000, 18000, 18000, 17000, 16000
			            ]
			        }]
			    });
			return chart;
		}
		function initPieChart(){
			var chart = new Highcharts.Chart({
			        chart: {
			        	renderTo: pie,
			            plotBackgroundColor: null,
			            plotBorderWidth: null,
			            plotShadow: false
			        },
			        title: {
			            text: 'Browser market shares at a specific website, 2010'
			        },
			        tooltip: {
			    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			        },
			        plotOptions: {
			            pie: {
			                allowPointSelect: true,
			                cursor: 'pointer',
			                dataLabels: {
			                    enabled: true,
			                    color: '#000000',
			                    connectorColor: '#000000',
			                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
			                }
			            }
			        },
			        series: [{
			            type: 'pie',
			            name: 'Browser share',
			            data: [
			                ['Firefox',   45.0],
			                ['IE',       26.8],
			                {
			                    name: 'Chrome',
			                    y: 12.8,
			                    sliced: true,
			                    selected: true
			                },
			                ['Safari',    8.5],
			                ['Opera',     6.2],
			                ['Others',   0.7]
			            ]
			        }]
			    });
			return chart;
		}
		function initScatterChart(){
			var chart = new Highcharts.Chart({
				 chart: {
					 	renderTo: scatter,
			            type: 'scatter',                                                                 
			            zoomType: 'xy'                                                                   
			        },                                                                                   
			        title: {                                                                             
			            text: 'Height Versus Weight of 507 Individuals by Gender'                        
			        },                                                                                   
			        subtitle: {                                                                          
			            text: 'Source: Heinz  2003'                                                      
			        },                                                                                   
			        xAxis: {                                                                             
			            title: {                                                                         
			                enabled: true,                                                               
			                text: 'Height (cm)'                                                          
			            },                                                                               
			            startOnTick: true,                                                               
			            endOnTick: true,                                                                 
			            showLastLabel: true                                                              
			        },                                                                                   
			        yAxis: {                                                                             
			            title: {                                                                         
			                text: 'Weight (kg)'                                                          
			            }                                                                                
			        },                                                                                   
			        legend: {                                                                            
			            layout: 'vertical',                                                              
			            align: 'left',                                                                   
			            verticalAlign: 'top',                                                            
			            x: 100,                                                                          
			            y: 70,                                                                           
			            floating: true,                                                                  
			            backgroundColor: '#FFFFFF',                                                      
			            borderWidth: 1                                                                   
			        },                                                                                   
			        plotOptions: {                                                                       
			            scatter: {                                                                       
			                marker: {                                                                    
			                    radius: 5,                                                               
			                    states: {                                                                
			                        hover: {                                                             
			                            enabled: true,                                                   
			                            lineColor: 'rgb(100,100,100)'                                    
			                        }                                                                    
			                    }                                                                        
			                },                                                                           
			                states: {                                                                    
			                    hover: {                                                                 
			                        marker: {                                                            
			                            enabled: false                                                   
			                        }                                                                    
			                    }                                                                        
			                },                                                                           
			                tooltip: {                                                                   
			                    headerFormat: '<b>{series.name}</b><br>',                                
			                    pointFormat: '{point.x} cm, {point.y} kg'                                
			                }                                                                            
			            }                                                                                
			        },                                                                                   
			        series: [{                                                                           
			            name: 'Female',                                                                  
			            color: 'rgba(223, 83, 83, .5)',                                                  
			            data: [[161.2, 51.6], [167.5, 59.0], [159.5, 49.2], [157.0, 63.0], [155.8, 53.6],
			                [170.0, 59.0], [159.1, 47.6], [166.0, 69.8], [176.2, 66.8], [160.2, 75.2],   
			                [172.5, 55.2], [170.9, 54.2], [172.9, 62.5], [153.4, 42.0], [160.0, 50.0],   
			                [147.2, 49.8], [168.2, 49.2], [175.0, 73.2], [157.0, 47.8], [167.6, 68.8],   
			                [159.5, 50.6], [175.0, 82.5], [166.8, 57.2], [176.5, 87.8], [170.2, 72.8],   
			                [174.0, 54.5], [173.0, 59.8], [179.9, 67.3], [170.5, 67.8], [160.0, 47.0],   
			                [154.4, 46.2], [162.0, 55.0], [176.5, 83.0], [160.0, 54.4], [152.0, 45.8],   
			                [162.1, 53.6], [170.0, 73.2], [160.2, 52.1], [161.3, 67.9], [166.4, 56.6],   
			                [168.9, 62.3], [163.8, 58.5], [167.6, 54.5], [160.0, 50.2], [161.3, 60.3],   
			                [167.6, 58.3], [165.1, 56.2], [160.0, 50.2], [170.0, 72.9], [157.5, 59.8],   
			                [167.6, 61.0], [160.7, 69.1], [163.2, 55.9], [152.4, 46.5], [157.5, 54.3],   
			                [168.3, 54.8], [180.3, 60.7], [165.5, 60.0], [165.0, 62.0], [164.5, 60.3],   
			                [156.0, 52.7], [160.0, 74.3], [163.0, 62.0], [165.7, 73.1], [161.0, 80.0],   
			                [162.0, 54.7], [166.0, 53.2], [174.0, 75.7], [172.7, 61.1], [167.6, 55.7],   
			                [151.1, 48.7], [164.5, 52.3], [163.5, 50.0], [152.0, 59.3], [169.0, 62.5],   
			                [164.0, 55.7], [161.2, 54.8], [155.0, 45.9], [170.0, 70.6], [176.2, 67.2],   
			                [170.0, 69.4], [162.5, 58.2], [170.3, 64.8], [164.1, 71.6], [169.5, 52.8],   
			                [163.2, 59.8], [154.5, 49.0], [159.8, 50.0], [173.2, 69.2], [170.0, 55.9],   
			                [161.4, 63.4], [169.0, 58.2], [166.2, 58.6], [159.4, 45.7], [162.5, 52.2],   
			                [159.0, 48.6], [162.8, 57.8], [159.0, 55.6], [179.8, 66.8], [162.9, 59.4],   
			                [161.0, 53.6], [151.1, 73.2], [168.2, 53.4], [168.9, 69.0], [173.2, 58.4],   
			                [171.8, 56.2], [178.0, 70.6], [164.3, 59.8], [163.0, 72.0], [168.5, 65.2],   
			                [166.8, 56.6], [172.7, 105.2], [163.5, 51.8], [169.4, 63.4], [167.8, 59.0],  
			                [159.5, 47.6], [167.6, 63.0], [161.2, 55.2], [160.0, 45.0], [163.2, 54.0],   
			                [162.2, 50.2], [161.3, 60.2], [149.5, 44.8], [157.5, 58.8], [163.2, 56.4],   
			                [172.7, 62.0], [155.0, 49.2], [156.5, 67.2], [164.0, 53.8], [160.9, 54.4],   
			                [162.8, 58.0], [167.0, 59.8], [160.0, 54.8], [160.0, 43.2], [168.9, 60.5],   
			                [158.2, 46.4], [156.0, 64.4], [160.0, 48.8], [167.1, 62.2], [158.0, 55.5],   
			                [167.6, 57.8], [156.0, 54.6], [162.1, 59.2], [173.4, 52.7], [159.8, 53.2],   
			                [170.5, 64.5], [159.2, 51.8], [157.5, 56.0], [161.3, 63.6], [162.6, 63.2],   
			                [160.0, 59.5], [168.9, 56.8], [165.1, 64.1], [162.6, 50.0], [165.1, 72.3],   
			                [166.4, 55.0], [160.0, 55.9], [152.4, 60.4], [170.2, 69.1], [162.6, 84.5],   
			                [170.2, 55.9], [158.8, 55.5], [172.7, 69.5], [167.6, 76.4], [162.6, 61.4],   
			                [167.6, 65.9], [156.2, 58.6], [175.2, 66.8], [172.1, 56.6], [162.6, 58.6],   
			                [160.0, 55.9], [165.1, 59.1], [182.9, 81.8], [166.4, 70.7], [165.1, 56.8],   
			                [177.8, 60.0], [165.1, 58.2], [175.3, 72.7], [154.9, 54.1], [158.8, 49.1],   
			                [172.7, 75.9], [168.9, 55.0], [161.3, 57.3], [167.6, 55.0], [165.1, 65.5],   
			                [175.3, 65.5], [157.5, 48.6], [163.8, 58.6], [167.6, 63.6], [165.1, 55.2],   
			                [165.1, 62.7], [168.9, 56.6], [162.6, 53.9], [164.5, 63.2], [176.5, 73.6],   
			                [168.9, 62.0], [175.3, 63.6], [159.4, 53.2], [160.0, 53.4], [170.2, 55.0],   
			                [162.6, 70.5], [167.6, 54.5], [162.6, 54.5], [160.7, 55.9], [160.0, 59.0],   
			                [157.5, 63.6], [162.6, 54.5], [152.4, 47.3], [170.2, 67.7], [165.1, 80.9],   
			                [172.7, 70.5], [165.1, 60.9], [170.2, 63.6], [170.2, 54.5], [170.2, 59.1],   
			                [161.3, 70.5], [167.6, 52.7], [167.6, 62.7], [165.1, 86.3], [162.6, 66.4],   
			                [152.4, 67.3], [168.9, 63.0], [170.2, 73.6], [175.2, 62.3], [175.2, 57.7],   
			                [160.0, 55.4], [165.1, 104.1], [174.0, 55.5], [170.2, 77.3], [160.0, 80.5],  
			                [167.6, 64.5], [167.6, 72.3], [167.6, 61.4], [154.9, 58.2], [162.6, 81.8],   
			                [175.3, 63.6], [171.4, 53.4], [157.5, 54.5], [165.1, 53.6], [160.0, 60.0],   
			                [174.0, 73.6], [162.6, 61.4], [174.0, 55.5], [162.6, 63.6], [161.3, 60.9],   
			                [156.2, 60.0], [149.9, 46.8], [169.5, 57.3], [160.0, 64.1], [175.3, 63.6],   
			                [169.5, 67.3], [160.0, 75.5], [172.7, 68.2], [162.6, 61.4], [157.5, 76.8],   
			                [176.5, 71.8], [164.4, 55.5], [160.7, 48.6], [174.0, 66.4], [163.8, 67.3]]   
			                                                                                             
			        }, {                                                                                 
			            name: 'Male',                                                                    
			            color: 'rgba(119, 152, 191, .5)',                                                
			            data: [[174.0, 65.6], [175.3, 71.8], [193.5, 80.7], [186.5, 72.6], [187.2, 78.8],
			                [181.5, 74.8], [184.0, 86.4], [184.5, 78.4], [175.0, 62.0], [184.0, 81.6],   
			                [180.0, 76.6], [177.8, 83.6], [192.0, 90.0], [176.0, 74.6], [174.0, 71.0],   
			                [184.0, 79.6], [192.7, 93.8], [171.5, 70.0], [173.0, 72.4], [176.0, 85.9],   
			                [176.0, 78.8], [180.5, 77.8], [172.7, 66.2], [176.0, 86.4], [173.5, 81.8],   
			                [178.0, 89.6], [180.3, 82.8], [180.3, 76.4], [164.5, 63.2], [173.0, 60.9],   
			                [183.5, 74.8], [175.5, 70.0], [188.0, 72.4], [189.2, 84.1], [172.8, 69.1],   
			                [170.0, 59.5], [182.0, 67.2], [170.0, 61.3], [177.8, 68.6], [184.2, 80.1],   
			                [186.7, 87.8], [171.4, 84.7], [172.7, 73.4], [175.3, 72.1], [180.3, 82.6],   
			                [182.9, 88.7], [188.0, 84.1], [177.2, 94.1], [172.1, 74.9], [167.0, 59.1],   
			                [169.5, 75.6], [174.0, 86.2], [172.7, 75.3], [182.2, 87.1], [164.1, 55.2],   
			                [163.0, 57.0], [171.5, 61.4], [184.2, 76.8], [174.0, 86.8], [174.0, 72.2],   
			                [177.0, 71.6], [186.0, 84.8], [167.0, 68.2], [171.8, 66.1], [182.0, 72.0],   
			                [167.0, 64.6], [177.8, 74.8], [164.5, 70.0], [192.0, 101.6], [175.5, 63.2],  
			                [171.2, 79.1], [181.6, 78.9], [167.4, 67.7], [181.1, 66.0], [177.0, 68.2],   
			                [174.5, 63.9], [177.5, 72.0], [170.5, 56.8], [182.4, 74.5], [197.1, 90.9],   
			                [180.1, 93.0], [175.5, 80.9], [180.6, 72.7], [184.4, 68.0], [175.5, 70.9],   
			                [180.6, 72.5], [177.0, 72.5], [177.1, 83.4], [181.6, 75.5], [176.5, 73.0],   
			                [175.0, 70.2], [174.0, 73.4], [165.1, 70.5], [177.0, 68.9], [192.0, 102.3],  
			                [176.5, 68.4], [169.4, 65.9], [182.1, 75.7], [179.8, 84.5], [175.3, 87.7],   
			                [184.9, 86.4], [177.3, 73.2], [167.4, 53.9], [178.1, 72.0], [168.9, 55.5],   
			                [157.2, 58.4], [180.3, 83.2], [170.2, 72.7], [177.8, 64.1], [172.7, 72.3],   
			                [165.1, 65.0], [186.7, 86.4], [165.1, 65.0], [174.0, 88.6], [175.3, 84.1],   
			                [185.4, 66.8], [177.8, 75.5], [180.3, 93.2], [180.3, 82.7], [177.8, 58.0],   
			                [177.8, 79.5], [177.8, 78.6], [177.8, 71.8], [177.8, 116.4], [163.8, 72.2],  
			                [188.0, 83.6], [198.1, 85.5], [175.3, 90.9], [166.4, 85.9], [190.5, 89.1],   
			                [166.4, 75.0], [177.8, 77.7], [179.7, 86.4], [172.7, 90.9], [190.5, 73.6],   
			                [185.4, 76.4], [168.9, 69.1], [167.6, 84.5], [175.3, 64.5], [170.2, 69.1],   
			                [190.5, 108.6], [177.8, 86.4], [190.5, 80.9], [177.8, 87.7], [184.2, 94.5],  
			                [176.5, 80.2], [177.8, 72.0], [180.3, 71.4], [171.4, 72.7], [172.7, 84.1],   
			                [172.7, 76.8], [177.8, 63.6], [177.8, 80.9], [182.9, 80.9], [170.2, 85.5],   
			                [167.6, 68.6], [175.3, 67.7], [165.1, 66.4], [185.4, 102.3], [181.6, 70.5],  
			                [172.7, 95.9], [190.5, 84.1], [179.1, 87.3], [175.3, 71.8], [170.2, 65.9],   
			                [193.0, 95.9], [171.4, 91.4], [177.8, 81.8], [177.8, 96.8], [167.6, 69.1],   
			                [167.6, 82.7], [180.3, 75.5], [182.9, 79.5], [176.5, 73.6], [186.7, 91.8],   
			                [188.0, 84.1], [188.0, 85.9], [177.8, 81.8], [174.0, 82.5], [177.8, 80.5],   
			                [171.4, 70.0], [185.4, 81.8], [185.4, 84.1], [188.0, 90.5], [188.0, 91.4],   
			                [182.9, 89.1], [176.5, 85.0], [175.3, 69.1], [175.3, 73.6], [188.0, 80.5],   
			                [188.0, 82.7], [175.3, 86.4], [170.5, 67.7], [179.1, 92.7], [177.8, 93.6],   
			                [175.3, 70.9], [182.9, 75.0], [170.8, 93.2], [188.0, 93.2], [180.3, 77.7],   
			                [177.8, 61.4], [185.4, 94.1], [168.9, 75.0], [185.4, 83.6], [180.3, 85.5],   
			                [174.0, 73.9], [167.6, 66.8], [182.9, 87.3], [160.0, 72.3], [180.3, 88.6],   
			                [167.6, 75.5], [186.7, 101.4], [175.3, 91.1], [175.3, 67.3], [175.9, 77.7],  
			                [175.3, 81.8], [179.1, 75.5], [181.6, 84.5], [177.8, 76.6], [182.9, 85.0],   
			                [177.8, 102.5], [184.2, 77.3], [179.1, 71.8], [176.5, 87.9], [188.0, 94.3],  
			                [174.0, 70.9], [167.6, 64.5], [170.2, 77.3], [167.6, 72.3], [188.0, 87.3],   
			                [174.0, 80.0], [176.5, 82.3], [180.3, 73.6], [167.6, 74.1], [188.0, 85.9],   
			                [180.3, 73.2], [167.6, 76.3], [183.0, 65.9], [183.0, 90.9], [179.1, 89.1],   
			                [170.2, 62.3], [177.8, 82.7], [179.1, 79.1], [190.5, 98.2], [177.8, 84.1],   
			                [180.3, 83.2], [180.3, 83.2]]                                                
			        }]                                
			});
			return chart;
		}
		function showFormat(for_id){
			$.get("AjaxServlet?flag=4&for_id="+for_id,function(data,status){
				var obj = jQuery.parseJSON(data);
				name_array = (obj.data.for_namelist).split(',');
				type_array = (obj.data.for_typelist).split(',');
				$('#deviceTypeDetailTbody').html("");
				$('#deviceTypeDetailHeading').html(obj.data.for_name);
				for(i in name_array){
					$('#deviceTypeDetailTbody').append("<tr><td>"+name_array[i]+"</td><td>"+type_array[i]+"</td></tr>");
				}
			});
		}
		function setChart(dev_id){
			//显示dev_id数据表格
		}
		function addVar(){
			$('#varNumFormGroup1').after("");
		}
		
		</script>
</body>
</html>