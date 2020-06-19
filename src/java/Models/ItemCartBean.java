/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.ArrayList;
import java.util.UUID;

public class ItemCartBean extends ItemBean {
    
    //ATRIBUTOS
    private UUID _idItemCart;
    private UserBean _user;

    //CONSTRUTORES:
    public ItemCartBean(UUID _idItemCart, UserBean _user, ProductBean _product, ArrayList<SizeQtdBean> _lstSizes) {
        super(_product, _lstSizes);
        this._user = _user;
        this._idItemCart = _idItemCart;
    }
    
    public ItemCartBean(UUID _idItemCart, UserBean _user, ProductBean _product) {
        super(_product);
        this._user = _user;
        this._idItemCart = _idItemCart;
    }
    
    public ItemCartBean(UserBean _user, ProductBean _product, ArrayList<SizeQtdBean> _lstSizes) {
        super(_product, _lstSizes);
        this._user = _user;
        this._idItemCart = UUID.randomUUID();
    }
    
    public ItemCartBean(UserBean _user, ProductBean _product) {
        super(_product);
        this._user = _user;
        this._idItemCart = UUID.randomUUID();
    }
    
    public ItemCartBean() {
        this._user = new UserBean();
        this._idItemCart = UUID.randomUUID();
    }
    
    
    //GETTERS    
    public UUID getIdItemCart() {
        return _idItemCart;
    }
    
    public UserBean getUser() {
        return _user;
    }
    
    //SETTERS    
    public void setUser(UserBean _user) {
        this._user = _user;
    }

    public void setIdItemCart(UUID _idItemCart) {
        this._idItemCart = _idItemCart;
    }
    
}
