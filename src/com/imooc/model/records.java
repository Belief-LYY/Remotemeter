package com.imooc.model;

import java.util.Date;

public class records {
	private int record_p;
	private String meter_id;
	private Date time;
	private float money;
	private float balance;

	// 保留此不带参数的构造方法
	public records() {

	}

	@Override
	public String toString() {
		return "records [record_p=" + record_p + ", meter_id=" + meter_id + ", time=" + time + ", money=" + money
				+ ", balance=" + balance + "]";
	}

	public records(int record_p, String meter_id, Date time, float money, float balance) {
		super();
		this.record_p = record_p;
		this.meter_id = meter_id;
		this.time = time;
		this.money = money;
		this.balance = balance;
	}

	public int getRecord_p() {
		return record_p;
	}

	public void setRecord_p(int record_p) {
		this.record_p = record_p;
	}

	public String getMeter_id() {
		return meter_id;
	}

	public void setMeter_id(String meter_id) {
		this.meter_id = meter_id;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public float getBalance() {
		return balance;
	}

	public void setBalance(float balance) {
		this.balance = balance;
	}

}
