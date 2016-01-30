<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="main.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>站点分布详细信息</title>
</head>
<body>
	<div class="col-md-10">
	
		<div class="btn-group" data-toggle="buttons">
		  <label class="btn btn-default active" id="op1">
		    <input type="checkbox" name="checkbox" autocomplete="off" checked> 数据表格
		  </label>
		  <label class="btn btn-default active" id="op2">
		    <input type="checkbox" name="checkbox" autocomplete="off"> 时间-经纬度
		  </label>
		  <label class="btn btn-default active" id="op3">
		    <input type="checkbox" name="checkbox" autocomplete="off"> 时间-x,y,高程
		  </label>
		</div>
		
		<!-- basedata 列表 -->
		<h1 id="bl_id"><%=request.getParameter("bl_id") %></h1>
		<div id="basedataDiv" class="display:block">
		<table id="basedataTable">
			<thead>
				<tr>
					<th>北京结算时间</th>
					<th>RSM误差因子</th>
					<th>纬度</th>
					<th>经度</th>
					<th>x轴</th>
					<th>y轴</th>
					<th>高程</th>
			</thead>
			<tbody>
				
			</tbody>
		</table>
		</div>
		<div id="lat-lon-chart" class="display:block">
		
		</div>
		<div id="xyz-chart" class="display:block">
		
		</div>	
	</div>
	<script>
	var basedataTable;
	var latlonChart;
	var xyzChart;
	$(document).ready(function(){
		var bl_id = $('#bl_id').text();
		basedataTable = initBasedataTable(bl_id);
		//latlonChart = initLatlonChart();
		//xyzChart = initXyzChart();
		$('#op1').click(function(){
			if($("#op1").attr("class")=="btn btn-default active"){
				console.log("active");
				$("#basedataDiv").css("display","none");
			}else{
				console.log("no active");
				$("#basedataDiv").css("display","block");
			}
		});
		$('#op2').click(function(){
			if($("#op2").attr("class")=="btn btn-default active"){
				$("#lat-lon-chart").css("display","none");
				console.log("active");
				
			}else{
				console.log("no active");
				$("#lat-lon-chart").css("display","block");
			}
		});
		$('#op3').click(function(){
			if($("#op3").attr("class")=="btn btn-default active"){
				console.log("active");
				$("#xyz-chart").css("display","none");
			}else{
				console.log("no active");
				$("#xyz-chart").css("display","block");
			}
		});
		
		$.ajax({
			url: "AjaxServlet?flag=3&bl_id="+bl_id,
			dataType: "json",
			type: "post",
			success: function(backdata){
				//console.log(backdata);
				console.log(backdata.timeList);
				console.log(backdata.lonList);
				console.log(backdata.latList);
				latlonChart = initLatlonChart(backdata.timeList,backdata.latList,backdata.lonList);
				xyzChart = initXyzChart(backdata.timeList,backdata.xList,backdata.yList,backdata.zList);
			},
			error: function(error){
				
			}
		});
		
	});
	
	function initBasedataTable(bl_id){
		var table = $('#basedataTable').dataTable({
				"sAjaxSource": "AjaxServlet?flag=2&bl_id="+bl_id,
				"bDestroy": true,
				"bRetrieve": true,
				"bProcessing": true,
				"bJQuery": true,
				"aoColumns":[
				 	{"mDataProp": "b_time"},
				 	{"mDataProp": "b_prec"},
				 	{"mDataProp": "b_lat"},
				 	{"mDataProp": "b_lon"},
				 	{"mDataProp": "b_x"},
				 	{"mDataProp": "b_y"},
				 	{"mDataProp": "b_z"}
				 ]
			 
			});
		return table;
	}
	function initLatlonChart(timeserious, latData,lonData){
		var chart = new Highcharts.Chart({
			chart: {
				renderTo: 'lat-lon-chart'
			},
	        title: {
	            text: '经纬度变化',
	            x: -20 //center
	        },
	        subtitle: {
	            text: 'Source: 北斗 & GPS',
	            x: -20
	        },
	        xAxis: {
	        	title:{
	        		text: '时间'
	        	},
	            //categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
	        	categories: timeserious
	        },
	        yAxis: {
	            title: {
	                text: '经纬度'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }]
	        },
	        tooltip: {
	            //valueSuffix: '°C'
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        series: [
		        {
		            name: '纬度(lat)',
		            //data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
		        	data: latData
		        }, 
		        {
		            name: '经度(lon)',
		            //data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
		        	data: lonData
		        } 
	        ]
	    });
		return chart;
	}
	function initXyzChart(timeserious,xData,yData,zData){
		var chart =	new Highcharts.Chart({
			chart: {
				renderTo: 'xyz-chart'
			},
	        title: {
	            text: 'xy高程变化',
	            x: -20 //center
	        },
	        subtitle: {
	            text: 'Source: 北斗 & GPS',
	            x: -20
	        },
	        xAxis: {
	            //categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
	        	categories: timeserious
	        },
	        yAxis: {
	            title: {
	                text: 'x/y/高程'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }]
	        },
	        tooltip: {
	            //valueSuffix: '°C'
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        series: [
		        {
		            name: 'x',
		            //data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
		        	data: xData
		        }, 
		        {
		            name: 'y',
		            //data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
		        	data: yData
		        }, 
		        {
		            name: '高程',
		            //data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
		        	data: zData
		        }
	        ]
	    });
		return chart;

	}
	</script>
</body>
</html>