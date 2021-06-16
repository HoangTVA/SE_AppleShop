/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class OrderDTO {
    private String orderID;
    private String cusName;
    private String address;
    private String phone;
    private String email;
    private String orderDate;
    private String codeID;
    private String userID;
    private double price;
    private String payMethod;
    private String status;

    public OrderDTO() {
    }

    public OrderDTO(String orderID, String cusName, String address, String phone, String email, String orderDate, String codeID, String userID, double price, String payMethod, String status) {
        this.orderID = orderID;
        this.cusName = cusName;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.orderDate = orderDate;
        this.codeID = codeID;
        this.userID = userID;
        this.price = price;
        this.payMethod = payMethod;
        this.status = status;
    }

    

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getCodeID() {
        return codeID;
    }

    public void setCodeID(String codeID) {
        this.codeID = codeID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
