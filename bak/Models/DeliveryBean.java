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
    
    //CONSTANTES
    final int SHORTSTRING = 45;
    final int MEDSTRING = 128;
    final int LONGSTRING = 256;
    
    //ATRIBUTOS
    private String _nrDelNote; //SHORTSTRING
    private MovementBean _order;
    private String _docs; //LONGSTRING
    
    //CONSTRUTORES:
    // carregar da DB
    public DeliveryBean(String _nrDelNote, MovementBean _order, String _docs) {
        this._nrDelNote = _nrDelNote;
        this._order = _order;
        this._docs = _docs;
    }
    // criar novo
    public DeliveryBean() {
        this._nrDelNote = "";
        this._order = new MovementBean();
        this._docs = "";
    }
    
    //GETTERS
    public String getNrDelNote() {
        return _nrDelNote;
    }

    public MovementBean getOrder() {
        return _order;
    }

    public String getDocs() {
        return _docs;
    }
    
    //SETTERS
    public void setNrDelNote(String _nrDelNote) {
        if(_nrDelNote.length() > SHORTSTRING) _nrDelNote = _nrDelNote.substring(0, SHORTSTRING);
        this._nrDelNote = _nrDelNote;
    }

    public void setOrder(MovementBean _order) {
        this._order = _order;
    }

    public void setDocs(String _docs) {
        if(_docs.length() > LONGSTRING) _docs = _docs.substring(0, LONGSTRING);
        this._docs = _docs;
    }
    
    
    
}
