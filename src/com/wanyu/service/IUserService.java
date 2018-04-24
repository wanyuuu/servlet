package com.wanyu.service;

import com.wanyu.vo.User;

import java.util.List;

/**
 * Created by samsung on 2017/10/10.
 */
public interface IUserService {
    public boolean add(User user);
    public boolean del(int id);
    public boolean update(User user);
    public List<User> queryAll();
    public User queryById(int id);
    public boolean queryByName(String username);
    public int online();
}
