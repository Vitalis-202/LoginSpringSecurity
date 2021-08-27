<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- CSS personalizado-->
<link href="css/estilos.css" rel="stylesheet">
<!-- Título página-->
<title>SpringBoot JPA</title>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
crossorigin="anonymous"></script>
<!-- Javascript personalizados para cargar -->
<script src=""></script>
</head>
<body>

<!-- HEADER -->
    <header class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
          <div class="container">
    
            <a class="navbar-brand" href="#">
              <img src="assets/springlogo.png" alt="Logo">
              SpringBoot JPA
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
    
            <div class="collapse navbar-collapse" id="navBar">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                  <a class="nav-link" href="#main">Nav1</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#speakers">Nav2</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#place-time">Nav3</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#conviertete-en-orador">Nav4</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-platzi" href="#" data-toggle="modal" data-target="#modalCompra">Nav5</a>
                </li>
    
              </ul>
            </div>
          </div>
        </nav>
    
      </header>
    <!--/HEADER-->
    <!-- MAIN FORM -->
	  <main>
	  	<div class="container mt-4  border border-dark rounded">
	  		<div class="form-row mb-2">
	  		
	  			<div class="col-md-6 offset-md-3 text-center">
	  				<h4>FORMULARIO MODIFICACI�N</h4>
	  			</div>
	  		
	  		</div>
	  	
	  	
	  	<form:form method="post" action="/modificar	" modelAttribute="producto">
	    <div class="form-row">
	    
	      <div class="form-group col-md-6">
	        <form:label path="productCode">productCode</form:label>
	        <form:input path="productCode" class="form-control" type="text" value="${ product.productCode}"/>
	        <form:errors path="productCode"/>
	      </div>
	      
	      <div class="form-group col-md-6">
	       	<form:label path="productCode">productDescription</form:label>
	       	<form:input path="productName" type="text" class="form-control" value="${ product.productName}"/>
	      	<form:errors path="productName"/>
	      </div>
	     
	     </div>
	     
	     <div class="form-row">
	     	
	     	  <div class="form-group col-md-4">
		        <form:label path="productDescription">productDescription</form:label>
		        <form:input path="productDescription" type="text" class="form-control" value="${ product.productDescription}"/>
		        <form:errors path="productDescription"/>
		      </div>
	     
	     
		      <div class="form-group col-md-4">
		        <form:label path="productScale">productScale</form:label>
		        <form:input path="productScale" type="text" class="form-control" value="${ product.productScale}"/>
		        <form:errors path="productScale"/>
		      </div>
		      
		      <div class="form-group col-md-4 align-center">
		        <form:label path="productLineBean">productLine</form:label>
		        <form:select path="productLineBean"
						items="${line }"
						itemLabel="productLine"
						itemValue="productLine"
						class="form-control"
						
					/>
		        
		      </div>
		      
	     </div>
	     
	     <div class="form-row">
	    
	      <div class="form-group col-md-6">
	        <form:label path="productVendor">productVendor</form:label>
	        <form:input path="productVendor" class="form-control" type="text" value="${ product.productVendor}"/>
	        <form:errors path="productVendor"/>
	      </div>
	      
	      <div class="form-group col-md-6">
	       	<form:label path="quantityInStock">quantityInStock</form:label>
	       	<form:input path="quantityInStock" type="text" class="form-control" value="${ product.quantityInStock}"/>
	      	<form:errors path="quantityInStock"/>
	      </div>
	     
	     </div>
	     
	     <div class="form-row">
	    
	      <div class="form-group col-md-6">
	        <form:label path="buyPrice">buyPrice</form:label>
	        <form:input path="buyPrice" class="form-control" type="text" value="${ product.buyPrice}"/>
	        <form:errors path="buyPrice"/>
	      </div>
	      
	      <div class="form-group col-md-6">
	       	<form:label path="msrp">MSRP</form:label>
	       	<form:input path="msrp" type="text" class="form-control" value="${ product.msrp}"/>
	      	<form:errors path="msrp"/>
	      </div>
	     
	     </div>
	      
	      <div class="form-row">
	      	<div class="col offset-1">
	      		<form:button class="btn btn-secondary">MODIFICAR</form:button>
	      	</div>
	      	<div class="col">
	      		<form:button class="btn btn-secondary">ELIMINAR</form:button>
	      	</div>
	      	
	      	<div class="col">
	      		<form:button class="btn btn-secondary" href="/">VOLVER</form:button>
	      	</div>
	      
	      </div>
	      
	    
	
	    
	  </form:form>
	  	
	  	</div>
	  </main>
  

      <!-- /MAIN FORM -->
    

</body>
</html>