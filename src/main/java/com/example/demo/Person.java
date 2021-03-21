package com.example.demo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.temporal.ValueRange;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 * @Auther:hsd
 * @Date:2021/3/20-03-20-17:09
 * @Description:
 * @version: 1.0
 */
public class Person {
    public static ArrayList<Person> arr = new ArrayList<>();
    private String id;
    private String name;
    private String age;
    private String sex;
    private Date birthday;

    public Person() {

    }

    public Person(String id, String name, String age, String sex, Date birthday) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.sex = sex;
        this.birthday = birthday;
    }



    public String getId() {
        return id;
    }

    public boolean setId(String id) {
        if (arr != null){               //判断和已有的对象 id值是否有重复
            for (int i = 0; i < arr.size(); i++) {
                if (arr.get(i).getId().equals(id)){
                    return false;
                }
                this.id = id;
            }
        }
        this.id = id;
        return true;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        if (Integer.parseInt(age) < 18){
            this.age = "18";
        }
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
        return s.format(birthday);
    }

    public void setBirthday(String birthday) {
        String[] arr = birthday.split("-");
        String year = arr[0];
        String month = arr[1];
        String day = arr[2];
        this.birthday =new Date(year+"/"+month+"/"+day);
    }
    public boolean regBirthday(String bth){
        Calendar calendar = Calendar.getInstance();
        long now = calendar.get(Calendar.YEAR);
        calendar.setTime(new Date(bth));
        long befor = calendar.get(Calendar.YEAR);
        long year = now - befor;
        if (year == Long.parseLong(age)){
            return true;
        }else {
            return false;
        }
    }

}
