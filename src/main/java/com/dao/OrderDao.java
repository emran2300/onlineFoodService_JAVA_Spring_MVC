package com.dao;


import com.entity.Order;
import com.model.ShoppingCart;

import java.util.List;

public interface OrderDao {

    public void saveOrder(ShoppingCart cart);

    public List<Order> showOrdersForToday();

    public Order getOrderDetails(int orderId);
}

