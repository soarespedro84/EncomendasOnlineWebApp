
package Models;

import java.time.LocalDateTime;
import java.util.UUID;

public class UserBean {
    

    //CONSTANTES
    final int SHORTSTRING = 45;
    final int MEDSTRING = 128;
    final int LONGSTRING = 256;
    
    //ATRIBUTOS
    private UUID _idUser;
    private String _name; //MEDSTRING
    private CompanyBean _company;
    private String _email; //MEDSTRING
    private int _permission;
    private int _state;
    private LocalDateTime _dtReg;
    private String _password; //MEDSTRING
    
    //CONSTRUTORES:
    // carregar da DB
    public UserBean(UUID _idUser, String _name, CompanyBean _company, String _email, int _permission, int _state, LocalDateTime _dtReg, String _password) {
        this._idUser = _idUser;
        this._name = _name;
        this._company = _company;
        this._email = _email;
        this._permission = _permission;
        this._state = _state;
        this._dtReg = _dtReg;
        this._password=_password;
    }
    // criar novo
    public UserBean() {
        this._idUser = UUID.randomUUID();
        this._name = "";
        this._company = new CompanyBean();
        this._email = "";
        this._permission = 0;
        this._state = 0;
        this._dtReg = LocalDateTime.now();
        this._password="";
    }
    
    //GETTERS
    public UUID getIdUser() {
        return _idUser;
    }

    public String getName() {
        return _name;
    }

    public CompanyBean getCompany() {
        return _company;
    }

    public String getEmail() {
        return _email;
    }

    public int getPermission() {
        return _permission;
    }
    
    public String getPermissionStr(int _permission){
        String permStr="";
        switch (_permission) {
            case 1:
                permStr= "User";
                break;
            case 2:
                permStr="Comercial";
                break;
            case 5: 
                permStr="Admin";
                break;
            default:
                permStr="Convidado";
        }        
        return permStr;
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
    
    
    // SETTERS
    public void setName(String _name) {
        if(_name.length() > MEDSTRING) _name = _name.substring(0, MEDSTRING);
        this._name = _name;
    }

    public void setCompany(CompanyBean _company) {
        this._company = _company;
    }

    public void setEmail(String _email) {
        if(_email.length() > MEDSTRING) _email = _email.substring(0, MEDSTRING);
        this._email = _email;
    }

    public void setPermission(int _permission) {
        this._permission = _permission;
    }

    public void setState(int _state) {
        this._state = _state;
    }

    public void setPassword(String _password) {
        if(_password.length() > MEDSTRING) _password = _password.substring(0, MEDSTRING);
        this._password = _password;
    }  
       
  
    
}
