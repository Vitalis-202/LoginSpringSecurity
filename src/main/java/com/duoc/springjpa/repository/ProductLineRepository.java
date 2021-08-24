package com.duoc.springjpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.duoc.springjpa.model.ProductLine;

public interface ProductLineRepository extends JpaRepository<ProductLine, String> {

	ProductLine findOneByProductLine (String line_name);
	
}
