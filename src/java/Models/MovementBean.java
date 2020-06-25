/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.time.LocalDateTime;
import java.util.*;

public class MovementBean {
    
    //CONSTANTES
    final int SHORTSTRING = 45;
    final int MEDSTRING = 128;
    final int LONGSTRING = 256;
    
    //ATRIBUTOS
    private UUID _idMovement;
    private CompanyBean _cliente;
    private ArrayList<ItemBean> _lstItems;
    private int _state;
    private LocalDateTime _dtReg;
    
    //CONSTRUTORES:
    // carregar da DB
    public MovementBean(UUID _idMovement, CompanyBean _cliente, int state, LocalDateTime dtReg) {
        this._idMovement = _idMovement;
        this._cliente = _cliente;
        this._lstItems = new ArrayList<ItemBean>();
        this._state = state;
        this._dtReg = dtReg;
    }
    // criar novo
    public MovementBean() {
        this._idMovement = UUID.randomUUID();
        this._cliente = new CompanyBean();
        this._lstItems = new ArrayList<ItemBean>();
        this._state = 0;
        this._dtReg = LocalDateTime.now();
    }
    
    public MovementBean(CompanyBean _cliente, ArrayList<ItemBean> _lstItems) {
        this._idMovement = UUID.randomUUID();
        this._cliente = _cliente;
        this._lstItems = _lstItems;
        this._state = 0;
        this._dtReg = LocalDateTime.now();
    }
    
    //GETTERS
    public UUID getIdMovement() {
        return _idMovement;
    }

    public CompanyBean getCliente() {
        return _cliente;
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
   
    //SETTERS
    public void setCliente(CompanyBean _cliente) {
        this._cliente = _cliente;
    }

    public void setLstItems(ArrayList<ItemBean> _lstItems) {
        this._lstItems = _lstItems;
    }

    public void setState(int state) {
        this._state = state;
    }
    
    public int getTotalQtd(){
        int totalQtd=0;
        for (ItemBean _lstItem : _lstItems) {
            totalQtd+=_lstItem.getQtdTotal();
        }
        return totalQtd;
    }
    
    public double getTotalAmount(){
        double totalAmount=0.0;
        for (ItemBean _lstItem : _lstItems) {
            totalAmount += _lstItem.getAmountTotal();
        }
        
        return totalAmount;
    }
    
}
