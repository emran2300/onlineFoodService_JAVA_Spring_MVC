package com.validator;

import com.model.HotnessInfo;
import com.model.ItemInfo;
import com.model.ShoppingCart;
import com.util.OnlineFoodUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Component
public class HotnessValidator implements Validator {

    public boolean supports(Class<?> arg0) {
        return arg0 == HotnessInfo.class;
    }

    @Autowired(required = true)

    private HttpServletRequest request;

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public void validate(Object arg0, Errors errors) {

        HotnessInfo hotnessInfo = (HotnessInfo) arg0;

        ShoppingCart cart = OnlineFoodUtil.getOrderFromSession(request);

        int count = 0;
        List<String> a = hotnessInfo.getHotnessLevel();

        for (ItemInfo info : cart.getCartItem()) {

            if (OnlineFoodUtil.categoriesForHotnessLevel().contains(info.getProductInfo().getCategoryId())) {
                try {
                    if (a == null) {
                        errors.rejectValue("hotnessLevel[" + count + "]", "NotEmpty.hotness.value");
                        break;
                    } else if (a.get(count) == null) {
                        errors.rejectValue("hotnessLevel[" + count + "]", "NotEmpty.hotness.value");
                        break;
                    } else {
                        count++;
                    }
                } catch (IndexOutOfBoundsException e) {
                    errors.rejectValue("hotnessLevel[" + count + "]", "NotEmpty.hotness.value");
                }


            }

        }


    }
}
