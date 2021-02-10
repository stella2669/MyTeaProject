package com.mytea.dto;

public class ProductDto {

	private String fileFullPath;
	private String fileName;
	private String category;
	private String name;
	private int price;
	private String content;
	
	public ProductDto(String fileFullPath, String fileName, String category, String name, int price, String content) {
		this.fileFullPath = fileFullPath;
		this.fileName = fileName;
		this.category = category;
		this.name = name;
		this.price = price;
		this.content = content;
	}
	
	public ProductDto(String category, String name, int price, String content) {
		this.category = category;
		this.name = name;
		this.price = price;
		this.content = content;
	}

	public String getFileFullPath() {
		return fileFullPath;
	}

	public void setFileFullPath(String fileFullPath) {
		this.fileFullPath = fileFullPath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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

	public String toString() {
		return "옵션 명 : " + this.fileName + "\n";
	}
}
