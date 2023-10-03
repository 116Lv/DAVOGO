/**
 * 
 */
package portal.common.util;

import java.util.Map;

/**
 * @author USER
 *
 */
public class MapUtil {

	/**
	 * Integer value
	 * @param data
	 * @param key
	 * @return
	 */
	public static Integer getIntValue(Map data, String key) throws Exception {
		String value = getValue(data, key);
		if (value == null)
			return null;
		return Integer.parseInt(value);
	}

	/**
	 * String value
	 * @param data
	 * @param key
	 * @return
	 */
	public static String getValue(Map data, String key) throws Exception {
		Object value = data.get(key);
		if (value == null)
			return null;
		return String.valueOf(value);
	}
	
	public static Long getLongValue(Map data, String key) throws Exception {
		String value = getValue(data, key);
		if (value == null)
			return null;
		return Long.parseLong(value);
	}

	
}
