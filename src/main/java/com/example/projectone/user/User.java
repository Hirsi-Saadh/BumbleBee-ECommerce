package com.example.projectone.user;

public class User {
    private int id;
    private String username;

    private String address;

    private String phone;

    private String email;
    private String password;






    public User(String username, String address, String phone, String email, String password) {

        this.username = username;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.password = password;

    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }
}
