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
			$("#addUserError").text("");
			var pro_id = $("#pro_id").text();
			var username = $("input[name='username']").val();
			//检查设备名
			if(username == "" || username == null){
				$("#addUserError").text("用户名不能为空！");
				return;
			}
			//访问服务器，判断用户是否存在，插入user数据库，返回信息
			$.ajax({  
			      type: "POST",  
			      url: "AddUserServlet",
			      async: true,
			      dataType: "json",  
			      cache: false,  
		      	  data: { 
			          "username": username,
			     	  "pro_id": pro_id
			      },  
			      success: function(data) {
			    	  //alert(data.ret);
			    	  $("#addUserError").text(data.ret);
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