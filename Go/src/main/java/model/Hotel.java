package model;

public class Hotel {
	private String name;
	private String imageIcon;
	private int stars;
	private double score;
	private int reviewCount;
	private String location;
	private String price;
	private int discount;

	public Hotel(String name, String imageIcon, int stars, double score, int reviewCount, String location, String price,
			int discount) {
		this.name = name;
		this.imageIcon = imageIcon;
		this.stars = stars;
		this.score = score;
		this.reviewCount = reviewCount;
		this.location = location;
		this.price = price;
		this.discount = discount;
	}

	// Getters
	public String getName() {
		return name;
	}

	public String getImageIcon() {
		return imageIcon;
	}

	public int getStars() {
		return stars;
	}

	public double getScore() {
		return score;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public String getLocation() {
		return location;
	}

	public String getPrice() {
		return price;
	}

	public int getDiscount() {
		return discount;
	}
}