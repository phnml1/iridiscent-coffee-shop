package my.model;

import java.util.Date;

public class Coffee {
	private int coffeeId;
	private String title;
	private String name;
	private String memo;
	private String image;
	private int price;
	private Date rdate;
	private String favorate;
	private String kind;
	private String detailimage;
	
	public Coffee() {}

	public Coffee(int coffeeId, String title, String name, String memo, String image, int price, Date rdate,
			String favorate, String kind, String detailimage) {
		super();
		this.coffeeId = coffeeId;
		this.title = title;
		this.name = name;
		this.memo = memo;
		this.image = image;
		this.price = price;
		this.rdate = rdate;
		this.favorate = favorate;
		this.kind = kind;
		this.detailimage = detailimage;
	}

	public int getCoffeeId() {
		return coffeeId;
	}

	public void setCoffeeId(int coffeeId) {
		this.coffeeId = coffeeId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getFavorate() {
		return favorate;
	}

	public void setFavorate(String favorate) {
		this.favorate = favorate;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getDetailimage() {
		return detailimage;
	}

	public void setDetailimage(String detailimage) {
		this.detailimage = detailimage;
	}
	

	
	
}
