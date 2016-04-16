<%--
  User: Shiddiq
  Date: 17.03.2016
  Time: 00:01 AM
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Hardware as a Client</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
  		var myip;
	</script>
	<script type="text/javascript" src="https://www.l2.io/ip.js?var=myip"></script>
    <script>
    function init() {
    	var id = "${lampObject.id}";
    	 	if(id!=""){
    	 	document.getElementById("lampcontrol").value="0b1";
    	 	var hexid = parseInt("${lampObject.id}");
    	 	hexid=hexid.toString(16);
    	 		document.getElementById("id").value=hexid;
    		var tc = parseInt("${lampObject.temperature}");
    		var inttc = ( tc + 30 ) * 255/80;
    		inttc=inttc.toString(16);
    			document.getElementById("temperature").value=inttc;
    		var hum = parseInt("${lampObject.humidity}");       	
        	hum=hum.toString(16);
        			document.getElementById("humidity").value=hum;
    	 	}
    }
    
    function updateData(){
    	var ledtype = document.getElementById("ledtype").value;  	
    	var dc =  document.getElementById("dustconcentration").value;
    	var lc = document.getElementById("lampcontrol").value;
		    	//alert (dc);
		    	//alert (lc);
				if (dc==""||dc==null){
					document.getElementById("dustconcentration").value="0";	
				}
				if (lc==""||lc==null){
					document.getElementById("lampcontrol").value="0";	
				}
				if (ledtype==""||ledtype==null){
		    		document.getElementById("ledtype").value="0";
		    	}
	    	document.getElementById("id").value="${lampObject.id}";
	    	document.getElementById("temperature").value="${lampObject.temperature}";
	    	document.getElementById("humidity").value="${lampObject.humidity}";
	    	document.getElementById("ledid").value="${lampObject.ledid}";
	    	document.getElementById("groupid").value="${lampObject.groupid}";
	    	document.getElementById("dimming").value="${lampObject.dimming}";
	    	alert(myip);
	    	document.getElementById("server_ip").value=myip;
	    	document.getElementById("server_port").value="${lampObject.server_port}";
	    	document.getElementById("lat").value="${lampObject.lat}";
	    	document.getElementById("lng").value="${lampObject.lng}";
	    	var vc = document.getElementById("voltage").value;
	    	var cc = document.getElementById("current").value;
	    	if ((vc !="" ||vc!=null ) && (cc !="" ||cc!=null)){ 
		    	document.getElementById("voltage").value = parseInt(document.getElementById("voltage").value, 16);
		    	document.getElementById("current").value = parseInt(document.getElementById("current").value, 16);  
	    	}else {
	    		document.getElementById("voltage").value = parseInt("0");
		    	document.getElementById("current").value = parseInt("0");    		
	    	}
    	
    	alert("voltage = "+document.getElementById("voltage").value);
    	alert("current = "+document.getElementById("current").value);


    	 document.getElementById('hardwareclientForm').submit();
    	
    }
    
    function Redirect (){
    	var id = document.getElementById("id").value;
    	var url= "editHardwareclient?id=";
    	alert(url+id);
    	window.location= url+id;
    	
    }
    
  
	//alert('<c:out value="${lampObject.ledid}"/>')


 
 
    </script>
</head>
<body onload="init()">
<br>
<div class="container">
   
          <form id="hardwareclientForm" class="form-horizontal" action="saveLampHardware" method="post">
    
                    <div class="form-group">
                    <div class="control-label col-xs-3"> <label for="id">ID</label></div>
                        <div class="col-xs-3">
                            <input id="id" name="id" class="form-control" type="text" />
                        </div>
                        <div class="col-xs-3">   
                            <img src = '/SpringLedapp/resources/images/ledfind.png' onClick='Redirect()'  >                         
                        </div>
                    </div>
    
                    <div class="form-group">
                        <label for="ledtype" class="control-label col-xs-3">Type</label>
                        <div class="col-xs-6">
                            <input id="ledtype" name="ledtype" class="form-control" type="text" />
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="control-label col-xs-3"><label for="lampcontrol">LED</label></div>
                        <div class="col-xs-6">
                            <input id="lampcontrol" name="lampcontrol" class="form-control" type="text" />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="control-label col-xs-3"><label for="dustconcentration">Dust Concentration</label></div>
                        <div class="col-xs-6">
                            <input id="dustconcentration" name="dustconcentration" class="form-control" type="text" />
                        </div>
                    </div>
                    
                       <div class="form-group">
                        <div class="control-label col-xs-3"><label for="temperature">temperature</label></div>
                        <div class="col-xs-6">
                            <input id="temperature" name="temperature" class="form-control" type="text" />  
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-xs-3"><label for="humidity">humidity</label></div>
                        <div class="col-xs-6">
                            <input id="humidity" name="humidity" class="form-control" type="text" "/>
                        </div>
                    </div>
                    

                    <div class="form-group">
                        <div class="control-label col-xs-3"><label for="voltage">Voltage</label></div>
                        <div class="col-xs-6">
                            <input id="voltage" name="voltage" class="form-control" type="text" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-xs-3"><label for="current">Current</label></div>
                        <div class="col-xs-6">
                            <input id="current" name="current" class="form-control" type="text" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-4">

                            </div>
                            <div class="col-xs-4">
                				
                				<input type="hidden" id="ledid" name="ledid" />
                				<input type="hidden" id="groupid" name="groupid" />
                				<input type="hidden" id="dimming" name="dimming" />
                				<input type="hidden" id="server_ip" name="server_ip" />
                				<input type="hidden" id="server_port" name="server_port" />
                				<input type="hidden" id="lat" name="lat" />
                				<input type="hidden" id="lng" name="lng" />  
                				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />              		
                                <input type="button" class="btn btn-success" onclick="updateData()" value="Submit form">
                               
                            </div>
                            <div class="col-xs-4">
                            </div>
                        </div>
                    </div>
   
                <div>
     
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	

</body>
</body>
</html>