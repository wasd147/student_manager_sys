package com.javabean;

public class Student {
	private String name;
	private int id;
	private String password;
	private String sex;
	private int year;
	private int grade;
	// 下面是非必须的信息，可以为null
	private String sfzh;
	private String xy;
	private String zy;
	private String bj;
	private String zzmm;
	private String lxdh;
	private String dzyj;
	private String jg;
	public Student() {
		// TODO Auto-generated constructor stub
	}

	public Student(String name, int id, String password, String sex, int year, int grade, String sfzh, String xy,
                   String zy, String bj, String zzmm, String lxdh, String dzyj, String jg) {
		super();
		this.name = name;
		this.id = id;
		this.password = password;
		this.sex = sex;
		this.year = year;
		this.grade = grade;
		this.sfzh = sfzh;
		this.xy = xy;
		this.zy = zy;
		this.bj = bj;
		this.zzmm = zzmm;
		this.lxdh = lxdh;
		this.dzyj = dzyj;
		this.jg = jg;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getXy() {
		return xy;
	}

	public void setXy(String xy) {
		this.xy = xy;
	}

	public String getZy() {
		return zy;
	}

	public void setZy(String zy) {
		this.zy = zy;
	}

	public String getBj() {
		return bj;
	}

	public void setBj(String bj) {
		this.bj = bj;
	}

	public String getZzmm() {
		return zzmm;
	}

	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}

	public String getLxdh() {
		return lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getDzyj() {
		return dzyj;
	}

	public void setDzyj(String dzyj) {
		this.dzyj = dzyj;
	}

	public String getJg() {
		return jg;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

}
