package com.dao;

import com.entity.Category;
import com.entity.Product;
import com.model.ProductInfo;

import java.util.List;

public interface ProductDao {

    public Product getProductDetails(int itemId);

    public List<Category> getCategories();
    public void save(ProductInfo product);
    public void delete(int id);
    public  void saveCategory(Category category);
}
