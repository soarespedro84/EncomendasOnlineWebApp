/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.time.LocalDateTime;
import java.util.*;

/**
 *
 * @author psoar
 */
public class MovementBean {
    
    private UUID _idMovement;
    private UserBean _user;
    private CompanyBean _cliente;
    private LocalDateTime _dtMovement;
    private ArrayList<ItemBean> _lstItems;
    private int _state;
    private LocalDateTime _dtReg;

    public MovementBean(UUID _idMovement, UserBean _user, CompanyBean _cliente, LocalDateTime _dtMovement, ArrayList<ItemBean> _lstItems, int state, LocalDateTime dtReg) {
        this._idMovement = _idMovement;
        this._user = _user;
        this._cliente = _cliente;
        this._dtMovement = _dtMovement;
        this._lstItems = _lstItems;
        this._state = state;
        this._dtReg = dtReg;
    }
    
    public MovementBean(){
        
    }
    

    public UUID getIdMovement() {
        return _idMovement;
    }

    public UserBean getUser() {
        return _user;
    }

    public CompanyBean getCliente() {
        return _cliente;
    }

    public LocalDateTime getDtMovement() {
        return _dtMovement;
    }

    public ArrayList<ItemBean> getLstItems() {
        return _lstItems;
    }

    public int getState() {
        return _state;
    }

    public LocalDateTime getDtReg() {
        return _dtReg;
    }

   
    public void setUser(UserBean _user) {
        this._user = _user;
    }

    public void setCliente(CompanyBean _cliente) {
        this._cliente = _cliente;
    }

    public void setDtMovement(LocalDateTime _dtMovement) {
        this._dtMovement = _dtMovement;
    }

    public void setLstItems(ArrayList<ItemBean> _lstItems) {
        this._lstItems = _lstItems;
    }

    public void setState(int state) {
        this._state = state;
    }

    
}
