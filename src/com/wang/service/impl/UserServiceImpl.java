package com.wang.service.impl;

import com.wang.dao.impl.UserDaoImpl;
import com.wang.momo.PageBean;
import com.wang.momo.User;
import com.wang.service.UserService;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    UserDaoImpl dao = new UserDaoImpl();
    @Override
    public List<User> findAll() {
        //调用dao完成查询
        return dao.findAll();
    }

    @Override
    public User login(String qq, String password) {
        return dao.login(qq,password);
    }

    @Override
    public void adduser(User user) {
        dao.addUser(user);
    }

    /*
    * 根据id删除数据
    * */
    @Override
    public void deleteuser(String userid) {
        dao.delete(Integer.parseInt(userid));
    }
    /*
    * 修改用户信息
    * */
    @Override
    public void updateuser(User user) {
        dao.update(user);
    }
    //通过id查找用户
    @Override
    public User findUserByID(String id) {
        return dao.findUserByID(Integer.parseInt(id));
    }

    @Override
    public void deleteUsers(String[] ids) {
        for (String id:ids) {
            dao.delete(Integer.parseInt(id));
        }
    }

    @Override
    public PageBean<User> findUserByPage(String _current, String _rows, Map<String, String[]> condition) {
        int current = Integer.parseInt(_current);
        _rows = _rows.substring(0, 1);
        System.out.println(_rows + "_");
        int rows = Integer.parseInt(_rows);
        //创建一个PageBean对象
        PageBean<User> pageBean = new PageBean<User>();
        int total = dao.totalCount(condition);
        System.out.println(total);
        pageBean.setTotalCount(total);
        //计算总页码
        if(current <= 0) current = 1;
        int toltalPage = (total % rows == 0) ? (total/rows) :((total/rows) + 1);
        if(toltalPage <= 0) toltalPage = 1;
        pageBean.setTotalPage(toltalPage);
        if(current >= toltalPage)current = toltalPage;
        //计算开始页面
        int start = (current-1)*rows;
        List<User> list = dao.findByPage(start,rows,condition);
        pageBean.setList(list);
        pageBean.setCurrentPage(current);
        pageBean.setRows(rows);
        return pageBean;
    }
}
