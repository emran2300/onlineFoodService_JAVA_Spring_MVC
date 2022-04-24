package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "orderItems")
public class OrderItems {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "item_id")
    private int orderItemId;

    @Column(name = "name")
    private String name;

    @Column(name = "quantity")
    private int quantity;

    @Column(name = "hotness")
    private String hotnessLevel;

    public OrderItems(Order order) {

    }

    public OrderItems() {

    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getHotnessLevel() {
        return hotnessLevel;
    }

    public void setHotnessLevel(String hotnessLevel) {
        this.hotnessLevel = hotnessLevel;
    }

    public Order getOrderId() {
        return orderId;
    }

    public void setOrderId(Order orderId) {
        this.orderId = orderId;
    }

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order orderId;

}
