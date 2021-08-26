package com.duoc.springjpa.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.duoc.springjpa.model.Product;
import com.duoc.springjpa.model.ProductLine;
import com.duoc.springjpa.service.ProductLineService;
import com.duoc.springjpa.service.ProductService;

@Controller
public class WebController {

	//Autowired de los Service
	@Autowired
	private ProductLineService lineService;
	@Autowired
	private ProductService productService;
	//ModelAttribute
	@ModelAttribute("productLine")
	public ProductLine setProductLine() {
		return new ProductLine();
	}
	@ModelAttribute("producto")
	public Product setProduct() {
		return new Product();
	}
	//Metodos get
	@GetMapping("/")
	public String getIndex(@Valid @ModelAttribute("producto") Product producto, BindingResult br, Model model){
		
		model.addAttribute("line",lineService.listar());
		model.addAttribute("productos",productService.listar());
		model.addAttribute("listas",lista_buscador());
		
		return "index";
	}
	@GetMapping("/login")
	public String getLogin() 
	{
		return "login";
	}
	
	@PostMapping("/editar")
	public String getEditarProducto(@Valid @ModelAttribute("producto") Product producto, BindingResult br, Model model) {
		

		if(br.hasErrors()) {
			
			return "index";
		}else {
			
			model.addAttribute("line",lineService.listar());
			model.addAttribute("product",productService.buscarProducto(producto.getProductCode()));
			System.out.println(producto);
			return "editar";
			
		}
		
	}
	
	@PostMapping("/modificar")
	public String postModificarProducto(@Valid @ModelAttribute("producto") Product producto, BindingResult br, Model model) {
		

		if(br.hasErrors()) {
			
			return "editar";
		}else {
			
			productService.actualizar(producto);
			model.addAttribute("line",lineService.listar());
			model.addAttribute("productos",productService.listar());
			model.addAttribute("listas",lista_buscador());
			System.out.println(producto);
			return "index";
			
		}
		
	}
	
	//Metodos post
	@GetMapping("/buscar")
	public String postBuscarProducto(@Valid @ModelAttribute("producto") Product producto, BindingResult br, @RequestParam String selector,Model model) {
		

		if(br.hasErrors()) {
			
			return "editar";
		}else {
			
			List<Product> lista = null;
			if(selector.equals("Name")) {
				lista = productService.buscarNombre(producto.getSearch());
			}else if(selector.equals("Code")) {
				lista=productService.buscarCode(producto.getSearch());
			}else if(selector.equals("Vendor")) {
				lista=productService.buscarVendor(producto.getSearch());
			}else if(selector.equals("Line")) {
				lista=productService.buscarLine(producto.getSearch());
			}
			
			model.addAttribute("line",lineService.listar());
			model.addAttribute("productos",lista);
			model.addAttribute("listas",lista_buscador());
			
			System.out.println(producto);
			return "index";
			
		}
		
	}
	
	
	//Lista de Arraylist para buscador
	ArrayList<String> lista_buscador() {
		ArrayList<String> listas = new ArrayList<>();
		listas.add("Name");
		listas.add("Vendor");
		listas.add("Code");
		listas.add("Line");
 
		return listas;

	}
	
}
