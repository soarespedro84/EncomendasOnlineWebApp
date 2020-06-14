
package Models;

import java.time.LocalDateTime;

public class UserBean {

    private String _idUser;
    private String _name;
    private String _company;
    private String _email;
    private int _permission;
    private int _state;
    private LocalDateTime _dtReg;
    private String _password;

    public UserBean(String _idUser, String _name, String _company, String _email, int _permission, int _state, /*LocalDateTime _dtReg,*/ String _password) {
        this._idUser = _idUser;
        this._name = _name;
        this._company = _company;
        this._email = _email;
        this._permission = _permission;
        this._state = _state;
        //this._dtReg = _dtReg;
        this._password=_password;
    }
    
    
    public UserBean(){
        
    }
    
    public String getIdUser() {
        return _idUser;
    }

    public String getName() {
        return _name;
    }

    public String getCompany() {
        return _company;
    }

    public String getEmail() {
        return _email;
    }

    public int getPermission() {
        return _permission;
    }

    public int getState() {
        return _state;
    }

    public LocalDateTime getDtReg() {
        return _dtReg;
    }

    public String getPassword() {
        return _password;
    }
    
        
    public void setName(String _name) {
        this._name = _name;
    }

    public void setCompany(String _company) {
        this._company = _company;
    }

    public void setEmail(String _email) {
        this._email = _email;
    }

    public void setPermission(int _permission) {
        this._permission = _permission;
    }

    public void setState(int _state) {
        this._state = _state;
    }

    public void setPassword(String _password) {
        this._password = _password;
    }    
       
    public String addUser(){
        
        return _idUser;
    }
    
}
