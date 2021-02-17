package com.mytea.dto;

public class CartDto {
	private String id;
	private String names;
	private int perprice;
	private int amount;
	private int totalprice;
	
	
	public CartDto(String id, String names, int perprice, int amount, int totalprice) {
		this.id = id;
		this.names = names;
		this.perprice = perprice;
		this.amount = amount;
		this.totalprice = totalprice;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getNames() {
		return names;
	}


	public void setNames(String names) {
		this.names = names;
	}


	public int getPerprice() {
		return perprice;
	}


	public void setPerprice(int perprice) {
		this.perprice = perprice;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public int getTotalprice() {
		return totalprice;
	}


	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}


}

