package com.wanyu.db;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by samsung on 2017/10/13.
 */
public class C3P0 {
    public static ComboPooledDataSource cs=null;
    static {
        cs=new ComboPooledDataSource("mysql");
    }
    public static Connection getConnection(){
         Connection conn=null;
        try {
            conn=cs.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
