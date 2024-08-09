package model;

public class LoginModel {
    private String Email;
    private String password;

    public LoginModel(String email, String password) {
        this.Email  = email;
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }
}
