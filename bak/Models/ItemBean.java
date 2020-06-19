/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.ArrayList;


public class ItemBean {
    
    //ATRIBUTOS
    private ProductBean _product;
    private ArrayList<SizeQtdBean> _lstSizes;
    
    //CONSTRUTORES:
    // carregar da DB
    public ItemBean(ProductBean _product, ArrayList<SizeQtdBean> _lstSizes) {
        this._product = _product;
        this._lstSizes = _lstSizes;
    }
    // criar novo
    public ItemBean() {
        this._product =  new ProductBean();
        this._lstSizes = new ArrayList<SizeQtdBean>();
    }

    //GETTERS
    public ProductBean getProduct() {
        return _product;
    }

    public ArrayList<SizeQtdBean> getLstSizes() {
        return _lstSizes;
    }
    
    // SETTERS
    public void setProduct(ProductBean _product) {
        this._product = _product;
    }

    public void setLstSizes(ArrayList<SizeQtdBean> _lstSizes) {
        this._lstSizes = _lstSizes;
    }

}
