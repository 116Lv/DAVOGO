/**
 * 
 */
package portal.common.util;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

/**
 * 날짜 관련 util
 * @author USER
 *
 */
public class DateUtil {

	public static final String YMD = "yyyyMMdd";
	public static final String YMDHM = "yyyyMMddHHmm";
	public static final String YMDHMSS = "yyyyMMddHHmmssSSS";
	
	
	/**
	 * 현재날짜 조회
	 * @return
	 */
	public static String getCurrentDate(String pattern) {
		
		if (StringUtils.isBlank(pattern)) {
			pattern = YMD;
		}
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.format(new Date());
	}
	
	/**
	 * 나이를 년도로 변환
	 * @param ageStr
	 * @return
	 */
	public static String getYear(String ageStr) {
		
		if (StringUtils.isBlank(ageStr))
			return null;
		
		int age = NumberUtils.toInt(ageStr, 1);
		int currYear = Calendar.getInstance().get(Calendar.YEAR); 
		
		return Integer.toString(currYear - age);
	}
	
	/**
	 * 출생일자를 만나이로 변환
	 * @param birthStr
	 * @return
	 */
	public static int getAge(String birthStr) {
		
		if (StringUtils.isBlank(birthStr) || birthStr.length() != 8) {
			return 0;
		}
		
		LocalDate now = LocalDate.now();
		LocalDate parsedBirthDate = LocalDate.parse(birthStr, DateTimeFormatter.ofPattern(YMD));
	 
		int age = now.minusYears(parsedBirthDate.getYear()).getYear();
		
		//생일 안지났으면 한살 빼기
		if (parsedBirthDate.plusYears(age).isAfter(now)) { 
			age--;
		}
			
		return age;
	}
	
	/**
	 * 어제 날짜를 리턴
	 * @return
	 */
	public static String getYesterday() {
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_YEAR, -1);
		
		SimpleDateFormat format = new SimpleDateFormat(YMD);
		return format.format(cal.getTime());
	}
	
	/**
	 * 1주일 전 날짜 리턴
	 * @return
	 */
	public static String getWeekAgo() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.WEEK_OF_YEAR, -1);
		
		SimpleDateFormat format = new SimpleDateFormat(YMD);
		return format.format(cal.getTime());
	}
	
}
