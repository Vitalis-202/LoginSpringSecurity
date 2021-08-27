package com.duoc.springjpa.model;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;

import java.util.List;


/**
 * The persistent class for the product_lines database table.
 * 
 */
@Entity
@Table(name="product_lines")
@NamedQuery(name="ProductLine.findAll", query="SELECT p FROM ProductLine p")
public class ProductLine implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="product_line", unique=true, nullable=false, length=50)
	private String productLine;

	@Lob
	private String htmlDescription;

	@Lob
	private byte[] image;

	@Column(length=4000)
	private String textDescription;

	//bi-directional many-to-one association to Product
	@OneToMany(mappedBy="productLineBean")
	@JsonBackReference
	private List<Product> products;

	public ProductLine() {
	}

	public String getProductLine() {
		return this.productLine;
	}

	public void setProductLine(String productLine) {
		this.productLine = productLine;
	}

	public String getHtmlDescription() {
		return this.htmlDescription;
	}

	public void setHtmlDescription(String htmlDescription) {
		this.htmlDescription = htmlDescription;
	}

	public byte[] getImage() {
		return this.image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getTextDescription() {
		return this.textDescription;
	}

	public void setTextDescription(String textDescription) {
		this.textDescription = textDescription;
	}

	public List<Product> getProducts() {
		return this.products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Product addProduct(Product product) {
		getProducts().add(product);
		product.setProductLineBean(this);

		return product;
	}

	public Product removeProduct(Product product) {
		getProducts().remove(product);
		product.setProductLineBean(null);

		return product;
	}

}