package com.duoc.springjpa.service;

import java.util.List;

import com.duoc.springjpa.model.Product;

public interface ProductService {
	
	List<Product> listar();	
	List<Product> buscarNombre(String name);
	List<Product> buscarVendor(String vendor);
	List<Product> buscarCode(String code);
	List<Product> buscarLine(String line);
	Product buscarProducto (String code);
	List<String> listarVendor();
	void actualizar(Product producto);
	void agregar(Product producto);
}
