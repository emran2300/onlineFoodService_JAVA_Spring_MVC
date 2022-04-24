package com.dao;

import com.entity.Category;
import com.entity.Product;
import com.model.ProductInfo;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao {
    private SessionFactory sessionFactory;

    public Product getProductDetails(int productId) {

        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        String query = "from Product where productId=:productId";
        Query query2 = session.createQuery(query);
        query2.setParameter("productId", productId);

        Object object = query2.uniqueResult();

        transaction.commit();
        session.close();

        return (Product) object;
    }

    public List<Category> getCategories() {

        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        String query = "from Category";
        Query query2 = session.createQuery(query);

        Object object = query2.list();

        List<Category> list = (List<Category>) object;

        transaction.commit();
        session.close();
        return list;
    }

    public void save(ProductInfo product){
        Category category = new Category();
        category.setCategoryId(product.getCategoryId());
        System.out.println(category.getCategoryId());
        Product product1 =new Product();
        product1.setProductName(product.getProductName());
        product1.setDescription(product.getDescription());
        product1.setPrice(product.getPrice());
        product1.setCategoryId(category);
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        session.save(product1);

        transaction.commit();
        session.close();
    }
    public void delete(int id){
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(getProductDetails(id));
        transaction.commit();
        session.close();
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public void saveCategory(Category category){
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(category);
        transaction.commit();
        session.close();
    }
}
