package com.imooc.model;

//�����
public class meter {

	private String meter_id; // ����� ***********
	private int id; // �û�id*************
	private int typen; // ������ͱ��
	private int sche; // �ɼ�������� ***********
	private String code_a; // ���������
	private String state; // ���״̬�� ͨ�绹�Ƕϵ�*************
	private float balance; // ������
	private String remark; // λ�ã���ע��ϸ��ַ *********
	private int isdelete; // ɾ����� *************
	private String sort; // �ͺ� ************

	// �����˲��������Ĺ��췽��
	public meter() {

	}

	@Override
	public String toString() {
		return "meter [meter_id=" + meter_id + ", id=" + id + ", typen=" + typen + ", sche=" + sche + ", code_a="
				+ code_a + ", state=" + state + ", balance=" + balance + ", remark=" + remark + ", isdelete=" + isdelete
				+ ", sort=" + sort + "]";
	}

	public meter(String meter_id, int id, int typen, int sche, String code_a, String state, float balance,
			String remark, int isdelete, String sort) {
		super();
		this.meter_id = meter_id;
		this.id = id;
		this.typen = typen;
		this.sche = sche;
		this.code_a = code_a;
		this.state = state;
		this.balance = balance;
		this.remark = remark;
		this.isdelete = isdelete;
		this.sort = sort;
	}

	public String getMeter_id() {
		return meter_id;
	}

	public void setMeter_id(String meter_id) {
		this.meter_id = meter_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTypen() {
		return typen;
	}

	public void setTypen(int typen) {
		this.typen = typen;
	}

	public int getSche() {
		return sche;
	}

	public void setSche(int sche) {
		this.sche = sche;
	}

	public String getCode_a() {
		if (code_a != null)
			return code_a;
		else
			return "";
	}

	public void setCode_a(String code_a) {
		this.code_a = code_a;
	}

	public String getState() {
		if (state != null)
			return state;
		else
			return "";
	}

	public void setState(String state) {
		this.state = state;
	}

	public float getBalance() {
		return balance;
	}

	public void setBalance(float balance) {
		this.balance = balance;
	}

	public String getRemark() {
		if (remark != null)
			return remark;
		else
			return "";
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}

	public String getSort() {
		if (sort != null)
			return sort;
		else
			return "";
	}

	public void setSort(String sort) {
		this.sort = sort;
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

}
