package cn.card.servlet.wx_card;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class CheckIn {
    private Date inTime;

    public CheckIn(Date inTime) {
        this.inTime = inTime;
    }

    public String getFormatTime(String format) {
        String value = null;
        DateFormat dateFormat = new SimpleDateFormat(format);
        value =dateFormat.format(inTime);
        return value;
    }

}
