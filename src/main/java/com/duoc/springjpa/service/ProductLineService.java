package com.duoc.springjpa.service;

import java.util.List;

import com.duoc.springjpa.model.ProductLine;

public interface ProductLineService {
	
	List<ProductLine> listar();	
	ProductLine buscarProductoLine (String productLine);
	void agregar(ProductLine prodLine);
	void actualizar(ProductLine prodLine);

}
