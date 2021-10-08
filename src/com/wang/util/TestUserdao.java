package com.wang.util;

import com.wang.dao.UserDao;
import com.wang.dao.impl.UserDaoImpl;
import org.junit.Test;

import java.util.List;

public class TestUserdao {
    @Test
    public void test_search(){
        List list = new UserDaoImpl().search("张三","北京",null);
        System.out.println(list);
    }
    @Test
    public void testfindall(){
        System.out.println(new UserDaoImpl().findAll());
    }
    @Test
    public void testlogin(){
        System.out.println(new UserDaoImpl().login("1111211","12314"));
    }
}
