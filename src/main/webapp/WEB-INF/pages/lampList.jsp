<%--
  User: shiddiq
  Date: 12.03.2016
  Time: 06:00 AM Balikpapan add jstl spring form tag 
  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page session="true"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="shiddiq">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LED LAMP LIST</title>
    <!-- Bootstrap CSS -->
    <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet"> 
    <link href="<c:url value='/resources/css/jquery-ui.css' />" rel="stylesheet"> 
    <link href="<c:url value='/resources/css/jqGrid-4.5.4/ui.jqgrid.css' />" rel="stylesheet">
    <script src="<c:url value='/resources/js/jquery-1.10.2.js' />" > </script>
    <script src="<c:url value='/resources/js/jquery-ui.js' />" > </script>
    <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/js/jquery.jqGrid.min.js' />" > </script>
    <script src="<c:url value='/resources/js/grid.locale-en.js' />" > </script>
    <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css" />
    <script src="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js"></script>
    <!-- Add leaflet css and map -->

    <script type="text/javascript">
    //add by sid 2902toaddlogoutsession
    function showLoadingSplash() {
		var dialogEl = jQuery(document.createElement("div"));
		var imageEl = jQuery(document.createElement("img"));
		
		imageEl.attr("src", "<c:url value="/resources/images/loading.gif" />");
		dialogEl.attr("id", "loadingSplash");
		dialogEl.attr("align", "center");
		dialogEl.attr("valign", "center");
		dialogEl.append(imageEl);
		jQuery("body").append(dialogEl);
		
		jQuery("#loadingSplash").dialog({
			height: 415,
			width: 415,
			dialogClass: "loading-dialog",
			modal: true
		});
	}
	
	function hideLoadingSplash() {
		jQuery("#loadingSplash").dialog( "close" );
		jQuery("#loadingSplash").remove();
	}
	
	
    function formSubmit() {
      document.getElementById("logoutForm").submit();
    }
 
	function initAll(){
		  map = new L.Map('map_canvas'); 

          L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    			attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    		}).addTo(map);

      

          var greenIcon = L.icon({
            iconUrl: '<c:url value="/resources/images/LedLemp.png" />',
           
            iconSize:     [35, 40], // size of the icon     
            iconAnchor:   [15, 20] // point of the icon which will correspond to marker's location           
           // popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
        });

        	
    	    var arrayOfLatLngs = [];
  
        
        var url = "getLamp"

        	var ajax = new XMLHttpRequest();
        	ajax.open("GET", url, true);
        	ajax.send(null);
        	ajax.onreadystatechange = function () {

        	     if (ajax.readyState == 4 && (ajax.status == 200)) {
        	    	 //hideLoadingSplash();

        	        console.log("ready")            
        	        var Data = JSON.parse(ajax.responseText);
        	        //console.log(Data);
        	        console.log(Data.length);
        	        var i;
        	        for(i = 0; i < Data.length; i++) {
        	        	 //console.log(Data[i]);
        	        	 console.log(Data[i].lat);
        	        	 console.log(Data[i].lng);
        	        L.marker([Data[i].lat, Data[i].lng], {icon: greenIcon}).bindPopup(Data[i].groupid).addTo(map);
        	   	      arrayOfLatLngs.push([Data[i].lat, Data[i].lng]);
        	            //alert(Data[i])
        	        }
        	        
        	        var bounds = new L.LatLngBounds(arrayOfLatLngs);
        		     map.fitBounds(bounds);
        	        //alert(Data.lat);
        	        //alert(Data.lng);

        	    } else {
        	        console.log("not ready yet");
        	        //showLoadingSplash();
        	        //alert("error");
        	    }
        	}

    $("#LedLamp").jqGrid({
        url:'getLamp',
        mtype : "GET",
        datatype: "json",
        height: 200,
          colNames:['Net','LedID','GroupID', 'Login/Out Time', 'On/Off','Dimming','Voltage','Current','Temperature','Humidity','PM10','Config','remove','lat','lng'],
          colModel:[
            {name:'net',index:'net', width:40,formatter: getnet},
            {name:'ledid',index:'ledid', width:60},
            {name:'groupid',index:'groupid', width:60},
            {name:'logtime',index:'logtime', width:60},
            {name:'status',index:'status', width:60},
            {name:'dimming',index:'dimming', width:60},
            {name:'voltage',index:'voltage', width:60},
            {name:'current',index:'current', width:60},
            {name:'temperature',index:'temperature', width:60,formatter: gettemp},
            {name:'humidity',index:'humidity', width:60},
            {name:'dustconcentration',index:'dustconcentration', width:60},
            {name:'id',index:'id', width:40 ,formatter: getconf },
            {name:'id',index:'id', width:45,formatter: getdel},
            {name:'lat',index:'lat', width:60},
            {name:'lng',index:'lng', width:60},
              
          ],
          multiselect: true,
          pager:'#pager1',
          caption: "LED-Lamp Connection List"
      });
    
    $("#NetList").jqGrid({
        url:'getLamp',
        mtype : "GET",
        datatype: "json",
        height: 200,
          colNames:['Group ID','LedID','IP Address', 'Status'],
          colModel:[
            {name:'groupid',index:'groupid', width:100},
            {name:'ledid',index:'ledid', width:100},
            {name:'server_ip',index:'server_ip', width:100},
            {name:'status',index:'status', width:100},
         
              
          ],
          multiselect: true,
          pager:'#pager2',
          caption: "Network Connection List"
      });
     
    var grid = $("#LedLamp"),
    intervalId = setInterval(function() {
        grid.trigger("reloadGrid",[{current:true}]);
    }, 1000);
    
    var grid = $("#NetList"),
    intervalId = setInterval(function() {
        grid.trigger("reloadGrid",[{current:true}]);
    }, 1000);
     


		
	}
  
 
    
	function submitModal1() {
		//document.getElementById("createFrame").contentWindow.document.getElementById('x')
		document.getElementById("createFrame").contentWindow.submitLampForm();
		console.log("create weather data");
		showLoadingSplash();
		$('#myModal').modal('hide');
		//hideLoadingSplash();
		location.reload();
	
	}
	function submitModal2() {

		document.getElementById("editFrame").contentWindow.submitLampForm();
		console.log("edit weather data");	
		showLoadingSplash();
		$('#myModal2').modal('hide');
		//hideLoadingSplash();
		location.reload();
		
	   
	}

		    function changeFrame(url) {
		    	//alert(url);
		      $('#editFrame').attr('src','editLamp?id='+url);
		      $('#myModal2').modal('show');
		  }
		      
          var getconf = function(cellval,options,rowdata) {
         
            
              formatted_cellval = "<center><img src = '<c:url value='/resources/images/cog_edit.png'/>' onClick='changeFrame("+cellval+")'  ></center>";
          

              return formatted_cellval;

          }

          var getdel = function(cellval,options,rowdata) {
          
            
              formatted_cellval = "<a href='deleteLamp?id="+cellval+"'><center><img src = '<c:url value='/resources/images/remove_list.png' />' ></center></a>";
           

              return formatted_cellval;

          }

          var getnet = function(cellval,options,rowdata) {
           
            
            formatted_cellval = "<center><img src = '<c:url value='/resources/images/ball_onoff_1.png' />' ></center>";
          
              return formatted_cellval;

          }

          var gettemp = function(cellval,options,rowdata) {
           
            formatted_cellval = cellval+"°C";
            

              return formatted_cellval;

          }


        
          $(function() {
        	    $( "#accordion" ).accordion({heightStyle: "content"});
        	  });
          
          
          $("#resizable").resizable({
        	    handles: 'e, w'
        	});
    </script>
   

  
      <style type="text/css">
	  
	     html,
        body {
        height: 100%;
        /* The html and body elements cannot have any padding or margin. */
        }

          /* Wrapper for page content to push down footer */
          #wrap {
            min-height: 100%;
            height: 100%;
            /* Negative indent footer by its height */
            margin: 0 auto -82px 0;
            /* Pad bottom by footer height */
            padding: 0 0 80px 0;
          }

          /* Set the fixed height of the footer here */
          #footer {
            height: 80px;
            background-color: #f5f5f5;
          }


          #wrap > .center-container {
            padding: 70px 0 0 0;
            margin:0;
          }

          #footer > .container {
            padding-top:5px
            padding-left: 15px;
            padding-right: 15px;
          }

          .center-container {
            height:100%;
            display: table;
            width:100%;
            margin:0;
            padding-top: 20px;
          }

          .center-row {
            height:50%;
            width:100%;
            display: table-row;
          }
            
          .center-row > div {
            height:100%;
            /*width:50%; comment by shiddiq 24.02.2015*/
            display: table-cell;
            border:1px solid #eee
          }

     
        .ui-accordion-header.s1 .ui-icon {
        background: url(<c:url value='/resources/images/led_feed.png' />);
        }
        .ui-accordion-header.s2 .ui-icon {
            background: url(<c:url value='/resources/images/led_group.png' />);
        }
        .ui-accordion-header.s3 .ui-icon {
            background: url(<c:url value='/resources/images/led_cog.png' />);
        }


         .myrow-container{
            margin: 20px;
        }

        .box { width: 28px; border: 1px solid #f1c40f; padding: 5px; } 
        .box:hover {
         -moz-box-shadow: 0 0 10px #ccc; 
         -webkit-box-shadow: 0 0 10px #ccc; 
         box-shadow: 0 0 10px #ccc; 
       } 

       #myModal .modal-dialog
      {
        width: 550px;
      }

       #myModal2 .modal-dialog
      {
        width: 550px;
      }
</style>


</head>
<body onload='initAll()';>

<div id="wrap">
  
  <!-- Fixed navbar -->
  <div class="navbar navbar-default navbar-fixed-top">

      <div class="col-sm-1" >
        <img src="<c:url value='/resources/images/Led_Icon.png' />" height="52" width="90" >
      </div>
      <div class="col-sm-4" >
          <h3>LED-LAMP Monitoring System</h3>
      </div>
      <div class="col-sm-5" ></div>
      <div class="col-sm-2" >
           <c:url value="/j_spring_security_logout" var="logoutUrl" />
                          <form action="${logoutUrl}" method="post" id="logoutForm">
                            <input type="hidden" name="${_csrf.parameterName}"
                              value="${_csrf.token}" />
                          </form>
                          <c:if test="${pageContext.request.userPrincipal.name != null}">
                          <h3>
                             ${pageContext.request.userPrincipal.name} | <a
                              href="javascript:formSubmit()"> Logout</a>
                          </h3>
                        </c:if>
      </div>
  

    </div>
 
  
  <!-- Begin page content -->
  <div class="center-container">
    
    <div class="center-row">
    
      <div id="resizable"  class="col-md-6">
			<div id="accordion" >
    
<h3 class="s1"><a href="#">LED - Lamp Connection List</a></h3>

    <div style="opacity: 0.85;">
                <div class="box" align="left"><a  data-toggle="modal" data-target="#myModal"><img   alt="add new lamp" src="<c:url value='/resources/images/edit_add.png' />" ></a></div>
                

          
            
             <table id="LedLamp"></table>
             <div id="pager"></div>
     
        
   
 </div>
      <h3 class="s2"><a href="#">Network TCP/IP Server</a></h3>

    <div style="opacity: 0.85;">
       <table id="NetList"></table>
             <div id="pager2"></div>
    </div>
      <h3 class="s3"><a href="#">Web Net Connection List</a></h3>

    <div style="opacity: 0.85;">
        
      
    </div>
    
  </div>
	  
	  
	  </div>
	  <div class="col-md-6">
	     <div id="map_canvas" style="width:100%; height:100%"></div>
	  
	  
	  </div>
    
    </div>


 
    
  </div>
  
</div>

<div id="footer">
  <div class="container">
    <p>&nbsp;</p>
    <p class="lead"></p>
  </div>
</div>
		
		
	


<!--- add form pop up for create new led lamp 12032016 -->

 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">LED Form</h4>
        </div>
        <div class="modal-body">
          <center>

  			<iframe src="createLamp" id="createFrame" height="500" width="500" style="border:none"></iframe>
   
   		</center>
   		<div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" onclick="submitModal1();" class="btn btn-primary">Save changes</button>
      	</div>

        </div>
      </div>
    </div>
  </div>


   <!-- Modal 2-->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">LED Form</h4>
        </div>
        <div class="modal-body">
          <center>

        <iframe id="editFrame" height="500" width="500" style="border:none"></iframe>
   	
      </center>
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" onclick="submitModal2();" class="btn btn-primary">Save changes</button>
      </div>

        </div>
      </div>
    </div>
  </div>





   




</body>
</html>