<%--
  User: Shiddiq
  Date: 08.02.2016
  Time: 06:01 AM
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="shiddiq">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LED Monitoring</title>
    <!-- Bootstrap CSS -->
    <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  
      <script type="text/javascript">
       var myvar="shiddiq";
       </script>

</head>
<body class=".container-fluid">
    <div class="container">
   
                <form:form id="lampRegisterForm" cssClass="form-horizontal" modelAttribute="lamp" method="post" action="saveLamp">
    
                    <div class="form-group">
                    <div class="control-label col-xs-3"> <form:label path="ledid" >LED ID</form:label></div>
                        <div class="col-xs-6">
                            <form:hidden path="id" value="${lampObject.id}"/>
                            <form:input cssClass="form-control" path="ledid" value="${lampObject.ledid}"/>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <form:label path="groupid" cssClass="control-label col-xs-3">Group ID</form:label>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="groupid" value="${lampObject.groupid}"/>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="dimming">Dimming</form:label></div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="dimming" value="${lampObject.dimming}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="voltage">Voltage</form:label></div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="voltage" value="${lampObject.voltage}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="current">Current</form:label></div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="current" value="${lampObject.current}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="server_ip">Server Ip</form:label></div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="server_ip" value="${lampObject.server_ip}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="server_port">Server Port</form:label></div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="server_port" value="${lampObject.server_port}"/>
                        </div>
                    </div>

                     <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="lat">Latitude</form:label></div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="lat" value="${lampObject.lat}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="lng">Langitude</form:label></div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="lng" value="${lampObject.lng}"/>
                        </div>
                    </div>
                    <!--
                     <div class="form-group">
                        <div class="control-label col-xs-3"><form:label path="">PM 10 </form:label></div>
                        <div class="col-xs-6">
                            <form:input cssClass="form-control" path="" value=""/>
                        </div>
                    </div>
                    -->

                    <!-- Add by Sid to Add Temperature-->                                 
                            <form:hidden cssClass="form-control" path="temperature" value="${lampObject.temperature}"/>                   
                     <!-- Add by Sid to Add Temperature-->
                      <!-- Add by Sid to Add Humidity-->      
                            <form:hidden cssClass="form-control" path="humidity" value="${lampObject.humidity}"/>
                     <!-- Add by Sid to Add Humidity-->
                     
                    
    <!--  
                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-4">

                            </div>
                            <div class="col-xs-4">
                
                                <input type="button" class="btn btn-success" onclick="submitLampForm()" value="Submit form">
                               
                            </div>
                            <div class="col-xs-4">
                            </div>
                        </div>
                    </div>
    -->
                </form:form>
     
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	   <script type="text/javascript">
    


                  //end by sid 26.02.2016
        function submitLampForm() {    
           
        
            
            // getting the employee form values
            var lat = $('#lat').val();
            var lng = $('#lng').val();
            var gi  = $('#groupid').val();
            var li  = $('#ledid').val();
           
            if(lat.length ==0) {
                alert('Please enter latitude value');
                $('#lat').focus();
                //return false;
            }

            if(lng.length ==0) {
                alert('Please enter langitude value');
                $('#lng').focus();
                //return false;
            }
            
            if(isNaN(gi)){
            	 alert('Please enter number value on group id');
            	 $('#groupid').focus();
            }
            
            if(isNaN(li)){
	           	 alert('Please enter number value on led id');
	           	 $('#ledid').focus();
           }

            if (lat!=null && lng!=null && !isNaN(gi) && !isNaN(li) ){
  
                    document.getElementById('lampRegisterForm').submit();
   
                          }
                      }

        
     
    </script>
	

</body>
</html>