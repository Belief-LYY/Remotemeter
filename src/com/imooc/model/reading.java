package com.imooc.model;

import java.util.Date;

public class reading {

	private int record_r;
	private String meter_id;
	private Date time;
	private float reading;

	// 保留此不带参数的构造方法
	public reading() {

	}

	@Override
	public String toString() {
		return "reading [record_r=" + record_r + ", meter_id=" + meter_id + ", time=" + time + ", reading=" + reading
				+ "]";
	}

	public reading(int record_r, String meter_id, Date time, float reading) {
		super();
		this.record_r = record_r;
		this.meter_id = meter_id;
		this.time = time;
		this.reading = reading;
	}

	public int getRecord_r() {
		return record_r;
	}

	public void setRecord_r(int record_r) {
		this.record_r = record_r;
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

	public float getReading() {
		return reading;
	}

	public void setReading(float reading) {
		this.reading = reading;
	}

}
