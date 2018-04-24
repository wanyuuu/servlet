package com.wanyu.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by samsung on 2017/10/10.
 */
public class DB {
    static Connection conn=null;
    static public Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test?useUnicode=true&&characterEncoding=utf-8","root","root");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    static public void closeConnection(){
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
