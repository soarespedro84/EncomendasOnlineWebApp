/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 *
 * @author psoar
 */
public class CompanyBean {
    
    private UUID _idCompany;
    private String _companyName;
    private String _nif;
    private String _address;
    private String _phone;
    private int _state;
    private LocalDateTime _dtReg;           

    public CompanyBean(UUID _idCompany, String _companyName, String _nif, String _address, String _phone, int _state, LocalDateTime _dtReg) {
        this._idCompany = _idCompany;
        this._companyName = _companyName;
        this._nif = _nif;
        this._address = _address;
        this._phone = _phone;
        this._state = _state;
        this._dtReg = _dtReg;
    }
    
   public CompanyBean() {
        this._idCompany = UUID.randomUUID();
        this._companyName = _companyName;
        this._nif = _nif;
        this._address = _address;
        this._phone = _phone;
        this._state = _state;
        this._dtReg = _dtReg;
    }

    public UUID getIdCompany() {
        return _idCompany;
    }

    public String getCompanyName() {
        return _companyName;
    }

    public String getNif() {
        return _nif;
    }

    public String getAddress() {
        return _address;
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

    public void setIdCompany(UUID _idCompany) {
        this._idCompany = _idCompany;
    }

    public void setCompanyName(String _companyName) {
        this._companyName = _companyName;
    }

    public void setNif(String _nif) {
        this._nif = _nif;
    }

    public void setAddress(String _address) {
        this._address = _address;
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

    
}
