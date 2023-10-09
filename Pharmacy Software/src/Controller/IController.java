/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Controller;


import java.sql.SQLException;
import javax.swing.JComboBox;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author ideapad330S
 */
public interface IController {


    void addIdCb(JComboBox cb) throws ClassNotFoundException, SQLException;

    void disable(String id) throws ClassNotFoundException, SQLException;

    void getAll(DefaultTableModel model) throws ClassNotFoundException, SQLException;

    void register(Object o) throws ClassNotFoundException, SQLException;

    void search(DefaultTableModel model, String name) throws ClassNotFoundException, SQLException;

    void update(Object o) throws ClassNotFoundException, SQLException;
    
}
