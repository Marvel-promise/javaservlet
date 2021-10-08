package com.wang.dao.impl;
import com.wang.dao.UserDao;
import com.wang.momo.User;
import com.wang.util.JDBCutil;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class UserDaoImpl implements UserDao {
//    private UserDao dao= new UserDaoImpl();
    String sql = null;
    //操作数据库的user表
    //声明JDBCTemplate对象共用
    private JdbcTemplate template = new JdbcTemplate(JDBCutil.getDataSource());
    public List<User> search(String username, String locate, String emil) {
        String sql;
        sql = "select * from user where 1=1";
        if (username != null)
            sql = sql + " and username = \"" +username +"\"";
        if (locate != null)
            sql = sql + " and userlocate = \"" +locate + "\"";
        if (emil != null)
            sql+=sql + " and emil = \""+ emil+ "\"";
        List<User> users = template.query(sql,new BeanPropertyRowMapper<>(User.class));
        return users;
    }
    @Override
    public List<User> findAll() {
        //使用JDBC操作数据库。。。
        //定义数据库
        String sql = "select * from user";
        List<User> users = template.query(sql, new BeanPropertyRowMapper<User>(User.class));
        return users;
    }

    @Override
    public User login(String qq, String password) {
        try{
            String sql = "select * from user where qq= ? and password= ?";
            User user = template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),qq,password);
            return user;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void addUser(User user) {
        //定义sql
        String sql = "insert into user values(null,?,?,?,?,?,?,\"49939\")";
        //执行sql
        template.update(sql,user.getUsername(),user.getUsersex(),
                user.getUserage(),user.getUserlocate(),user.getQq(),user.getEmil());

    }

    @Override
    public void delete(int userid) {
        String sql = "delete from user where userid = ?";
        template.update(sql,userid);
    }

    @Override
    public void update(User user) {
        String sql = "update user set username=?,usersex=?,userage=?,userlocate=?,emil=? where userid = ?";
        template.update(sql,user.getUsername(),user.getUsersex(),
                user.getUserage(),user.getUserlocate(),user.getEmil(),user.getUserid());
    }

    @Override
    public User findUserByID(int id) {
        String sql = "select * from user where userid= ?";
        User user = (User) template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),id);
        return user;
    }

    @Override
    public int totalCount(Map<String, String[]> condition) {
        //定义模板sql
        sql = "select count(*) from user where 1 = 1 ";
        List<Object> params = this.get_sql(condition,sql);
        return template.queryForObject(sql,Integer.class,params.toArray());
    }
    @Override
    public List<User> findByPage(int start, int rows, Map<String, String[]> condition) {
        //sql语句查询分页
        sql = "select * from user where 1 = 1 ";
        List<Object> params = this.get_sql(condition,sql);
        StringBuilder stringBuilder = new StringBuilder(sql);
        stringBuilder.append(" limit ? , ? ");
        params.add(start);
        params.add(rows);
        System.out.println(params);
        System.out.println(stringBuilder);
        return template.query(stringBuilder.toString(), new BeanPropertyRowMapper<User>(User.class), params.toArray());
    }
    public List<Object> get_sql(Map<String, String[]> condition,String sql){
        //遍历集合，看对应的是否有值
        StringBuilder stringBuilder = new StringBuilder(sql);
        //遍历map集合
        Set<String> keyset = condition.keySet();
        //存储key对应的值
        List<Object> params = new ArrayList<Object>();
        for (String key:keyset) {
            //过滤掉其他的键值对，只保留条件查询的键值对
            if("username".equals(key) ||"userlocate".equals(key) ||"emil".equals(key)){
                String value = condition.get(key)[0];
                //判断是否有值
                if (value != null && !"".equals(value)){
                    stringBuilder.append(" and "+key+" like ? ");
                    params.add(" %"+value+"% ");//条件的值
                }
            }
        }
        this.sql = stringBuilder.toString();
        return params;
    }
}
