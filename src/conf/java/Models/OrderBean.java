/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.time.LocalDateTime;

/**
 *
 * @author psoar
 */
public class OrderBean extends MovementBean {
    private LocalDateTime _dtDelivery;
    private String _nrCliente;

    public OrderBean(LocalDateTime _dtDelivery, String _nrCliente) {
        this._dtDelivery = _dtDelivery;
        this._nrCliente = _nrCliente;
    }

    public LocalDateTime getDtDelivery() {
        return _dtDelivery;
    }

    public String getNrCliente() {
        return _nrCliente;
    }

    public void setDtDelivery(LocalDateTime _dtDelivery) {
        this._dtDelivery = _dtDelivery;
    }

    public void setNrCliente(String nrCliente) {
        this._nrCliente = nrCliente;
    }
    
    
}
