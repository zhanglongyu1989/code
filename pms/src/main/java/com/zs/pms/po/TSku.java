package com.zs.pms.po;

import java.io.Serializable;
import java.util.Date;

public class TSku implements Serializable{

	/**
	 * ��Ʒ���
	 */
	private static final long serialVersionUID = -3127484416070583435L;
	
	private int id;
	private int pid; // ��Ʒid
	private String color; // ��ɫ
	private int siz; // ����
	private String feature; // ����
	// �˷�
	private double trancost;
	// �ۼ�
	private double sellcost;
	// ʣ������
	private int recont;
	// ��������
	private int limi;
	// ��ȫ���
	private int safcont;
	// �ֿ��
	private String wpos;
	// skuͼƬ
	private String skupic;
	// sku����
	private String skuname;
	// �г���
	private double price;
	// ����
	private int sellcont;

	private int creator;
	private Date creatime;
	private int updator;
	private Date updatime;
	// ������ʾ
	private String colorTxt;
	private String sizTxt;
	private String featureTxt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getSiz() {
		return siz;
	}
	public void setSiz(int siz) {
		this.siz = siz;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public double getTrancost() {
		return trancost;
	}
	public void setTrancost(double trancost) {
		this.trancost = trancost;
	}
	public double getSellcost() {
		return sellcost;
	}
	public void setSellcost(double sellcost) {
		this.sellcost = sellcost;
	}
	public int getRecont() {
		return recont;
	}
	public void setRecont(int recont) {
		this.recont = recont;
	}
	public int getLimi() {
		return limi;
	}
	public void setLimi(int limi) {
		this.limi = limi;
	}
	public int getSafcont() {
		return safcont;
	}
	public void setSafcont(int safcont) {
		this.safcont = safcont;
	}
	public String getWpos() {
		return wpos;
	}
	public void setWpos(String wpos) {
		this.wpos = wpos;
	}
	public String getSkupic() {
		return skupic;
	}
	public void setSkupic(String skupic) {
		this.skupic = skupic;
	}
	public String getSkuname() {
		return skuname;
	}
	public void setSkuname(String skuname) {
		this.skuname = skuname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getSellcont() {
		return sellcont;
	}
	public void setSellcont(int sellcont) {
		this.sellcont = sellcont;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public Date getCreatime() {
		return creatime;
	}
	public void setCreatime(Date creatime) {
		this.creatime = creatime;
	}
	public int getUpdator() {
		return updator;
	}
	public void setUpdator(int updator) {
		this.updator = updator;
	}
	public Date getUpdatime() {
		return updatime;
	}
	public void setUpdatime(Date updatime) {
		this.updatime = updatime;
	}
	public String getColorTxt() {
		return colorTxt;
	}
	public void setColorTxt(String colorTxt) {
		this.colorTxt = colorTxt;
	}
	public String getSizTxt() {
		return sizTxt;
	}
	public void setSizTxt(String sizTxt) {
		this.sizTxt = sizTxt;
	}
	public String getFeatureTxt() {
		return featureTxt;
	}
	public void setFeatureTxt(String featureTxt) {
		this.featureTxt = featureTxt;
	}

}
