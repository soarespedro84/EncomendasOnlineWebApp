/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author psoar
 */
public class DeliveryBean extends MovementBean{
    
    private String _nrDelNote;
    private MovementBean _order;
    private String _docs;
    
    
    public DeliveryBean(String _nrDelNote, MovementBean _order, String _docs) {
        this._nrDelNote = _nrDelNote;
        this._order = _order;
        this._docs = _docs;
    }

    public String getNrDelNote() {
        return _nrDelNote;
    }

    public MovementBean getOrder() {
        return _order;
    }

    public String getDocs() {
        return _docs;
    }

    public void setNrDelNote(String _nrDelNote) {
        this._nrDelNote = _nrDelNote;
    }

    public void setOrder(MovementBean _order) {
        this._order = _order;
    }

    public void setDocs(String _docs) {
        this._docs = _docs;
    }
    
    
    
}
