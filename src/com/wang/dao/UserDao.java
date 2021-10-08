package com.wang.dao;
import com.wang.momo.User;

import java.util.List;
import java.util.Map;

/**
 *
 * 用户操作的DAO
 * */

public interface UserDao {
    public List<User> findAll();
    public User login(String qq,String password);
    public void addUser(User user);
    public void delete(int userid);
    public void update(User user);
    public User findUserByID(int id);
    public int totalCount(Map<String, String[]> condition);
    public List<User> findByPage(int start, int rows, Map<String, String[]> condition);
}
