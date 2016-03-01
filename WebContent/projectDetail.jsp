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
		<ul class="nav nav-stacked" role="tablist" data-spy="affix">
	      <li role="presentation" class="active"><a href="#devicePage" id="device-tab" role="tab" data-toggle="tab" aria-controls="devicePage" aria-expanded="true">设备管理</a></li>
	      <li role="presentation"><a href="#displayPage" role="tab" id="display-tab" data-toggle="tab" aria-controls="displayPage">数据展示</a></li>
	      <li role="presentation"><a href="#warningPage" role="tab" id="warning-tab" data-toggle="tab" aria-controls="warningPage">预警</a></li>
	      <!-- admin -->
	      <li role="presentation" id="admin1"><a href="#setPage" role="tab" id="set-tab" data-toggle="tab" aria-controls="setPage">设置</a></li>
	    </ul>
    </div>
    <div class="col-md-10">
	    <div class="tab-content">
	    <!-- device page  -->
	      <div role="tabpanel" class="tab-pane fade in active" id="devicePage" aria-labelledBy="device-tab">
	     
		      <ul class="nav nav-tabs" role="tablist">
			    <li role="presentation" class="active"><a href="#deviceTypePage" aria-controls="deviceTypePage" role="tab" data-toggle="tab">查看设备类型</a></li>
			    <!-- admin -->
			    <li role="presentation" id="admin2"><a href="#addDeviceTypePage" aria-controls="addDeviceTypePage" role="tab" data-toggle="tab">添加设备类型</a></li>
			    
			    <li role="presentation"><a href="#deviceInstancePage" aria-controls="deviceInstancePage" role="tab" data-toggle="tab">查看设备信息</a></li>
			    <!-- admin -->
			    <li role="presentation" id="admin3"><a href="#addDeviceInstancePage" aria-controls="addDeviceInstancePage" role="tab" data-toggle="tab">添加设备</a></li>
			    
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
								</tr>	
							</thead>
							<tbody></tbody>
						</table>
						
						<!-- Modal -->
						<div class="modal fade" id="deviceTypeDetail" tabindex="-1" role="dialog" aria-labelledby="deviceTypeDetailHeading">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="deviceTypeDetailHeading">Modal title</h4>
						      </div>
						      <div class="modal-body">
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
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						      </div>
						    </div>
						  </div>
						</div>
						<!-- modal -->
						
		        	</div>
			    </div>
			    <!-- device type page end -->
			    
			    <!-- add device type page -->
			    <div role="tabpanel" class="tab-pane" id="addDeviceTypePage">
			    	<div style="margin-top:20px">
				        <div class="form-horizontal" >
				          <div class="form-group">
				          	<p class="text-danger col-md-2 col-md-offset-2" id="addDeviceTypeError"></p>
				          </div>
						  <div class="form-group">
						    <label for="deviceTypeName" class="col-md-2 control-label">类型名称</label>
						    <div class="col-md-5">
						      <input type="text" class="form-control" id="deviceTypeName" name="deviceTypeName" placeholder="设备类型名">
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
						    <input type="text" id="for_num" name="for_num" value="0" style="display:none">
						    </div>
						    <button style="margin-bottom:10px" class="btn btn-warning col-md-offset-2" type="button" id="but" >
						    	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						    </button>
						  </div>
						  <div class="form-group">
						    <div class="col-md-offset-1">
						      <button id="addDeviceTypeBtn" class="btn btn-success">添加</button>
						    </div>
						  </div>
					  	</div><!-- </form> -->
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
				        <div class="form-horizontal">
						  <div class="form-group">
				          	<p class="text-danger col-md-2 col-md-offset-2" id="addDeviceInstanceError"></p>
				          </div>
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
						  <div class="form-group" id="deviceNamePrefixInput" style="display:none">
						    <label for="deviceNamePrefix" class="col-md-2 control-label">设备前缀名</label>
						    <div class="col-md-5">
						      <input type="text" class="form-control" id="deviceNamePrefix" name="deviceNamePrefix" placeholder="设备前缀名">
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
						      <button id="addDeviceInstanceBtn" class="btn btn-success">添加</button>
						    </div>
						  </div>
					  	</div><!-- </form> -->
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
			  	<!-- dataTable page -->
			    <div role="tabpanel" class="tab-pane active" id="dataTablePage">
				    <table class="table table-hover" id="deviceDataTable">
						<thead></thead>
						<tbody></tbody>
					</table>
			    </div>
			    <!-- dataTablePage page end -->
			    <div role="tabpanel" class="tab-pane" id="dataChartPage">
				  <div class="row">
				    <div class="col-md-2">
				    	<ul class="nav nav-stacked" role="tablist">
					      <li role="presentation" class="active"><a href="#line" id="line-tab" role="tab" data-toggle="tab" aria-controls="line" aria-expanded="true">折线图</a></li>
					      <li role="presentation"><a href="#area" role="tab" id="area-tab" data-toggle="tab" aria-controls="area">区域图</a></li>
					      <li role="presentation"><a href="#scatter" role="tab" id="scatter-tab" data-toggle="tab" aria-controls="scatter">散点图</a></li>
					    </ul>
				    </div>
				    <div class="col-md-10">
					    <div class="tab-content">
					    	<div role="tabpanel" class="tab-pane fade in active" id="line" aria-labelledBy="line-tab">
					    		<div><h3 id="dev_name_line"></h3></div>
					    		<div style="display:none"><h3 id="dev_id_line"></h3></div>
							    <div class="form-group" style="margin-top:20px">
								    <label for="lineX" class="col-md-1 control-label">x</label>
								    <div class="col-md-3">
								      <select class="form-control" id="lineX" name="lineX"></select>
								    </div>
								    <label for="lineY" class="col-md-1 control-label">y</label>
								    <div class="col-md-3">
								      <select class="form-control" id="lineY" name="lineY"></select>
								    </div>
								    <button class="btn btn-success" id="lineBtn" style="float:right">确定</button>
								</div>
								<div id="lineChart"></div>
					    	</div>
					    	<div role="tabpanel" class="tab-pane fade" id="area" aria-labelledBy="area-tab">
					    		<div><h3 id="dev_name_area"></h3></div>
					    		<div style="display:none"><h3 id="dev_id_area"></h3></div>
							    <div class="form-group" style="margin-top:20px">
								    <label for="areaX" class="col-md-1 control-label">x</label>
								    <div class="col-md-3">
								      <select class="form-control" id="areaX" name="areaX"></select>
								    </div>
								    <label for="areaY" class="col-md-1 control-label">y</label>
								    <div class="col-md-3">
								      <select class="form-control" id="areaY" name="areaY"></select>
								    </div>
								    <button class="btn btn-success" id="areaBtn" style="float:right">确定</button>
								</div>
								<div id="areaChart"></div>
					    	</div>
					    	<div role="tabpanel" class="tab-pane fade" id="scatter" aria-labelledBy="scatter-tab">
					    		<div><h3 id="dev_name_scatter"></h3></div>
					    		<div style="display:none"><h3 id="dev_id_scatter"></h3></div>
							    <div class="form-group" style="margin-top:20px">
								    <label for="scatterX" class="col-md-1 control-label">x</label>
								    <div class="col-md-3">
								      <select class="form-control" id="scatterX" name="scatterX"></select>
								    </div>
								    <label for="scatterY" class="col-md-1 control-label">y</label>
								    <div class="col-md-3">
								      <select class="form-control" id="scatterY" name="scatterY"></select>
								    </div>
								    <button class="btn btn-success" id="scatterBtn" style="float:right">确定</button>
								</div>
								<div id="scatterChart"></div>
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
	        <div class="form-horizontal" style="margin-top:20px">
		  <div class="form-group" style="margin-top:20px">
		    <label for="username" class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button id="addUserBtn" class="btn btn-success">添加</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		     	<p class="text-danger" id="addUserError"></p> 
		    </div>
		  </div>
		  
		</div><!-- form -->
	      </div>
	      <!-- set page end-->
	    </div>
	</div>
	<script>
		var deviceTable;
		var deviceTypeTable;
		$(document).ready(function(){
			deviceTable = initDeviceTable();
			deviceTypeTable = initDeviceTypeTable();
			displayTable = initDisplayTable();
			//scatterChart = initScatterChart();
			initSelect();
			initRole();
		});
		
		$("#but").click(function(){
            var _len = $("#formatTable tbody tr").length;        
            $("#formatTable tbody").append("<tr id="+_len+">"
                                +"<td><input type='text' name=fname"+_len+"></td>"
                                +"<td><select name=ftype"+_len+"></select></td>"
                                +"<td><button class='btn btn-danger' onclick='deltr("+_len+")'>"
                                +"<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
                                +"</button></td>"
                            +"</tr>");
            $("#for_num").attr("value",_len+1);
			initTypeList(_len);
        }); 
		function deltr(index){
	    	var _len = $("#formatTable tbody tr").length;
	       	if( _len == 1){
	       		$("tr[id='"+index+"']").remove();
	       		$("#for_num").attr("value",'0');
	       	}else{
		        for(var i=index;i<_len-1;i++){
		        	$("tr[id=\'"+(i+1)+"\']").each(function(trindex,tritem){
		    		 value1 = jQuery(tritem).find("td").eq(0).find("input").val();
		    		 value2 = (jQuery(tritem).find("td").eq(1).find("select option:selected").text());
		    		}); 
		        	$("tr[id=\'"+i+"\']")
	         		.replaceWith("<tr id="+i+">"
	                                +"<td><input type='text' value='" + value1 + "'name=fname" + i + "'/></td>"
	                                +"<td><select name=ftype"+ i +"></select></td>"
	                                +"<td><button class='btn btn-danger' onclick=\'deltr(" + i + ")\'>"
	                                +"<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>"
	                                +"</button></td>"
	                            +"</tr>");
		        	updateTypeList(i,value2);
		        }
		        $("tr[id='"+(_len-1)+"']").remove();
		        $("#for_num").attr("value",_len-1);
	       	}
		}
		$('input[id=single]').click(function(){
			//console.log(0);
			$('div[id=deviceNameInput]').css('display','block');
			$('div[id=deviceNumInput]').css('display','none');
			$('div[id=deviceNamePrefixInput]').css('display','none');
		});
		$('input[id=batch]').click(function(){
			//console.log(1);
			$('div[id=deviceNameInput]').css('display','none');
			$('div[id=deviceNumInput]').css('display','block');
			$('div[id=deviceNamePrefixInput]').css('display','block');
		});
		$('#addDeviceTypeBtn').click(function(){
			$("#addDeviceTypeError").text("");
			var for_name = $("#deviceTypeName").val();
			var for_num = $("#for_num").val();
			var pro_id = $("#pro_id").text();
			var for_namelist = "";
			var for_typelist = "";
			//alert("for_name:"+for_name);
			//alert("for_num:"+for_num);
			//alert("pro_id:"+pro_id);
			//检查设备类型名
			if(for_name == "" || for_name == null){
				$("#addDeviceTypeError").text("设备类型名不能为空！");
				return;
			}
			if(for_num == "0"){
				$("#addDeviceTypeError").text("数据格式数不能为0！");
				return;
			}
			//检查变量名
			for(var i = 0;i<for_num;i++){
				var tmp1 = $("input[name='fname"+i+"']").val();
				var tmp2 = $("select[name='ftype"+i+"']").find("option:selected").text();
				//alert(tmp1);
				if(tmp1==""||tmp1==null){
					$("#addDeviceTypeError").text("变量名不能为空！");
					return;
				}
				if(i == for_num - 1){
					for_namelist=for_namelist + tmp1;
					for_typelist=for_typelist + tmp2;
				}else{
					for_namelist=for_namelist + tmp1 +",";
					for_typelist=for_typelist + tmp2+ ",";
				}
			}
			//访问服务器，判断format有效性，插入format数据库，新建表，返回信息
			//alert("for_namelist:"+for_namelist);
			//alert("for_typelist:"+for_typelist);
			$.ajax({  
			      type: "POST",  
			      url: "AddFormatServlet",
			      async: true,
			      dataType: "json",  
			      cache: false,  
		      	  data: {  
			          "for_name": for_name,  
			          "for_namelist": for_namelist,
			          "for_typelist": for_typelist,
			          "pro_id": pro_id,
			          "for_num": for_num
			      },  
			      success: function(data) {
			    	  alert(data.ret);
			    	  //dataTable(){}返回一个jQuery,DataTable(){}返回一个api对象,前者可能出现有的函数是用不了。
			    	  //使用api()将jQuery对象转化为api对象
			    	  deviceTypeTable.api().ajax.reload();
			    	  initSelect();
			    	  alert("刷新完毕");
			      },
			      error: function(XMLHttpRequest, textStatus, errorThrown) {
                      //alert(XMLHttpRequest.status);//200
                      //alert(XMLHttpRequest.readyState);//4
                      //alert(textStatus);//parseerror
                      alert("error!");
                  }
			  });
		});
		$('#addDeviceInstanceBtn').click(function(){
			$("#addDeviceInstanceError").text("");
			var pro_id = $("#pro_id").text();
			var opt = $("input[name=batchOptions]:checked").val();
			if(opt=="0"){
				var dev_name = $("#deviceName").val();
				var for_name = $("select[name='deviceType']").find("option:selected").text();
				//alert("dev_name:"+dev_name);
				//alert("for_name:"+for_name);
				//alert("pro_id:"+pro_id);
				//检查设备名
				if(dev_name == "" || dev_name == null){
					$("#addDeviceInstanceError").text("设备名不能为空！");
					return;
				}
				//访问服务器，判断device有效性，插入device数据库，返回信息
				$.ajax({  
				      type: "POST",  
				      url: "AddDeviceServlet",
				      async: true,
				      dataType: "json",  
				      cache: false,  
			      	  data: {
			      		  "batch": false,
				          "dev_name": dev_name,  
				          "pro_id": pro_id,
				          "for_name": for_name
				      },  
				      success: function(data) {
				    	  alert(data.ret);
				    	  displayTable.api().ajax.reload();
				    	  deviceTable.api().ajax.reload();
				    	  alert("刷新完毕");
				      },
				      error: function(XMLHttpRequest, textStatus, errorThrown) {
	                      //alert(XMLHttpRequest.status);//200
	                      //alert(XMLHttpRequest.readyState);//4
	                      //alert(textStatus);//parseerror
	                      alert("error!");
	                  }
				  });
			}else{
				var dev_name_prefix = $("#deviceNamePrefix").val();
				var for_name = $("select[name='deviceType']").find("option:selected").text();
				var dev_num = $("#deviceNum").val();
				//alert("dev_name_prefix:"+dev_name_prefix);
				//alert("for_name:"+for_name);
				//alert("pro_id:"+pro_id);
				//alert("dev_num:"+dev_num);
				//检查设备名
				if(dev_name_prefix == "" || dev_name_prefix == null){
					$("#addDeviceInstanceError").text("设备前缀名不能为空！");
					return;
				}
				//访问服务器，判断device有效性，插入device数据库，返回信息
				$.ajax({  
				      type: "POST",  
				      url: "AddDeviceServlet",
				      async: true,
				      dataType: "json",  
				      cache: false,  
			      	  data: {
			      		  "batch": true, 
				          "dev_name_prefix": dev_name_prefix,  
				          "pro_id": pro_id,
				          "for_name": for_name,
				          "dev_num": dev_num
				      },  
				      success: function(data) {
				    	  alert(data.ret);
				    	  deviceTable.api().ajax.reload();
				    	  alert("刷新完毕");
				      },
				      error: function(XMLHttpRequest, textStatus, errorThrown) {
	                      //alert(XMLHttpRequest.status);//200
	                      //alert(XMLHttpRequest.readyState);//4
	                      //alert(textStatus);//parseerror
	                      alert("error!");
	                  }
				  });
			}
			
		});
		$("#addUserBtn").click(function(){
			$("#addUserError"),text("");
			var pro_id = $("#pro_id").text();
			var username = $("input[name='username']").val();
			//检查设备名
			if(username == "" || username == null){
				$("#addUserError").text("用户名不能为空！");
				return;
			}
			//访问服务器，判断device有效性，插入device数据库，返回信息
			$.ajax({  
			      type: "POST",  
			      url: "AddUserServlet",
			      async: true,
			      dataType: "json",  
			      cache: false,  
		      	  data: { 
			          "pro_id": pro_id,
			          "role": 0
			      },  
			      success: function(data) {
			    	  alert(data.ret);
			    	  deviceTable.api().ajax.reload();
			    	  alert("刷新完毕");
			      },
			      error: function(XMLHttpRequest, textStatus, errorThrown) {
                      //alert(XMLHttpRequest.status);//200
                      //alert(XMLHttpRequest.readyState);//4
                      //alert(textStatus);//parseerror
                      alert("error!");
                  }
			  });
		});
		function initTypeList(n){
			$.get("AjaxServlet?flag=5",function(data,status){
				var obj = jQuery.parseJSON(data);
				var len = obj.data.length;
				for(var i = 0;i<len;i++){
					$("select[name='ftype"+n+"']").append("<option>"+obj.data[i].t_name+"</option>");
				}
			});
		}
		function updateTypeList(n,value){
			$.get("AjaxServlet?flag=5",function(data,status){
				var obj = jQuery.parseJSON(data);
				var len = obj.data.length;
				for(var i = 0;i<len;i++){
					if(obj.data[i].t_name == value){
						$("select[name='ftype"+n+"']").append("<option selected>"+obj.data[i].t_name+"</option>");
					}else{
						$("select[name='ftype"+n+"']").append("<option>"+obj.data[i].t_name+"</option>");
					}
				}
			});
		}
		function initSelect(){
			var pro_id = $('#pro_id').text();
			$.get("AjaxServlet?flag=3&pro_id="+pro_id,function(data,status){
				var obj = jQuery.parseJSON(data);
				var len = obj.aaData.length;
				$("select[id='deviceType']").html("");
				for(var i = 0;i<len;i++){
					$("select[id='deviceType']").append("<option>"+obj.aaData[i].for_name+"</option>");
				}
			});
			
		}
		function initRole(){
			//alert("u_id:"+$("#u_id").text().trim());
			//alert("pro_id:"+$("#pro_id").text());
			$.ajax({  
			      type: "POST",  
			      url: "AjaxServlet",
			      async: true,
			      dataType: "json",  
			      cache: false,  
		      	  data: {  
			          "flag": "7",  
			          "u_id":  $("#u_id").text().trim(),
			          "pro_id": $("#pro_id").text()
			      },  
			      success: function(data) {
			    	  //alert("success");
			    	  //alert("role:"+data.ret);
			    	  if(data.ret == 1){
				    	  $("#admin1").css('display','none');
				    	  $("#admin2").css('display','none');
				    	  $("#admin3").css('display','none');
			    	  }
			      }  
			  });
			
		}

		$("#lineBtn").click(function(){
			var dev_name = $("#dev_name_line").text();
			var dev_id = $("#dev_id_line").text();
			var xName = $("#lineX").find("option:selected").text();
			var yName = $("#lineY").find("option:selected").text();
			//alert("xName:"+xName);
			//alert("yName:"+yName);
			//alert("dev_id:"+dev_id);
			$.ajax({  
			      type: "POST",  
			      url: "GetDeviceChartServlet",
			      async: true,
			      dataType: "json",  
			      cache: false,  
		      	  data: {  
			          "dev_id": dev_id,
			          "xName": xName,
			          "yName": yName
			      },  
			      success: function(data) {
			    	  //alert("begin initLineChart!");
			    	  initLineChart(dev_name,xName,yName,data.xData,data.yData);
			    	  //alert("end initLineChart!");
			      },
			      error: function(XMLHttpRequest, textStatus, errorThrown) {
			    	alert("error!");
                    alert(XMLHttpRequest.status);//200
                    alert(XMLHttpRequest.readyState);//4
                    alert(textStatus);//parseerror
                    
                }
			  });
			
		});
		$("#areaBtn").click(function(){
			var dev_name = $("#dev_name_area").text();
			var dev_id = $("#dev_id_area").text();
			var xName = $("#areaX").find("option:selected").text();
			var yName = $("#areaY").find("option:selected").text();
			//alert("xName:"+xName);
			//alert("yName:"+yName);
			//alert("dev_id:"+dev_id);
			$.ajax({  
			      type: "POST",  
			      url: "GetDeviceChartServlet",
			      async: true,
			      dataType: "json",  
			      cache: false,  
		      	  data: {  
			          "dev_id": dev_id,
			          "xName": xName,
			          "yName": yName
			      },  
			      success: function(data) {
			    	  //alert("begin initAreaChart!");
			    	  initAreaChart(dev_name,xName,yName,data.xData,data.yData);
			    	  //alert("end initAreaChart!");
			      },
			      error: function(XMLHttpRequest, textStatus, errorThrown) {
			    	alert("error!");
                    alert(XMLHttpRequest.status);//200
                    alert(XMLHttpRequest.readyState);//4
                    alert(textStatus);//parseerror
                    
                }
			  });
			
		});
		$("#scatterBtn").click(function(){
			var dev_name = $("#dev_name_scatter").text();
			var dev_id = $("#dev_id_scatter").text();
			var xName = $("#scatterX").find("option:selected").text();
			var yName = $("#scatterY").find("option:selected").text();
			//alert("xName:"+xName);
			//alert("yName:"+yName);
			//alert("dev_id:"+dev_id);
			$.ajax({  
			      type: "POST",  
			      url: "GetDeviceChartServlet",
			      async: true,
			      dataType: "json",  
			      cache: false,  
		      	  data: {  
			          "dev_id": dev_id,
			          "xName": xName,
			          "yName": yName
			      },  
			      success: function(data) {
			    	  //alert("begin initScatterChart!");
			    	  initScatterChart(dev_name,xName,yName,data.xData,data.yData);
			    	  //alert("end initScatterChart!");
			      },
			      error: function(XMLHttpRequest, textStatus, errorThrown) {
			    	alert("error!");
                    alert(XMLHttpRequest.status);//200
                    alert(XMLHttpRequest.readyState);//4
                    alert(textStatus);//parseerror
                    
                }
			  });
			
		});
		function getFormatName(nTd,oData){
			$.ajax({  
				      type: "POST",  
				      url: "AjaxServlet",
				      async: true,
				      dataType: "json",  
				      cache: false,  
			      	  data: {  
				          "flag": "4",  
				          "for_id": oData.for_id    
				      },  
				      success: function(data) {
				    	  //alert("success");
				    	  ret = data.data.for_name;
				    	  $(nTd).html("<button class='btn btn-info'"
 		                				+">" + ret + "</button>");
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
 		                		$(nTd).html("<button class='btn btn-info' data-toggle='modal' data-target='#deviceTypeDetail' onclick='showFormat("
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
		function initLineChart(dev_name,xName,yName,xData,yData){
			
		    var chart=new Highcharts.Chart({
		    	 chart: {
		    		 renderTo: lineChart
		    	 },
		    	 title: {
			            text: ''
			     },
		         xAxis: {
		             //categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
		         	title:{
		         		text: xName
		         	},
		         	categories: xData
		         },
		         yAxis: {
		             title: {
		                 //text: 'Temperature (°C)'
		                 text: yName
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
		         series: [{
		             //name: 'Tokyo',
		             //data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
		         	 name: dev_name,
		         	 data: yData
		         }]
		     });
		    return chart;
		}
		function initAreaChart(dev_name,xName,yName,xData,yData){
			var chart = new Highcharts.Chart({
				 chart: {
			            type: 'area',
			            renderTo: areaChart
			        },
			        title: {
			            text: ''
			        },
			        xAxis: {
			            //labels: {
			            //    formatter: function() {
			            //        return this.value; // clean, unformatted number for year
			            //    }
			           // }
			        	title:{
			         		text: xName
			         	},
			         	categories: xData
			        },
			        yAxis: {
			            //title: {
			            //    text: 'Nuclear weapon states'
			           // },
			            //labels: {
			           //     formatter: function() {
			            //        return this.value / 1000 +'k';
			            //    }
			           // }
			        	title: {
			                 //text: 'Temperature (°C)'
			                 text: yName
			             }
			        },
			        tooltip: {
			            //pointFormat: '{series.name} produced <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
			        },
			        plotOptions: {
			            area: {
			                //pointStart: 1940,
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
			        legend: {
			             layout: 'vertical',
			             align: 'right',
			             verticalAlign: 'middle',
			             borderWidth: 0
			         },
			        series: [{
			            //name: 'USA',
			            /*data: [null, null, null, null, null, 6 , 11, 32, 110, 235, 369, 640,1005, 1436,
			            		2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,27387, 29459, 31056, 31982,
			            		32040, 31233, 29224, 27342, 26662,26956, 27912, 28999, 28965, 27826, 25579,
			            		25722, 24826, 24605,24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344,
			            		23586,22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,
			                10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104 ]*/
			             name: dev_name,
			             data: yData
			            
			        }]
			    });
			return chart;
		}
		function initScatterChart(dev_name,xName,yName,xData,yData){
			var chart = new Highcharts.Chart({
				 chart: {
					 	renderTo: scatterChart,
			            type: 'scatter'                                                                 
			            //zoomType: 'xy'                                                                   
			        },                                                                                   
			        title: {                                                                             
			            text: ''                        
			        },                                                                                                                                                               
			        xAxis: {                                                                             
			            title: {                                                                         
			                enabled: true,                                                               
			                text: xName                                                          
			            },                                                                               
			            startOnTick: true,                                                               
			            endOnTick: true,                                                                 
			            showLastLabel: true,
			            categories: xData
			        },                                                                                   
			        yAxis: {                                                                             
			            title: {                                                                         
			                text: yName                                                          
			            }                                                                                
			        },                                                                                   
			        legend: {
			             layout: 'vertical',
			             align: 'right',
			             verticalAlign: 'middle',
			             borderWidth: 0
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
			                    //headerFormat: '<b>{series.name}</b><br>',                                
			                    //pointFormat: '{point.x} cm, {point.y} kg'                                
			                }                                                                            
			            }                                                                                
			        },                                                                                   
			        series: [{                                                                           
			            name: dev_name,                                                                                                                  
			            /*data: [[161.2, 51.6], [167.5, 59.0], [159.5, 49.2], [157.0, 63.0], [155.8, 53.6],
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
			                [176.5, 71.8], [164.4, 55.5], [160.7, 48.6], [174.0, 66.4], [163.8, 67.3]] */
			                data: yData
			        }]                                
			});
			return chart;
		}
		function showFormat(for_id){
			$.ajax({  
			      type: "POST",  
			      url: "AjaxServlet",
			      async: true,
			      dataType: "json",  
			      cache: false,  
		      	  data: {  
			          "flag": "4",  
			          "for_id": for_id    
			      },  
			      success: function(data) {
			    	  //alert("success");
						name_array = (data.data.for_namelist).split(',');
						type_array = (data.data.for_typelist).split(',');
						$('#deviceTypeDetailTbody').html("");
						$('#deviceTypeDetailHeading').html(data.data.for_name);
						for(i in name_array){
							$('#deviceTypeDetailTbody').append("<tr><td>"+name_array[i]+"</td><td>"+type_array[i]+"</td></tr>");
						}
			      }  
			  });
		}
		function deleteFormat(for_id){
			//alert("for_id:"+for_id);
			var pro_id = $("#pro_id").val();
			$.ajax({  
			      type: "POST",  
			      url: "DeleteFormatServlet",
			      async: true,
			      dataType: "json",  
			      cache: false,  
		      	  data: {  
			          "for_id": for_id
			      },  
			      success: function(data) {
			    	  alert(data.ret);
			    	  deviceTypeTable.api().ajax.reload();
			    	  initSelect();
			    	  alert("刷新完毕");
			      },
			      error: function(XMLHttpRequest, textStatus, errorThrown) {
                      alert(XMLHttpRequest.status);//200
                      alert(XMLHttpRequest.readyState);//4
                      alert(textStatus);//parseerror
                      //alert("error!");
                  }
			  });
		}
		function deleteDevice(dev_id){
			/*$.get("AjaxServlet?flag=6&dev_id="+dev_id,function(data,status){
				var obj = jQuery.parseJSON(data);
				alert(obj.ret);
				deviceTable.api().ajax.reload();
				alert("刷新完毕");
			});*/
			$.ajax({  
			      type: "POST",  
			      url: "AjaxServlet",
			      async: true,
			      dataType: "json",  
			      cache: false,  
		      	  data: {
		      		  "flag": 6,
			          "dev_id": dev_id
			      },  
			      success: function(data) {
			    	  //var obj = jQuery.parseJSON(data);
						//alert(obj.ret);
						displayTable.api().ajax.reload();
						deviceTable.api().ajax.reload();
						alert("刷新完毕");
			      },
			      error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);//200
                    alert(XMLHttpRequest.readyState);//4
                    alert(textStatus);//parseerror
                    //alert("error!");
                }
			  });
		}
		function setChart(dev_id){
			$("#dev_id_line").text(dev_id);
			$("#dev_id_area").text(dev_id);
			$("#dev_id_scatter").text(dev_id);
			$("#deviceDataTable thead").html("");
			$("#deviceDataTable tbody").html("");
			$.ajax({  
			      type: "POST",  
			      url: "GetDeviceDataServlet",
			      async: true,
			      dataType: "json",  
			      cache: false,  
		      	  data: {  
			          "dev_id": dev_id
			      },  
			      success: function(data) {
			    	  //deviceDataTable table thead tr td..td 构建表格表头
			    	  //alert(data.thead);
			    	  $("#deviceDataTable thead").html(data.thead);
			    	  //找到for_name+pro_id 为名的数据表，构建deviceDataTable tbody部分
			    	  var line_num = data.tbody.split(",").length;
			    	  var col_num = data.tbody.split(",")[0].split(":").length;
			    	  for(var i=0;i<line_num-1;i++){
			    		  var tr = "<tr>";
			    		  var line = data.tbody.split(",")[i];
			    		  for(var j=0;j<col_num-1;j++){
			    			  tr+="<td>"+line.split(":")[j]+"</td>";
			    		  }
			    		  tr+="</tr>";
			    		  $("#deviceDataTable tbody").append(tr);
			    	  }
			    	  
			    	  //显示dev_name
			    	  $("#dev_name_line").text(data.dev_name);
			    	  $("#dev_name_area").text(data.dev_name);
			    	  $("#dev_name_scatter").text(data.dev_name);
			    	  //构建lineX,lineY中的option
			    	  $("#lineX").html(data.optionList);
			    	  $("#lineY").html(data.optionList);
			    	  $("#areaX").html(data.optionList);
			    	  $("#areaY").html(data.optionList);
			    	  $("#scatterX").html(data.optionList);
			    	  $("#scatterY").html(data.optionList);
			      },
			      error: function(XMLHttpRequest, textStatus, errorThrown) {
                      alert(XMLHttpRequest.status);//200
                      alert(XMLHttpRequest.readyState);//4
                      alert(textStatus);//parseerror
                      //alert("error!");
                  }
			  });
			
		}
		function addVar(){
			$('#varNumFormGroup1').after("");
		}
		
		</script>
</body>
</html>