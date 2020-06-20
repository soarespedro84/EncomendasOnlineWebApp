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
public class ProductBean {
    private UUID _idProduct;
    private String _ref;
    private String _description;
    private String _color;
    private int _initSize;
    private int _finSize;
    private double _price;
    private int state;
    private LocalDateTime _dtReg;       

    public ProductBean(UUID _idProduct, String _ref, String _description, String _color, int _initSize, int _finSize, double _price, int state, LocalDateTime _dtReg) {
        this._idProduct = _idProduct;
        this._ref = _ref;
        this._description = _description;
        this._color = _color;
        this._initSize = _initSize;
        this._finSize = _finSize;
        this._price = _price;
        this.state = state;
        this._dtReg = _dtReg;
    }

    public UUID getIdProduct() {
        return _idProduct;
    }

    public String getRef() {
        return _ref;
    }

    public String getDescription() {
        return _description;
    }

    public String getColor() {
        return _color;
    }

    public int getInitSize() {
        return _initSize;
    }

    public int getFinSize() {
        return _finSize;
    }

    public double getPrice() {
        return _price;
    }

    public int getState() {
        return state;
    }

    public LocalDateTime getDtReg() {
        return _dtReg;
    }


    public void setRef(String _ref) {
        this._ref = _ref;
    }

    public void setDescription(String _description) {
        this._description = _description;
    }

    public void setColor(String _color) {
        this._color = _color;
    }

    public void setInitSize(int _initSize) {
        this._initSize = _initSize;
    }

    public void setFinSize(int _finSize) {
        this._finSize = _finSize;
    }

    public void setPrice(double _price) {
        this._price = _price;
    }

    public void setState(int state) {
        this.state = state;
    }

    

    
}
