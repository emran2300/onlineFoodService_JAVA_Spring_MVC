package com.controller;

import com.dao.ProductDao;
import com.dao.RuleDao;
import com.entity.Category;
import com.entity.Product;
import com.entity.Rule;
import com.model.CustomerInfo;
import com.model.ProductInfo;
import com.validator.ProductInfoValidator;
import com.model.ShoppingCart;
import com.util.OnlineFoodUtil;
import com.validator.ProductInfoValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class LoginController {
    public RuleDao getRuleDao() {
        return ruleDao;
    }

    public void setRuleDao(RuleDao ruleDao) {
        this.ruleDao = ruleDao;
    }

    public ProductDao getProductDao() {
        return productDao;
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    public ProductInfoValidator productInfoValidator;

    public ProductInfoValidator getProductInfoValidator() {
        return productInfoValidator;
    }

    public void setProductInfoValidator(ProductInfoValidator productInfoValidator) {
        this.productInfoValidator = productInfoValidator;
    }

    @Autowired
    private RuleDao ruleDao;
    @Autowired
    private ProductDao productDao;

    @RequestMapping("/loginValided")
    public String isValid(@ModelAttribute("rule") Rule rule,
                          ModelMap model) {
        try{
            if (ruleDao.get(rule.getName(),rule.getPassword())!=null) {
                return "redirect:/adminDashBord";
            }
        }catch (NullPointerException ne){
            model.addAttribute("Err", "Name or password not matched");
            return "login";
        }
        model.addAttribute("Err", "Name or password not matched");
        return "login";
    }

    @RequestMapping(value = "/adminDashBord", method = RequestMethod.GET)
    public String goToDashBord(ModelMap model) {

            List<Category> categories = this.productDao.getCategories();

            model.addAttribute("leftCategories", categories.subList(0, categories.size()));
            return "dashBord";

    }
    @RequestMapping("/showAddFoodForm")
    public String showAddFoodForm(HttpServletRequest httpServletRequest, ModelMap modelMap){
        List<Category> categories = this.productDao.getCategories();
        ProductInfo product = new ProductInfo();
        modelMap.addAttribute("categoryList",categories);
        modelMap.addAttribute("newFood",product);
        return "/addNewFood";
    }


    @RequestMapping(value = "/addOnDb", method = RequestMethod.POST)
    public String addOnDb(@ModelAttribute("newFood") ProductInfo productForm){
        productDao.save(productForm);
        return "redirect:/adminDashBord";
    }
    @RequestMapping("/showAddCategoryForm")
    public String addCategoryForm(ModelMap modelMap){
        Category category = new Category();
        modelMap.addAttribute("addCategory",category);
        return "addCategory";
    }
    @RequestMapping("/addOnCategory")
    public String addOnCategory(@ModelAttribute("addCategory")Category category){
        productDao.saveCategory(category);
        return "redirect:/adminDashBord";
    }
    @RequestMapping("/deleteProduct")
    public String deleteFood(@RequestParam int productId){
        productDao.delete(productId);
        return "redirect:/adminDashBord";
    }

}
