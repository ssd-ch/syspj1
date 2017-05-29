package syspj;

import java.util.Calendar;

public class MonthlyCalendar {

    /**
     * カレンダー表オブジェクトを作成します。
     *
     * @param year  西暦年(..., 2005, 2006, 2007, ...)
     * @param month 月(1, 2, 3, ..., 10, 11, 12)
     */

    public static int[][] getInt(int year,int month){

        Calendar calendar = Calendar.getInstance();
        calendar.clear();

        int[][] calendarMatrix = new int[6][7];
        int startday;
        int lastday;

        // 月の初めの曜日を求めます。
        calendar.set(year, month - 1, 1); // 引数: 1月: 0, 2月: 1, ...
        startday = calendar.get(Calendar.DAY_OF_WEEK);
        // 月末の日付を求めます。
        calendar.add(Calendar.MONTH, 1);
        calendar.add(Calendar.DATE, -1);
        lastday = calendar.get(Calendar.DATE);
        // カレンダー表を作成します。
        int row = 0;
        int column = startday - 1; // startday: 日曜日 = 1, 月曜日 = 2, ...
        for (int date = 1; date <= lastday; date++) {
            calendarMatrix[row][column] = date;
            if (column == 6) {
                row++;
                column = 0;
            } else {
                column++;
            }
        }
        return calendarMatrix;
    }

}
