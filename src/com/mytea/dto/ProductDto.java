package com.mytea.dto;

public class ProductDto {

	private String product_fileFullPath;
	private String product_fileName;
	private String category;
	private String name;
	private int price;
	private String content;
	
	public ProductDto(String product_fileFullPath, String product_fileName, String category, String name, int price, String content) {
		this.product_fileFullPath = product_fileFullPath;
		this.product_fileName = product_fileName;
		this.category = category;
		this.name = name;
		this.price = price;
		this.content = content;
	}
	
	public String getProduct_fileFullPath() {
		return product_fileFullPath;
	}
	public void setProduct_fileFullPath(String product_fileFullPath) {
		this.product_fileFullPath = product_fileFullPath;
	}
	public String getProduct_fileName() {
		return product_fileName;
	}
	public void setProduct_fileName(String product_fileName) {
		this.product_fileName = product_fileName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
