/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DataBase.executeSmtDb;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author ideapad330S
 */
public class ControllerProduct {
    
    
    public ControllerProduct(){
    }
    
    
   
    
    public void getAllProducts(DefaultTableModel model) throws ClassNotFoundException, SQLException{
        executeSmtDb exc =  new executeSmtDb();
        exc.executeSmtSelect("SELECT  idProduct , descriptionProduct, concentration , stock ,"
                + "salePrice , expirationDate FROM pharmacy.product WHERE statusProduct = 'Active' " , model);
    }
    
     public void searchProducts(DefaultTableModel model , String name)throws ClassNotFoundException, SQLException{
          executeSmtDb exc =  new executeSmtDb();
         exc.executeSmtSelect("SELECT  idProduct , descriptionProduct , concentration , stock ,"
                + "salePrice  , expirationDate FROM pharmacy.product WHERE statusProduct = 'Active' "
                 + " and descriptionProduct LIKE " +"'%"+name+"%'" , model);
    }
}
