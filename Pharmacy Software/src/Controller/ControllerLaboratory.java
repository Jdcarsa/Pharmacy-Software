/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DataBase.executeProcedure;
import DataBase.executeSmtDb;
import Model.Laboratory;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author ideapad330S
 */
public class ControllerLaboratory {

    public ControllerLaboratory() {
    }
    
    
        public void getAllLaboratory(DefaultTableModel model) throws ClassNotFoundException, SQLException{
        executeSmtDb exc =  new executeSmtDb();
        exc.executeSmtSelect("SELECT  idLaboratory, nameLaboratory, address , phone"
                + " FROM pharmacy.Laboratory WHERE stateLaboratory = 'Active' " , model);
    }
    
     public void searchLaboratory(DefaultTableModel model , String name)throws ClassNotFoundException, SQLException{
          executeSmtDb exc =  new executeSmtDb();
          exc.executeSmtSelect("SELECT  idLaboratory, nameLaboratory, address , phone "
                + " FROM pharmacy.Laboratory WHERE nameLaboratory LIKE" +"'%"+name+"%'" + "AND  stateLaboratory = 'Active' " , model);
    }
     
         public void registerLaboratory(Laboratory lab) throws ClassNotFoundException, SQLException{
        executeProcedure exc = new executeProcedure();
        String values = "' \\'"+ lab.getName() + "\\'"  +" , \\'"+ lab.getAddress()+ "\\'"+ " , \\'"+ lab.getPhone()+ "\\'"
                +", \\'"+ lab.getStateLaboratory()+ "\\' ' " ;
        if(exc.executeInsertProcedure("'Laboratory'", "'nameLaboratory, address , phone, stateLaboratory'",values)){
             JOptionPane.showMessageDialog(null, "Registered Laboratory");
        }
    }
}
