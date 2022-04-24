package com.validator;

import com.entity.Product;
import com.model.CustomerInfo;
import com.model.ProductInfo;
import org.apache.commons.validator.EmailValidator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class ProductInfoValidator implements Validator{

 public boolean supports(Class<?> arg0) {
            return arg0 == ProductInfo.class;
        }

        public void validate(Object target, Errors errors) {
            ProductInfo productInfo = (ProductInfo) target;

            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productName", "NotEmpty.newFood.productName");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "NotEmpty.newFood.price");
           // ValidationUtils.rejectIfEmptyOrWhitespace(errors, "categoryId", "NotEmpty.newFood.categoryId");
            //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "NotEmpty.newFood.description");

        }
}
