package com.wanyu.db;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by samsung on 2017/10/13.
 */
public class Druid {
    private static DataSource myDataSource=null;
    static {
        Properties pro=new Properties();
        try {
            pro.load(Druid.class.getClassLoader().getResourceAsStream("druid.ini"));
            myDataSource= DruidDataSourceFactory.createDataSource(pro);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection(){
        Connection conn=null;
        try {
            conn=myDataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
