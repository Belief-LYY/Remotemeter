package com.imooc.model;

public class type {

	private int typen;
	private String type;

	// �����˲��������Ĺ��췽��
	public type() {

	}

	@Override
	public String toString() {
		return "type [typen=" + typen + ", type=" + type + "]";
	}

	public type(int typen, String type) {
		super();
		this.typen = typen;
		this.type = type;
	}

	public int getTypen() {
		return typen;
	}

	public void setTypen(int typen) {
		this.typen = typen;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
