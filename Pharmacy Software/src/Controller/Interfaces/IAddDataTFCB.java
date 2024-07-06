/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Controller.Interfaces;

import java.sql.SQLException;
import javax.swing.JComboBox;
import javax.swing.JTextField;

/**
 *
 * @author ideapad330S
 */
public interface IAddDataTFCB {
    
    public void addDataTFCB(String id, JTextField[] textFields , JComboBox[] cbs)  throws ClassNotFoundException, SQLException ;
}
