package com.wanyu.service;

import com.wanyu.dao.IUserDAO;
import com.wanyu.dao.UserDAOImpl;
import com.wanyu.listener.Listener;
import com.wanyu.vo.User;

import java.util.List;

/**
 * Created by samsung on 2017/10/10.
 */
public class UserServiceImpl implements IUserService {
    private IUserDAO dao=new UserDAOImpl();
    @Override
    public boolean add(User user) {
        return dao.add(user);
    }

    @Override
    public boolean del(int id) {
        return dao.del(id);
    }

    @Override
    public boolean update(User user) {
        return dao.update(user);
    }

    @Override
    public List<User> queryAll() {
        return dao.queryAll();
    }

    @Override
    public User queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public boolean queryByName(String username) {
        return dao.queryByName(username);
    }
    public int online(){

        return Listener.count;
    }
}
