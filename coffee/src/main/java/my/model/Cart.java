package my.model;

public class Cart {
	private int pid;
	private int amount;
	private String image;
	private String title;
	public Cart() {}
	public Cart(int pid, int amount, String image, String title) {
		super();
		this.pid = pid;
		this.amount = amount;
		this.image = image;
		this.title = title;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	} //기본생성자

}
