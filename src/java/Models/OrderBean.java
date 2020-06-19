/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.time.LocalDateTime;


public class OrderBean extends MovementBean {
    
    //CONSTANTES
    final int SHORTSTRING = 45;
    final int MEDSTRING = 128;
    final int LONGSTRING = 256;
    
    //ATRIBUTOS
    private UserBean _user;
    private LocalDateTime _dtDelivery;
    private String _nrCliente; //SHORTSTRING
    
    //CONSTRUTORES:
    // carregar da DB
    public OrderBean(UserBean _user, LocalDateTime _dtDelivery, String _nrCliente) {
        this._user = _user;
        this._dtDelivery = _dtDelivery;
        this._nrCliente = _nrCliente;
    }
    // criar novo
    public OrderBean() {
        this._user = new UserBean();
        this._dtDelivery = LocalDateTime.now();
        this._nrCliente = _nrCliente;
    }
    
    //GETTERS    
    public UserBean getUser() {
        return _user;
    }

    public LocalDateTime getDtDelivery() {
        return _dtDelivery;
    }

    public String getNrCliente() {
        return _nrCliente;
    }
    
    //SETTERS    
    public void setUser(UserBean _user) {
        this._user = _user;
    }

    public void setDtDelivery(LocalDateTime _dtDelivery) {
        if(_dtDelivery.isBefore(LocalDateTime.now())) _dtDelivery = LocalDateTime.now(); //Preenchido por cliente
        this._dtDelivery = _dtDelivery;
    }

    public void setNrCliente(String nrCliente) {
        if(nrCliente.length() > SHORTSTRING) nrCliente = nrCliente.substring(0, SHORTSTRING);
        this._nrCliente = nrCliente;
    }
    
    
}
