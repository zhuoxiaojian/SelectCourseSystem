package cn.edu.gdin.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateBean {
	 /**
     * 获取现在时间
     */
    public static String getStringDate() {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String dateString = formatter.format(currentTime);
        return dateString;
    }
 
    /**
     * 两个时间之间的天数
     */
    public static long getDays(String date1, String date2) {
        if (date1 == null || date1.equals(""))
            return 0;
        if (date2 == null || date2.equals(""))
            return 0;
        // 转换为标准时间
        SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = null;
        java.util.Date mydate = null;
        try {
            date = myFormatter.parse(date1);
            mydate = myFormatter.parse(date2);
        } catch (Exception e) {
        }
        long day = (date.getTime() - mydate.getTime()) / (24 * 60 * 60 * 1000);
        return Math.abs(day) / 365;
    }
    
  
}
