package com.duoc.springjpa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.duoc.springjpa.model.Product;
import com.duoc.springjpa.model.ProductLine;
import com.duoc.springjpa.service.ProductLineService;
import com.duoc.springjpa.service.ProductService;

@RestController
@RequestMapping("/api")
public class ApiRestController {
	
	@Autowired
	private ProductService serviceP;
	
	@Autowired
	private ProductLineService servicePL;
	
	@GetMapping("/products")
	public List<Product> products(){
		return serviceP.listar();
	}
	
	@GetMapping("/productlines")
	public List<ProductLine> productLines(){
		return servicePL.listar();
	}
	
	@GetMapping("/products/{codigo}")
	public Product buscarProduct(@PathVariable String codigo) {
		return serviceP.buscarProducto(codigo);
	}
	
	@GetMapping("/productlines/{codigo}")
	public ProductLine buscarProductLines(@PathVariable String codigo) {
		return servicePL.buscarProductoLine(codigo);
	}

}
