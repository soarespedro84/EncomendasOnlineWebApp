/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.time.LocalDateTime;
import java.util.UUID;

public class ProductBean {
    
    //CONSTANTES
    final int SHORTSTRING = 45;
    final int MEDSTRING = 128;
    final int LONGSTRING = 256;
    
    //ATRIBUTOS
    private UUID _idProduct;
    private String _ref; //SHORTSTRING
    private String _name; //SHORTSTRING
    private String _description; //MEDSTRING
    private String _color; //SHORTSTRING
    private int _initSize;
    private int _finSize;
    private double _price;
    private String _foto; //LONGSTRING
    private int _state;
    private LocalDateTime _dtReg;       
    
    //CONSTRUTORES:
    // carregar da DB
    public ProductBean(UUID _idProduct, String _ref, String _name, String _description, String _color, int _initSize, int _finSize, double _price, String _foto, int _state, LocalDateTime _dtReg) {    
        this._idProduct = _idProduct;
        this._ref = _ref;
        this._name = _name;
        this._description = _description;
        this._color = _color;
        this._initSize = _initSize;
        this._finSize = _finSize;
        this._price = _price;
        this._foto = _foto;
        this._state = _state;
        this._dtReg = _dtReg;
    }
    // criar novo
    public ProductBean() {
        this._idProduct = UUID.randomUUID();
        this._ref = "";
        this._name = "";
        this._description = "";
        this._color = "";
        this._initSize = 0;
        this._finSize = 0;
        this._price = 0;
        this._foto = "";
        this._state = 0;
        this._dtReg = LocalDateTime.now();
    }
    
    //GETTERS
    public UUID getIdProduct() {
        return _idProduct;
    }

    public String getRef() {
        return _ref;
    }

    public String getName() {
        return _name;
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

    public String getFoto() {
        return _foto;
    }
    
    public int getState() {
        return _state;
    }

    public LocalDateTime getDtReg() {
        return _dtReg;
    }

    // SETTERS
    public void setRef(String _ref) {
        if(_ref.length() > SHORTSTRING) _ref = _ref.substring(0, SHORTSTRING);
        this._ref = _ref;
    }

    public void setName(String _name) {
        if(_name.length() > SHORTSTRING) _name = _name.substring(0, SHORTSTRING);
        this._name = _name;
    }
    
    public void setDescription(String _description) {
        if(_description.length() > SHORTSTRING) _description = _description.substring(0, SHORTSTRING);
        this._description = _description;
    }

    public void setColor(String _color) {
        if(_color.length() > SHORTSTRING) _color = _color.substring(0, SHORTSTRING);
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

    public void setFoto(String _foto) {
        if(_foto.length() > LONGSTRING) _foto = _foto.substring(0, LONGSTRING);
        this._foto = _foto;
    }
    
    public void setState(int state) {
        this._state = state;
    }

    
}
