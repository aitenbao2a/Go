package model;

import java.math.BigDecimal;

public class Room {
    private int roomId;
    private int hotelId;
    private String roomType;
    private String description;
    private int capacity;
    private BigDecimal pricePerNight;
    private int totalRooms;
    private int availableRooms;
    private String amenities;
    private String images;

    // Constructors
    public Room() {
    }

    public Room(int roomId, int hotelId, String roomType, String description, 
                int capacity, BigDecimal pricePerNight, int totalRooms, int availableRooms,
                String amenities, String images) {
        this.roomId = roomId;
        this.hotelId = hotelId;
        this.roomType = roomType;
        this.description = description;
        this.capacity = capacity;
        this.pricePerNight = pricePerNight;
        this.totalRooms = totalRooms;
        this.availableRooms = availableRooms;
        this.amenities = amenities;
        this.images = images;
    }

    // Getters and Setters
    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public BigDecimal getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(BigDecimal pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    public int getTotalRooms() {
        return totalRooms;
    }

    public void setTotalRooms(int totalRooms) {
        this.totalRooms = totalRooms;
    }

    public int getAvailableRooms() {
        return availableRooms;
    }

    public void setAvailableRooms(int availableRooms) {
        this.availableRooms = availableRooms;
    }

    public String getAmenities() {
        return amenities;
    }

    public void setAmenities(String amenities) {
        this.amenities = amenities;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "Room{" +
                "roomId=" + roomId +
                ", hotelId=" + hotelId +
                ", roomType='" + roomType + '\'' +
                ", description='" + description + '\'' +
                ", capacity=" + capacity +
                ", pricePerNight=" + pricePerNight +
                ", totalRooms=" + totalRooms +
                ", availableRooms=" + availableRooms +
                ", amenities='" + amenities + '\'' +
                ", images='" + images + '\'' +
                '}';
    }
}