package cn.smbms.util;

import org.apache.commons.dbcp.BasicDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class DBCPUtil {
    //创建数据库连接池对象
    public static BasicDataSource basicDataSource = new BasicDataSource();

    //静态代码块  只执行一次
    static {
        basicDataSource.setDriverClassName("com.mysql.jdbc.Driver");
        basicDataSource.setUrl("jdbc:mysql://localhost:3306/nuc_card?characterEncoding=utf-8&&useSSL=true");
        basicDataSource.setUsername("root");
        basicDataSource.setPassword("");
    }


    //返回数据库连接对象
    public static Connection getConnection(){
        Connection connection = null;
        try {
            connection = basicDataSource.getConnection();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return connection;
    }


    //返回一个数据库连接对象
    public static BasicDataSource getBasicDataSource(){
        return basicDataSource;
    }


}
