package com.tf.util;

import java.util.Collection;
import java.util.Map;

public class Utility {
	
	public static boolean isEmpty(Collection obj) {
	    return obj == null || obj.isEmpty();
	}

	public static boolean isEmpty(String string) {
	    return string == null || string.trim().isEmpty();
	}

	public static boolean isEmpty(Object obj) {
	    return obj == null || obj.toString().trim().isEmpty();
	}
	
	public static boolean isEmpty(Map<?, ?> value) {
	    return value == null || value.isEmpty();
	}
}
