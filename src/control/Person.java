package control;

import com.google.gson.Gson;

import java.sql.*;

public class Person {
    private String name = "";
    private String id;
    private String pass;
    private int age = 0;
    private String sex = "";
    private String post = "";
    private String phone = "";
    private String sign = "";

    public Person(String id, String pass) {
        this.id = id;
        this.pass = pass;
    }

    public Person(String id, String pass, String post) {
        this.id = id;
        this.pass = pass;
        this.post = post;
    }

    public Person(String name, String id, String pass, int age, String sex, String post, String phone, String sign) {
        this.name = name;
        this.id = id;
        this.pass = pass;
        this.age = age;
        this.sex = sex;
        this.post = post;
        this.phone = phone;
        this.sign = sign;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String toString(){
        Gson gson = new Gson();
        return gson.toJson(this);
    }

    public static void main(String[] args) {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/person?useUnicode=true&characterEncoding=utf-8";//URL鎸囧悜璁块棶鐨勬暟鎹簱鍚�
        String user = "root";//Mysql閰嶇疆鏃剁殑鐢ㄦ埛鍚�
        String password = "ne822741";//瀵嗙爜
        try {
            Class.forName(driver);//鍔犺浇椹卞姩绋嬪簭
            Connection conn = DriverManager.getConnection(url,user,password);//閾炬帴鏁版嵁搴�
            Statement ststment = conn.createStatement();//鐢ㄦ潵鎵цsql璇█
            String sql = "SELECT * FROM person_info WHERE id = 793360690";
            ResultSet rs = ststment.executeQuery(sql);
            String name;
            String email;
            if(rs.next()){
                name = rs.getString("name");
                email = rs.getString("post");
                int age = rs.getInt("age");
                System.out.println("name:"+name);
                System.out.println("post:"+email);
                System.out.println("age:"+age);
            }
            rs.close();
            conn.close();
        }catch(ClassNotFoundException e){
            System.out.println("No Drive!");
            e.printStackTrace();
        }catch (SQLException e){
            e.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
