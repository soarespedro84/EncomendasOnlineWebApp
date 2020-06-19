/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.ArrayList;
import java.util.Optional;


public class ItemBean {
    
    //ATRIBUTOS
    protected ProductBean _product;
    protected ArrayList<SizeQtdBean> _lstSizes;
    
    //CONSTRUTORES:
    // carregar da DB
    public ItemBean(ProductBean _product, ArrayList<SizeQtdBean> _lstSizes) {
        this._product = _product;
        this._lstSizes = _lstSizes;
    }
    // criar novo
    public ItemBean(ProductBean _product) {
        this._product = _product;
        this._lstSizes = new ArrayList<SizeQtdBean>();
    }
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
    
    //SETTERS
    public void setProduct(ProductBean _product) {
        this._product = _product;
    }

    public void setLstSizes(ArrayList<SizeQtdBean> _lstSizes) {
        this._lstSizes = _lstSizes;
    }
    
    //OTHER
    public void addSize(SizeQtdBean sizeQtdBean){
        this._lstSizes.add(sizeQtdBean);
    }
    
    public int getQtdTotal(){
        int total = 0;
        for (SizeQtdBean size : _lstSizes) {
            total += size.getQtd();
        }
        return total;
    }
    
    public double getAmountTotal(){
        double amount = 0;
        for (SizeQtdBean size : _lstSizes) {
            amount += (double)(size.getQtd() * _product.getPrice());
        }
        return amount;
    }
    
    public SizeQtdBean getQtdBySize(int sizeSearch){        
        //return _lstSizes.stream().filter(size -> size.getSize() == sizeSearch).findFirst().get();
        for (SizeQtdBean size : _lstSizes) {
            if(size.getSize() == sizeSearch) return size;
        }
        return null;
    }
}
