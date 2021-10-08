package com.wang.momo;

public class User {
    private int userid;
    private String username;
    private String usersex;
    private int userage;
    private String userlocate;
    private String qq;
    private String emil;
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getQq() {
        return qq;
    }
    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", usersex='" + usersex + '\'' +
                ", userage=" + userage +
                ", userlocate='" + userlocate + '\'' +
                ", qq='" + qq + '\'' +
                ", emil='" + emil + '\'' +
                '}';
    }
    public String getUsersex() {
        return usersex;
    }
    public void setUsersex(String usersex) {
        this.usersex = usersex;
    }
    public int getUserage() {
        return userage;
    }
    public void setUserage(int userage) {
        this.userage = userage;
    }
    public String getUserlocate() {
        return userlocate;
    }
    public void setUserlocate(String userlocate) {
        this.userlocate = userlocate;
    }
    public void setQq(String qq) {
        this.qq = qq;
    }
    public String getEmil() {
        return emil;
    }
    public void setEmil(String emil) {
        this.emil = emil;
    }
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

}
