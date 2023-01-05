package dto;

import java.io.Serializable;

public class Account implements Serializable{
	private static final long serialVersionUID = -4274700572038677000L;

	private String accountId;
	private String pname;
	private String description;
	private String manufacturer;
	private String category;
	private String filename;
	private double rate;
	
	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Account() {
		super();
	}
	
	public Account(String accountId, String pname, Double rate) {
		this.accountId = accountId;
		this.pname = pname;
		this.rate = rate;
	}
	
	
}
