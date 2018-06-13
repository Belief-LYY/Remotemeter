package com.imooc.model;

public class personal {
	private int id;
	private String type;
	private String name;
	private String sex;
	private String phone;
	private String email;
	private String address;
	private String bankcard;
	private String idcard;
	private String password;

	// 保留此不带参数的构造方法
	public personal() {

	}

	public personal(int id, String type, String name, String sex, String phone, String email, String address,
			String bankcard, String idcard, String password) {
		super();
		this.id = id;
		this.type = type;
		this.name = name;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.bankcard = bankcard;
		this.idcard = idcard;
		this.password = password;
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}

	@Override
	public String toString() {
		return "personal [id=" + id + ", type=" + type + ", name=" + name + ", sex=" + sex + ", phone=" + phone
				+ ", email=" + email + ", address=" + address + ", bankcard=" + bankcard + ", idcard=" + idcard
				+ ", password=" + password + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getName() {
		if (name != null)
			return name;
		else
			return "";
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		if (sex != null)
			return sex;
		else
			return "";
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		if (phone != null)
			return phone;
		else
			return "";
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		if (email != null)
			return email;
		else
			return "";
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		if (address != null)
			return address;
		else
			return "";
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBankcard() {
		if (bankcard != null)
			return bankcard;
		else
			return "";
	}

	public void setBankcard(String bankcard) {
		this.bankcard = bankcard;
	}

	public String getIdcard() {
		if (idcard != null)
			return idcard;
		else
			return "";
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
