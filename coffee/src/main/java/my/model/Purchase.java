package my.model;

import java.util.Date;

public class Purchase {
	private int PurchaseId;
	private String buyerId;
	private int pid;
	private int amount;
	private int price;
	private Date pdate;
	
	public Purchase() {}

	public Purchase(String buyerId, int pid, int amount, int price, Date pdate) {
		super();
		this.buyerId = buyerId;
		this.pid = pid;
		this.amount = amount;
		this.price = price;
		this.pdate = pdate;
	}

	public int getPurchaseId() {
		return PurchaseId;
	}

	public void setPurchaseId(int purchaseId) {
		PurchaseId = purchaseId;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	
	
	
	
}
