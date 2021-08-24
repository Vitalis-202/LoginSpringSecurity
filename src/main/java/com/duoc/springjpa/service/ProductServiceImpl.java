package com.duoc.springjpa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duoc.springjpa.model.Product;
import com.duoc.springjpa.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductRepository repo;
	
	@Override
	public List<Product> listar() {
		// TODO Auto-generated method stub
		return repo.findAllByOrderByProductNameAsc();
	}

	@Override
	public List<Product> buscarNombre(String name) {
		// TODO Auto-generated method stub
		return repo.findAllByProductNameContains(name);
	}

	@Override
	public List<Product> buscarVendor(String vendor) {
		// TODO Auto-generated method stub
		return repo.findAllByProductVendorContains(vendor);
	}

	@Override
	public List<Product> buscarCode(String code) {
		// TODO Auto-generated method stub
		return repo.findAllByProductCodeContains(code);
	}

	@Override
	public List<Product> buscarLine(String line) {
		// TODO Auto-generated method stub
		return repo.findAllByProductLineBeanProductLineContains(line);
	}

	@Override
	public Product buscarProducto(String code) {
		// TODO Auto-generated method stub
		return repo.findById(code).get();
	}

	@Override
	public List<String> listarVendor() {
		// TODO Auto-generated method stub
		return repo.findDistinctProductVendor();
	}

	@Override
	public void actualizar(Product producto) {
		// TODO Auto-generated method stub
		repo.save(producto);
		
	}

	@Override
	public void agregar(Product producto) {
		// TODO Auto-generated method stub
		repo.save(producto);
	}

}
