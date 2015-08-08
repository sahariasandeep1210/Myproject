package com.tf.util;

import java.text.NumberFormat;

import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.util.StringUtils;

public class MyCustomNumberEditor extends CustomNumberEditor{

    public MyCustomNumberEditor(Class<? extends Number> numberClass, NumberFormat numberFormat, boolean allowEmpty) throws IllegalArgumentException {
        super(numberClass, numberFormat, allowEmpty);
    }

    public MyCustomNumberEditor(Class<? extends Number> numberClass, boolean allowEmpty) throws IllegalArgumentException {
        super(numberClass, allowEmpty);
    }

    
    

   

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if (!StringUtils.hasText(text)) {
            setValue(null);
        }else {
            super.setAsText(text.trim());
        }
    }
    

}