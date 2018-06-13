package com.imooc.model;

public class standard {
	private String type;
	private float threshold;
	private float price;

	// 保留此不带参数的构造方法
	public standard() {

	}

	@Override
	public String toString() {
		return "standard [type=" + type + ", threshold=" + threshold + ", price=" + price + "]";
	}

	public standard(String type, float threshold, float price) {
		super();
		this.type = type;
		this.threshold = threshold;
		this.price = price;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public float getThreshold() {
		return threshold;
	}

	public void setThreshold(float threshold) {
		this.threshold = threshold;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}
