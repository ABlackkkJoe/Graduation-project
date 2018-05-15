package nuc.sw.zd.card.dao;



import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

/**
 *  操作数据库的基类 -- 静态类
 */
public class BaseDao {

    static {   // 静态代码块, 在类加载的时候执行
        init();
    }

    private static String driver;       //  数据库驱动字符串
    private static String url;          //  连接URL字符串
    private static String user;         //  用户名
    private static String password;     //  密码
    private static Connection conn;             //  数据连接对象

    // 初始化连接参数, 从配置文件中获得
    public static void init() {
        Properties params = new Properties();
        String configFile = "database.properties";
        // 加载配置文件的数据到输入流中
        InputStream is = BaseDao.class.getClassLoader().getResourceAsStream(configFile);
        try {
            params.load(is); // 从输入流中加载数据到属性表对象中
        } catch (IOException e) {
            e.printStackTrace();
        }
        driver = params.getProperty("driver");
        url = params.getProperty("url");
        user = params.getProperty("user");
        password = params.getProperty("password");
    }

    /**
     * 获取数据库连接
     */
    public static Connection getConnection() {
        if (conn == null) {
            try {
                Class.forName(driver);
                conn = DriverManager.getConnection(url, user, password);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return conn;   // 返回连接对象
    }

    /**
     * 查询操作
     */
    public static ResultSet execute(Connection connection, PreparedStatement pstm, ResultSet rs, String sql, Object[] params) throws SQLException {
        pstm = connection.prepareStatement(sql);
        for (int i = 0; i < params.length; i++) {
            pstm.setObject(i + 1, params[i]);
        }
        rs = pstm.executeQuery();
        return rs;
    }

    /**
     * 更新操作
     */
    public static int execute(Connection connection, PreparedStatement pstm, String sql, Object[] params) {
        int updateRows = 0;
        try {
            pstm = connection.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                pstm.setObject(i + 1, params[i]);
            }
            updateRows = pstm.executeUpdate();
            System.out.println(updateRows);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return updateRows;
    }

    /**
     * 释放资源
     */
    public static boolean closeResource(Connection connection, PreparedStatement pstm, ResultSet rs) {
        boolean flag = true;

        try {
            if (rs != null) {
                rs.close();
                rs = null;
            }
            if (pstm != null) {
                pstm.close();
                pstm = null;
            }
            if (connection != null) {
                connection.close();
                conn = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }
}
