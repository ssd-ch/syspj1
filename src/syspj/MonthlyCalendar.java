package syspj;

import java.util.Calendar;

public class MonthlyCalendar {
    private int year;

    private int month;

    private int[][] calendarMatrix = new int[6][7];

    private int starthay;

    private int lasthate;

    /**
     * カレンダー表オブジェクトを作成します。
     *
     * @param year  西暦年(..., 2005, 2006, 2007, ...)
     * @param month 月(1, 2, 3, ..., 10, 11, 12)
     */
    public MonthlyCalendar(int year, int month) {
        this.year = year;
        this.month = month;
        calcFields();
    }

    private void calcFields() {
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        // 月の初めの曜日を求めます。
        calendar.set(year, month - 1, 1); // 引数: 1月: 0, 2月: 1, ...
        starthay = calendar.get(Calendar.DAY_OF_WEEK);
        // 月末の日付を求めます。
        calendar.add(Calendar.MONTH, 1);
        calendar.add(Calendar.DATE, -1);
        lasthate = calendar.get(Calendar.DATE);
        // カレンダー表を作成します。
        int row = 0;
        int column = starthay - 1; // starthay: 日曜日 = 1, 月曜日 = 2, ...
        for (int date = 1; date <= lasthate; date++) {
            calendarMatrix[row][column] = date;
            if (column == 6) {
                row++;
                column = 0;
            } else {
                column++;
            }
        }
    }

    @Override
    public String toString() {
        boolean breakFlg = false;

        StringBuffer sb = new StringBuffer();
        sb.append("<table border=\"1\">\r\n");
        sb.append("<tr><th>日</th><th>月</th><th>火</th><th>水</th><th>木</th><th>金</th><th>土</th></tr>\r\n");
        for (int i = 0; i < calendarMatrix.length; i++) {
            sb.append("<tr>");
            for (int j = 0; j < calendarMatrix[i].length; j++) {
                int day = calendarMatrix[i][j];
                if (day == 0) {
                    sb.append("<td></td>");
                } else {
                    sb.append("<td>" + String.valueOf(day) + "</td>");
                }
                if (day == lasthate) {
                    breakFlg = true;
                }
            }
            sb.append("</tr>\r\n");
            if (breakFlg)
                break;
        }
        sb.append("</table>");
        return sb.toString();
    }

    public static void main(String[] args) {
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);
        int currentMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
        System.out.println(currentYear + "年" + currentMonth + "月");
        System.out.println(new MonthlyCalendar(currentYear, currentMonth));
    }
}
