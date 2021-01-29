package com.mytea.dto;

public class MenuDto {

	private String menu_fileFullPath;
	private String menu_fileName;
	private String category;
	private String name;
	private int price;
	private String content;
	
	public String getMenu_fileFullPath() {
		return menu_fileFullPath;
	}
	public void setMenu_fileFullPath(String menu_fileFullPath) {
		this.menu_fileFullPath = menu_fileFullPath;
	}
	public String getMenu_fileName() {
		return menu_fileName;
	}
	public void setMenu_fileName(String menu_fileName) {
		this.menu_fileName = menu_fileName;
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
