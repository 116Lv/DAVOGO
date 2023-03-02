package portal.common.util;

import java.lang.reflect.Array;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;

public class StringUtil {

	public static Boolean empty(Object obj) {
	    if (obj instanceof String) return obj == null || "".equals(obj.toString().trim());
	    else if (obj instanceof List) return obj == null || ((List<?>) obj).isEmpty();
	    else if (obj instanceof Map) return obj == null || ((Map<?, ?>) obj).isEmpty();
	    else if (obj instanceof Object[]) return obj == null || Array.getLength(obj) == 0;
	    else return obj == null;
	}
	
	public static Boolean notEmpty(Object obj) {
	    return !empty(obj);
	}
	
	public static String join(List<String> list) {
		return join(list, ",");
	}
	
	public static String join(List<String> list, String joinStr) {
		if (list == null || list.isEmpty())
			return null;
		
		return list.stream().collect(Collectors.joining( StringUtils.isNotBlank(joinStr) ? joinStr : "," ));
	}
}
