
package Models;

import java.time.LocalDateTime;
import java.util.*;

public class UserBean {

    private UUID _idUser;
    private String _name;
    private String _company;
    private String _email;
    private int _permission;
    private int _state;
    private LocalDateTime _dtReg;           

    public UserBean(UUID _idUser, String _name, String _company, String _email, int _permission, int _state, LocalDateTime _dtReg) {
        this._idUser = _idUser;
        this._name = _name;
        this._company = _company;
        this._email = _email;
        this._permission = _permission;
        this._state = _state;
        this._dtReg = _dtReg;
    }

    //Constructors
    public UserBean(UUID _idUser, String _name, String _email, int _permission, int _state, LocalDateTime _dtReg) {
        this._idUser = _idUser;
        this._name = _name;
        this._email = _email;
        this._permission = _permission;
        this._state = _state;
        this._dtReg = _dtReg;
    }       
    
// métodos   
    public UUID getIdUser() {
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

    public int getPhone() {
        return _permission;
    }

    public int getState() {
        return _state;
    }

    public LocalDateTime getDtReg() {
        return _dtReg;
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

    public void setPhone(int _permission) {
        this._permission = _permission;
    }

    public void setState(int _state) {
        this._state = _state;
    }

       

 
    public String addUser(){
        
        return _idUser.toString();
    }
    
}
