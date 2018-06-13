package com.imooc.model;

public class master {
	private int id;
	private String password;
	private String name;
	private String email;
	private String type;

	public master(int id, String password, String name, String email, String type) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.type = type;
	}

	// 保留此不带参数的构造方法
	public master() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		if (name!= null)
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

	public String getType() {
		if (type != null)
			return type;
		else
			return "";
	}

	public void setType(String type) {
		this.type = type;
	}

}
