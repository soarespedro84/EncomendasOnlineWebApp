/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.UUID;


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
    //Add Order
    public OrderBean(UserBean _user, LocalDateTime _dtDelivery, String _nrCliente, CompanyBean _cliente, ArrayList<ItemBean> _lstItems) {
        super(_cliente, _lstItems);
        this._user = _user;
        this._dtDelivery = _dtDelivery;
        this._nrCliente = _nrCliente;
    }
    //Ler da BD
    public OrderBean(UserBean _user, LocalDateTime _dtDelivery, String _nrCliente, UUID _idMovement, CompanyBean _cliente, ArrayList<ItemBean> _lstItems, int state, LocalDateTime dtReg) {
        super(_idMovement, _cliente, _lstItems, state, dtReg);
        this._user = _user;
        this._dtDelivery = _dtDelivery;
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
