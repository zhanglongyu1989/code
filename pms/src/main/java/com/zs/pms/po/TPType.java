package com.zs.pms.po;

import java.io.Serializable;

public class TPType implements Serializable{

	/**
	 * ��Ʒ���
	 */
	private static final long serialVersionUID = -1413205124090823252L;
	
	private int id;
	private String tname;
	private int pid;
	private String remark;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
