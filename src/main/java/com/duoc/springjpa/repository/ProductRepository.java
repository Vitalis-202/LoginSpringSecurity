package com.duoc.springjpa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.duoc.springjpa.model.Product;

public interface ProductRepository extends JpaRepository<Product, String> {
	
	List<Product> findAllByOrderByProductNameAsc();
	
	List<Product> findAllByProductNameContains(String name);
	
	List<Product> findAllByProductCodeContains(String code);
	
	List<Product> findAllByProductVendorContains(String vendor);
	
	List<Product> findAllByProductLineBeanProductLineContains(String line);
	
	Product findOneByProductCode(String code);
	
	@Query("SELECT DISTINCT productVendor FROM Product")
	List<String> findDistinctProductVendor();

}
