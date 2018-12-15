package in.gov.rera.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.apache.log4j.Logger;

@Service
public class DateUtil {
	static Logger log= Logger.getLogger(DateUtil.class);
	

	public static int getYearBack(int inp) {
		int year = 0;
		try {
			year = Calendar.getInstance().get(Calendar.YEAR) - inp;

		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}

		return year;

	}

	public static String getDateString(Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dat = new SimpleDateFormat("yyyy-MM-dd");
			return dat.format(cal.getTime());
		}

		return " Date Not exist ";
	}

	public static String getDateString(Date cal) {
		if (cal != null) {
			SimpleDateFormat dat = new SimpleDateFormat("yyyy-MM-dd");
			return dat.format(cal);
		}

		return " Date Not exist ";
	}

	public static Date firstDayOfLastWeek(Calendar c, Integer weekNumber) {
		c = (Calendar) c.clone();
		c.add(Calendar.WEEK_OF_YEAR, weekNumber);
		c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek());
		return c.getTime();
	}

	public static Date lastDayOfLastWeek(Calendar c, Integer weekNumber) {
		c = (Calendar) c.clone();
		c.setTime(firstDayOfWeek(weekNumber));
		c.add(Calendar.DAY_OF_MONTH, 7);
		return c.getTime();
	}

	public static Integer getcurrentMonth() {
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.MONTH);
	}

	public static Date firstDayOfWeek(Integer weekNumber) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		return firstDayOfLastWeek(calendar, weekNumber);
	}

	public static Date lastDayOfWeek(Integer weekNumber) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		return lastDayOfLastWeek(calendar, weekNumber);
	}

	public static String dateFormate(Calendar cal) {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String formatted = format1.format(cal.getTime());
		return formatted;
	}
	
	public static Calendar firstDayOfMonth( int year , int month ){
		Calendar c = Calendar.getInstance();
	    int day = 1;
	    c.set(year, month-1, day,0,0,0);
		return c;
	}
	
	public static Calendar lastDayOfMonth( int year , int month ){
		Calendar c = Calendar.getInstance();
	    int day = 1;
	    c.set(year, month-1, day,23,59,59);
	    int numOfDaysInMonth = c.getActualMaximum(Calendar.DAY_OF_MONTH);
	    c.add(Calendar.DAY_OF_MONTH, numOfDaysInMonth-1);
	    log.info(c.getTime());
		return c;
	}

}
