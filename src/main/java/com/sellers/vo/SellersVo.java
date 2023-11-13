package com.sellers.vo;
  
public class SellersVo {
	String product_id; 
	String item_name; 
	int quantity;
	int commission; 
	String seller_id;
	
	public SellersVo() {}
	
	public SellersVo(String product_id, String item_name, int quantity, int commission, String seller_id) {
		this.product_id = product_id;
		this.item_name = item_name;
		this.quantity = quantity;
		this.commission = commission;
		this.seller_id = seller_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getCommission() {
		return commission;
	}

	public void setCommission(int commission) {
		this.commission = commission;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	@Override
	public String toString() {
		return "SellersVo [product_id=" + product_id + ", item_name=" + item_name + ", quantity=" + quantity
				+ ", commission=" + commission + ", seller_id=" + seller_id + "]";
	}
}



