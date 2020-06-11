
package Models;

import java.time.LocalDateTime;

public class UserBean {

    private String _idUser;
    private String _name;
    private String _company;
    private String _email;
    private String _phone;
    private int _state;
    private LocalDateTime _dtReg;           

    public UserBean(String _idUser, String _name, String _company, String _email, String _phone, int _state, LocalDateTime _dtReg) {
        this._idUser = _idUser;
        this._name = _name;
        this._company = _company;
        this._email = _email;
        this._phone = _phone;
        this._state = _state;
        this._dtReg = _dtReg;
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

    public String getPhone() {
        return _phone;
    }

    public int getState() {
        return _state;
    }

    public LocalDateTime getDtReg() {
        return _dtReg;
    }

    public void setIdUser(String _idUser) {
        this._idUser = _idUser;
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

    public void setPhone(String _phone) {
        this._phone = _phone;
    }

    public void setState(int _state) {
        this._state = _state;
    }

    public void setDtReg(LocalDateTime _dtReg) {
        this._dtReg = _dtReg;
    }
    
    
    public String addUser(){
        
        return _idUser;
    }
    
}
