package com.imooc.model;

import java.util.Date;

public class history {
	private int id;
	private Date time;
	private String type;
	private float price;

	// 保留此不带参数的构造方法
	public history() {

	}

	@Override
	public String toString() {
		return "history [id=" + id + ", time=" + time + ", type=" + type + ", price=" + price + "]";
	}

	public history(int id, Date time, String type, float price) {
		super();
		this.id = id;
		this.time = time;
		this.type = type;
		this.price = price;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}
