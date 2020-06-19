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
public class SizeQtdBean {
    
    //ATRIBUTOS
    private int _size;
    private int _qtd;
    
    //CONSTRUTORES:
    // carregar da DB
    public SizeQtdBean(int _size, int _qtd) {
        this._size = _size;
        this._qtd = _qtd;
    }
    // criar novo
    public SizeQtdBean() {
        this._size = 0;
        this._qtd = 0;
    }
    
    //GETTERS
    public int getSize() {
        return _size;
    }

    public int getQtd() {
        return _qtd;
    }
    
    // SETTERS
    public void setSize(int _size) {
        this._size = _size;
    }

    public void setQtd(int _qtd) {
        this._qtd = _qtd;
    }        
    
}
