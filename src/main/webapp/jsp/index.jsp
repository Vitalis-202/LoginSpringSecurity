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
                  <form action="/logout" method="post">
    				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" >
    				<a class="nav-link" href="/logout">Cerrar Sesion</a>
    				</form>
                </li>
    
              </ul>
            </div>
          </div>
        </nav>
    
      </header>
    <!--/HEADER-->
    <!-- SECTION BUSQUEDA -->
    <section>
    
     <form:form action="/buscar" method="get" modelAttribute="producto">
      <div class="container mt-4 border border-secondary">
        <!-- Busqueda-->
        
        <div class="form-row justify-content-center align-items-center mt-2">
        	<h5>BUSCADOR</h5>
        </div>
        
        <div class="form-row mt-2">
        	<div class="form-group col">
            	<form:label path="" class="form-group pl-5">Indique filtro busqueda</form:label>
            </div>
            <div class="form-group col">
            	<form:select
					path=""
					name="selector"
					class="form-control"> 							
					<form:options items="${ listas }"></form:options>						
				</form:select>
			</div>
			<div class="form-group col">
            	<form:input path="search" class="form-control"/>
          </div>
        </div>
        <!-- Botones-->
        <div class="form-row mb-4">
			<div class="col-md-3 offset-md-3">
				<form:button class="btn btn-secondary btn-block">BUSCAR</form:button>
			</div>
			<div class="col-md-3">
				<a class="btn btn-secondary btn-block" href="/" role="button">RESTABLECER</a>
			</div>
          
        </div>

      </div>
      </form:form>
    </section>
    
    <!-- /SECTION BUSQUEDA -->
    <!-- MAIN LISTAR -->
    <div class="container">
    <form:form action="/editar" method="post" modelAttribute="producto" >
      <table class="table">
        <thead class="thead-light">
          <tr>
            <th scope="col">productCode</th>
            <th scope="col">productName</th>
            <th scope="col">productDescription</th>
            <th scope="col">productScale</th>
            <th scope="col">productLine</th>
            <th scope="col">productVendor</th>
            <th scope="col">quantityInStock</th>
            <th scope="col">buyPrice</th>
            <th scope="col">MSRP</th>
          </tr>
        </thead>
        <tbody>
        
        <c:forEach items="${productos }" var="pro">
        
        	<tr>
	            <th scope="row">
	            	<c:out value="${pro.productCode }"></c:out>
	            </th>
	            <td>
	            	<c:out value="${pro.productName }"></c:out>
	            </td>
	            <td>
	            	<c:out value="${pro.productDescription }"></c:out>
	            </td>
	            <td>
	            	<c:out value="${pro.productScale }"></c:out>
	            </td>
	            <td>
	            	<c:out value="${pro.productLineBean.productLine }"></c:out>
	            </td>
	            <td>
	            	<c:out value="${pro.productVendor }"></c:out>
	            </td>
	            <td>
	            	<c:out value="${pro.quantityInStock }"></c:out>
	            </td>
	            <td>
	            	<c:out value="${pro.buyPrice }"></c:out>
	            </td>
	            <td>
	            	<c:out value="${pro.msrp }"></c:out>
	            </td>
	            <td class="align-center">
	            	<form:radiobutton path="productCode"
	            	value="${pro.productCode }"/>
	            </td>
          </tr>
        </c:forEach>
          
          
        </tbody>
      </table>
      <!-- Botones -->
      <div class="container">
      	<div class="form-row">
      		
      		<div class="col-md-3 offset-md-2">
				<form:button class="btn btn-secondary btn-block">MODIFICAR</form:button>
			</div>
			<div class="col-md-3">
				<a class="btn btn-secondary btn-block" href="/" role="button">AGREGAR</a>
			</div>
      		
      		<div class="col-md-3">
				<a class="btn btn-secondary btn-block" href="/" role="button">ELIMINAR</a>
			</div>
      	
      	
      	</div>
      
      </div>
      
    </form:form>
      
    </div>
   
    <!-- /MAIN LISTAR -->
    <!-- CERRAR SESION -->
    <div class="col-md-4 offset-md-4 mt-4 mb-4">
    <form action="/logout" method="post">
    	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" >
    	<button class="btn btn-secondary btn-block">Cerrar Sesion</button>
    </form>
    </div>
    <!-- /CERRAR SESION -->
    

</body>
</html>