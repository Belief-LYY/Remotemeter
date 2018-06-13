package com.imooc.model;

import java.util.Date;

public class scheme {
	private int sche;
	private int rate;
	private Date start;
	private Date end;
	private int isdelete;

	// 保留此不带参数的构造方法
	public scheme() {

	}

	@Override
	public String toString() {
		return "scheme [sche=" + sche + ", rate=" + rate + ", start=" + start + ", end=" + end + "]";
	}

	public scheme(int sche, int rate, Date start, Date end, int isdelete) {
		super();
		this.sche = sche;
		this.rate = rate;
		this.start = start;
		this.end = end;
		this.isdelete = isdelete;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}

	public int getSche() {
		return sche;
	}

	public void setSche(int sche) {
		this.sche = sche;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

}
