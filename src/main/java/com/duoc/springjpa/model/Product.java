package com.duoc.springjpa.model;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the products database table.
 * 
 */
@Entity
@Table(name="products")
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="product_code", unique=true, nullable=false, length=15)
	private String productCode;

	@Column(nullable=false, precision=10, scale=2)
	private BigDecimal buyPrice;

	@Column(name="MSRP", nullable=false, precision=10, scale=2)
	private BigDecimal msrp;

	@Lob
	@Column(nullable=false)
	private String productDescription;

	@Column(nullable=false, length=70)
	private String productName;

	@Column(nullable=false, length=10)
	private String productScale;

	@Column(nullable=false, length=50)
	private String productVendor;

	@Column(nullable=false)
	private short quantityInStock;

	//Pivote para poder agregar el filtro al buscar
	
	@Transient
	private String search;
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
	//bi-directional many-to-one association to Orderdetail
	@OneToMany(mappedBy="product")
	@JsonBackReference
	private List<Orderdetail> orderdetails;

	//bi-directional many-to-one association to ProductLine
	@ManyToOne
	@JsonManagedReference
	@JoinColumn(name="product_line", nullable=false)
	private ProductLine productLineBean;

	public Product() {
	}

	public String getProductCode() {
		return this.productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public BigDecimal getBuyPrice() {
		return this.buyPrice;
	}

	public void setBuyPrice(BigDecimal buyPrice) {
		this.buyPrice = buyPrice;
	}

	public BigDecimal getMsrp() {
		return this.msrp;
	}

	public void setMsrp(BigDecimal msrp) {
		this.msrp = msrp;
	}

	public String getProductDescription() {
		return this.productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductScale() {
		return this.productScale;
	}

	public void setProductScale(String productScale) {
		this.productScale = productScale;
	}

	public String getProductVendor() {
		return this.productVendor;
	}

	public void setProductVendor(String productVendor) {
		this.productVendor = productVendor;
	}

	public short getQuantityInStock() {
		return this.quantityInStock;
	}

	public void setQuantityInStock(short quantityInStock) {
		this.quantityInStock = quantityInStock;
	}

	public List<Orderdetail> getOrderdetails() {
		return this.orderdetails;
	}

	public void setOrderdetails(List<Orderdetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public Orderdetail addOrderdetail(Orderdetail orderdetail) {
		getOrderdetails().add(orderdetail);
		orderdetail.setProduct(this);

		return orderdetail;
	}

	public Orderdetail removeOrderdetail(Orderdetail orderdetail) {
		getOrderdetails().remove(orderdetail);
		orderdetail.setProduct(null);

		return orderdetail;
	}

	public ProductLine getProductLineBean() {
		return this.productLineBean;
	}

	public void setProductLineBean(ProductLine productLineBean) {
		this.productLineBean = productLineBean;
	}

}