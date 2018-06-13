package com.imooc.model;

public class user {
	private int id;
	private String type;
	private String name;
	private String email;

	// 保留此不带参数的构造方法
	public user() {

	}

	@Override
	public String toString() {
		return "user [id=" + id + ", type=" + type + ", name=" + name + ", email=" + email + "]";
	}

	public user(int id, String type, String name, String email) {
		super();
		this.id = id;
		this.type = type;
		this.name = name;
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		if (name != null)
			return name;
		else
			return "";
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
