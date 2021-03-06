package com.util;

import com.model.ProductInfo;
import com.model.ShoppingCart;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.Set;

public class OnlineFoodUtil {
    public static ShoppingCart getOrderFromSession(HttpServletRequest httpServletRequest) {

        ShoppingCart cart = (ShoppingCart) httpServletRequest.getSession().getAttribute("order");

        if (cart == null) {
            cart = new ShoppingCart();
            httpServletRequest.getSession().setAttribute("order", cart);
        }

        return cart;

    }

    public static ProductInfo getProductFromSession(HttpServletRequest httpServletRequest) {



        ProductInfo productInfo = (ProductInfo) httpServletRequest.getSession().getAttribute("product");
        if (productInfo == null) {
            productInfo = new ProductInfo();
            httpServletRequest.getSession().setAttribute("product", productInfo);
        }

        return productInfo;

    }

    public static Set<Integer> categoriesForHotnessLevel() {

        Set<Integer> categoriesForHotness = new HashSet<Integer>();

        categoriesForHotness.add(2);
        categoriesForHotness.add(4);
        categoriesForHotness.add(5);
        categoriesForHotness.add(6);
        categoriesForHotness.add(7);
        categoriesForHotness.add(8);
        categoriesForHotness.add(9);
        categoriesForHotness.add(10);

        return categoriesForHotness;

    }


    public static void removeOrderFromSession(HttpServletRequest httpServletRequest) {

        httpServletRequest.getSession().removeAttribute("order");
    }

    public static void addLastOrderToSession(HttpServletRequest httpServletRequest) {

        httpServletRequest.getSession().setAttribute("lastOrder", httpServletRequest.getSession().getAttribute("order"));
    }


    public static double addTax(double price) {


        return 0;
    }
}
