package com.duoc.springjpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duoc.springjpa.model.ProductLine;
import com.duoc.springjpa.repository.ProductLineRepository;

@Service
public class ProductLineServiceImpl implements ProductLineService {

	@Autowired
	private ProductLineRepository repo;
	
	@Override
	public List<ProductLine> listar() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}

	@Override
	public ProductLine buscarProductoLine(String productLine) {
		// TODO Auto-generated method stub
		return repo.findOneByProductLine(productLine);
	}

	@Override
	public void agregar(ProductLine prodLine) {
		// TODO Auto-generated method stub
		repo.save(prodLine);
	}

	@Override
	public void actualizar(ProductLine prodLine) {
		// TODO Auto-generated method stub
		repo.save(prodLine);
	}

}
