package com.controller;

import com.dao.ProductDao;
import com.entity.Category;
import com.entity.Rule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class HomePageController {
    @Autowired
    private ProductDao productDao;

    public ProductDao getProductDao() {
        return productDao;
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }


    @RequestMapping(value = {"/", "/index", "/welcome"}, method = RequestMethod.GET)
    public String homePage(ModelMap model) {

        model.addAttribute("message", "Online Food Service");

        List<Category> categories = this.productDao.getCategories();

        model.addAttribute("leftCategories", categories.subList(0, categories.size()));

        return "index";
    }

    @RequestMapping("/showLogin")
    public String loginPage(ModelMap model) {
        Rule rule = new Rule();
        model.addAttribute("rule", rule);
        return "login";
    }
}
