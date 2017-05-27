import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class JDBCPostgreSQL {

    Connection con;

    public void open() {
        try {
            // ドライバをロード
            Class.forName("org.postgresql.Driver");

            // データベースのURL (XXXをデータベース名に変える)
            String url = "jdbc:postgresql://127.0.0.1:5432/syspj_test";
            // ユーザ (XXXをグループ名に変える)
            String usr = "syspj";
            // パスワード (空でよい)
            String pwd = "";

            // データベースサーバへの接続
            con = DriverManager.getConnection(url, usr, pwd);
        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<HashMap<String,String>> get(String sql, String[] column) {

        ArrayList<HashMap<String,String>> resultData = new ArrayList<>();

        try {
            // Statementオブジェクトを生成
            Statement stmt = con.createStatement();

            // ResultSetオブジェクトの生成
            // SELECT文の処理
            ResultSet rs = stmt.executeQuery(sql);

            // 問い合わせ結果を出力
            while (rs.next()) {

                HashMap<String,String> rowData = new HashMap<>();

                for(String str: column) {
                    rowData.put(str, rs.getString(str));
                }

                resultData.add(rowData);
            }

            // ResultSetオブジェクトのclose
            rs.close();

            // Statementオブジェクトのclose
            stmt.close();

            return resultData;

        } catch (Exception e) {
            return null;
        }
    }


    public void close() {
        // データベースから切断
        try {
            con.close();
        } catch (Exception e) {

        }
    }
}

