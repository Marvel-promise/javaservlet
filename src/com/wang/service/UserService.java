package com.wang.service;
/*
* 用户管理的业务接口
* */

import com.wang.momo.PageBean;
import com.wang.momo.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    /**
     * 查询所有用户信息
     * @return
     * */
    public List<User> findAll();
    public User login(String qq,String password);
    public void adduser(User user);
    public void deleteuser(String userid);
    public void updateuser(User user);

    public User findUserByID(String id);
    /**
     * 批量删除
     * */
    public void deleteUsers(String[] ids);
    /**
     * 分页条件查询
     * */
    PageBean<User> findUserByPage(String _current, String _rows, Map<String, String[]> condition);
}
