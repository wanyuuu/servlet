package com.wanyu.db;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.dbcp2.BasicDataSourceFactory;
import org.apache.tomcat.jdbc.pool.DataSourceFactory;


import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by samsung on 2017/10/13.
 */
public class DBCP {
    //建立连接池对象
    private static DataSource myDataSource=null;
    static{
        Properties pro=new Properties();
        try {
            //加载DBCP配置文件
            pro.load(DBCP.class.getClassLoader().getResourceAsStream("dbcp.ini"));
            //获取数据源
            myDataSource= BasicDataSourceFactory.createDataSource(pro);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection(){
        Connection conn=null;
        try {
            conn= myDataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
