/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author baqua
 */
public class User_Info {
    private int id, user_id;
    private String avatar, fullname, email, phone;
    private boolean gender;
    private Date birth;
    private double acc_money;
    private List<Integer> movieOwn;

    public User_Info() {
    }

    public User_Info(int id, int user_id, String avatar, String fullname, String email, String phone, boolean gender, Date birth, double acc_money, List<Integer> movieOwn) {
        this.id = id;
        this.user_id = user_id;
        this.avatar = avatar;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.birth = birth;
        this.acc_money = acc_money;
        this.movieOwn = movieOwn;
    }

    public User_Info(int id, double acc_money) {
        this.id = id;
        
        this.acc_money = acc_money;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public double getAcc_money() {
        return acc_money;
    }

    public void setAcc_money(double acc_money) {
        this.acc_money = acc_money;
    }

    public List<Integer> getMovieOwn() {
        return movieOwn;
    }

    public void setMovieOwn(List<Integer> movieOwn) {
        this.movieOwn = movieOwn;
    }
    
    
}
