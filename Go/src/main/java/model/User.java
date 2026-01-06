package model;

import java.sql.Timestamp;
import java.util.Date;

public class User {
	private int userId;
	private String email;
	private String passwordHash;
	private String fullName;
	private String phone;
	private Date dateOfBirth;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private boolean isActive;
	private String role;

	public User() {
	}

	public User(String email, String passwordHash, String fullName) {
		this.email = email;
		this.passwordHash = passwordHash;
		this.fullName = fullName;
	}

	// Getters and Setters
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswordHash() {
		return passwordHash;
	}

	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean active) {
		isActive = active;
	}

	@Override
	public String toString() {
		return "User{" + "userId=" + userId + ", email='" + email + '\'' + ", fullName='" + fullName + '\''
				+ ", phone='" + phone + '\'' + '}';
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}