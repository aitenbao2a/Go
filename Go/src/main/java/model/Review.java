package model;

import java.time.LocalDateTime;

public class Review {
    private int reviewId;
    private int userId;
    private int hotelId;
    private int rating;
    private String comment;
    private LocalDateTime createdAt;
    
    // Thông tin từ User (không lưu trong DB, chỉ dùng để hiển thị)
    private String userName;
    private String userAvatar;

    // Constructors
    public Review() {
    }

    public Review(int userId, int hotelId, int rating, String comment) {
        this.userId = userId;
        this.hotelId = hotelId;
        this.rating = rating;
        this.comment = comment;
    }

    // Getters and Setters
    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }

    @Override
    public String toString() {
        return "Review{" +
                "reviewId=" + reviewId +
                ", userId=" + userId +
                ", hotelId=" + hotelId +
                ", rating=" + rating +
                ", userName='" + userName + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}