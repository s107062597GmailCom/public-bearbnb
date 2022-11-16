package team.lazybear.bearbnb.data;

import java.util.Date;

public class TimePeriod {

    public static final long SECOND = 1000;

    public static final long MINUTE = SECOND * 60;

    public static final long HOUR = MINUTE * 60;

    public static final long DAY = HOUR * 24;

    public static final long WEEK = DAY * 7;

    public static final long TIME_ZONE_OFFSET = HOUR * 8;

    private long startTime;

    private long endTime;

    public TimePeriod() {}

    public TimePeriod(long startTime, long endTime) {
        setStartTime(startTime);
        setEndTime(endTime);
    }

    public TimePeriod(Date startDate, Date endDate) {
        setStartTime(startDate);
        setEndTime(endDate);
    }

    public long getStartTime() {
        return startTime;
    }

    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }

    public void setStartTime(Date startDate) {
        setStartTime(startDate.getTime());
    }

    public long getEndTime() {
        return endTime;
    }

    public void setEndTime(long endTime) {
        this.endTime = endTime;
    }

    public void setEndTime(Date endDate) {
        setEndTime(endDate.getTime());
    }

    public boolean isIn(long time) {
        return time >= startTime && time <= endTime;
    }

    public boolean isIn(Date date) {
        return isIn(date.getTime());
    }

}
