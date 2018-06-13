package com.imooc.model;

public class company {
	private int id;
	private String type;
	private String company;
	private String address;
	private String phone;
	private String email;
	private String bankcard;
	private String name;
	private String idcard;
	private String password;

	// 保留此不带参数的构造方法
	public company() {

	}

	public company(int id, String type, String company, String address, String phone, String email, String bankcard,
			String name, String idcard, String password) {
		super();
		this.id = id;
		this.type = type;
		this.company = company;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.bankcard = bankcard;
		this.name = name;
		this.idcard = idcard;
		this.password = password;
	}

	@Override
	public String toString() {
		return "company [id=" + id + ", type=" + type + ", company=" + company + ", address=" + address + ", phone="
				+ phone + ", email=" + email + ", bankcard=" + bankcard + ", name=" + name + ", idcard=" + idcard
				+ ", password=" + password + "]";
	}

	@Override
	public boolean equals(Object arg0) {
		// TODO Auto-generated method stub
		return super.equals(arg0);
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}

	// get/set方法

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

	public String getCompany() {
		if (company != null)
			return company;
		else
			return "";
	}

	public void setCompany(String company) {
		this.company = company;
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

	public String getBankcard() {
		if (bankcard != null)
			return bankcard;
		else
			return "";
	}

	public void setBankcard(String bankcard) {
		this.bankcard = bankcard;
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
		if (password != null)
			return password;
		else
			return "";
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
