/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package UI;

import Controller.ControllerHistoryPatient;
import Controller.ControllerProduct;
import Controller.Interfaces.IFindData;
import Model.Util;
import UI.Crud.Search.SearchProducts;
import UI.Doctor.Options.HistoryPatient;
import UI.Doctor.Options.RegisterPatient;
import UI.Doctor.Options.SearchHistoryPatient;
import java.awt.Color;
import javax.swing.ImageIcon;

/**
 *
 * @author ideapad330S
 */
public class DoctorUI extends javax.swing.JFrame {
    
    public boolean existsPanel = false;
    private IFindData find;
    
    public DoctorUI() {
        initComponents();
        this.setExtendedState(MAXIMIZED_BOTH);
        ImageIcon icon = new ImageIcon("C:\\Users\\ideapad330S\\Documents\\NetBeansProjects"
                + "\\Pharmacy Software\\src\\UI\\Images\\Icono.png");
        this.setIconImage(icon.getImage());
    }


    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel2 = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        productsBtn = new javax.swing.JButton();
        patientsBtn = new javax.swing.JButton();
        salesBtn1 = new javax.swing.JButton();
        patientsBtn1 = new javax.swing.JButton();
        jDesktopPane1 = new javax.swing.JDesktopPane();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel2.setBackground(new java.awt.Color(238, 231, 231));

        jPanel1.setBackground(new java.awt.Color(51, 153, 255));

        productsBtn.setBackground(new java.awt.Color(255, 255, 255));
        productsBtn.setFont(new java.awt.Font("Berlin Sans FB", 0, 24)); // NOI18N
        productsBtn.setForeground(new java.awt.Color(255, 255, 255));
        productsBtn.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-pills-32.png"))); // NOI18N
        productsBtn.setText("Medicines");
        productsBtn.setContentAreaFilled(false);
        productsBtn.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        productsBtn.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        productsBtn.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                productsBtnMouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                productsBtnMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                productsBtnMouseExited(evt);
            }
        });
        productsBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                productsBtnActionPerformed(evt);
            }
        });

        patientsBtn.setBackground(new java.awt.Color(255, 255, 255));
        patientsBtn.setFont(new java.awt.Font("Berlin Sans FB", 0, 24)); // NOI18N
        patientsBtn.setForeground(new java.awt.Color(255, 255, 255));
        patientsBtn.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-patients-32.png"))); // NOI18N
        patientsBtn.setText("Patients");
        patientsBtn.setContentAreaFilled(false);
        patientsBtn.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        patientsBtn.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        patientsBtn.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                patientsBtnMouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                patientsBtnMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                patientsBtnMouseExited(evt);
            }
        });
        patientsBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                patientsBtnActionPerformed(evt);
            }
        });

        salesBtn1.setBackground(new java.awt.Color(51, 153, 255));
        salesBtn1.setFont(new java.awt.Font("Berlin Sans FB", 0, 24)); // NOI18N
        salesBtn1.setForeground(new java.awt.Color(255, 255, 255));
        salesBtn1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-online-store-32.png"))); // NOI18N
        salesBtn1.setText("Search History Patient");
        salesBtn1.setContentAreaFilled(false);
        salesBtn1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        salesBtn1.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        salesBtn1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                salesBtn1ActionPerformed(evt);
            }
        });

        patientsBtn1.setBackground(new java.awt.Color(255, 255, 255));
        patientsBtn1.setFont(new java.awt.Font("Berlin Sans FB", 0, 24)); // NOI18N
        patientsBtn1.setForeground(new java.awt.Color(255, 255, 255));
        patientsBtn1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-patients-32.png"))); // NOI18N
        patientsBtn1.setText("History");
        patientsBtn1.setContentAreaFilled(false);
        patientsBtn1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        patientsBtn1.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        patientsBtn1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                patientsBtn1MouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                patientsBtn1MouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                patientsBtn1MouseExited(evt);
            }
        });
        patientsBtn1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                patientsBtn1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(productsBtn)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(patientsBtn)
                .addGap(15, 15, 15)
                .addComponent(patientsBtn1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 19, Short.MAX_VALUE)
                .addComponent(salesBtn1)
                .addGap(85, 85, 85))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                .addComponent(productsBtn, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(patientsBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(salesBtn1)
                    .addComponent(patientsBtn1, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 12, Short.MAX_VALUE))
        );

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/v1033-a-11-b-removebg-preview.png"))); // NOI18N

        jDesktopPane1.setLayer(jLabel1, javax.swing.JLayeredPane.DEFAULT_LAYER);

        javax.swing.GroupLayout jDesktopPane1Layout = new javax.swing.GroupLayout(jDesktopPane1);
        jDesktopPane1.setLayout(jDesktopPane1Layout);
        jDesktopPane1Layout.setHorizontalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jDesktopPane1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 300, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(244, 244, 244))
        );
        jDesktopPane1Layout.setVerticalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jDesktopPane1Layout.createSequentialGroup()
                .addGap(0, 224, Short.MAX_VALUE)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 178, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jDesktopPane1)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jDesktopPane1))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void productsBtnMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_productsBtnMouseClicked

    }//GEN-LAST:event_productsBtnMouseClicked

    private void productsBtnMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_productsBtnMouseEntered
        productsBtn.setForeground(Color.lightGray);

    }//GEN-LAST:event_productsBtnMouseEntered

    private void productsBtnMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_productsBtnMouseExited
        productsBtn.setForeground(Color.white);
    }//GEN-LAST:event_productsBtnMouseExited

    private void patientsBtnMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_patientsBtnMouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_patientsBtnMouseClicked

    private void patientsBtnMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_patientsBtnMouseEntered
        patientsBtn.setForeground(Color.lightGray);
    }//GEN-LAST:event_patientsBtnMouseEntered

    private void patientsBtnMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_patientsBtnMouseExited
        patientsBtn.setForeground(Color.white);
    }//GEN-LAST:event_patientsBtnMouseExited

    private void productsBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_productsBtnActionPerformed
        find = new ControllerProduct();
        SearchProducts productsFrame = new SearchProducts(find);
        this.jDesktopPane1.add(productsFrame);
        productsFrame.setVisible(true);
    }//GEN-LAST:event_productsBtnActionPerformed

    private void patientsBtn1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_patientsBtn1MouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_patientsBtn1MouseClicked

    private void patientsBtn1MouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_patientsBtn1MouseEntered
        // TODO add your handling code here:
    }//GEN-LAST:event_patientsBtn1MouseEntered

    private void patientsBtn1MouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_patientsBtn1MouseExited
        // TODO add your handling code here:
    }//GEN-LAST:event_patientsBtn1MouseExited

    private void salesBtn1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_salesBtn1ActionPerformed
        ControllerHistoryPatient controller = new ControllerHistoryPatient();
        SearchHistoryPatient historyFrame = new SearchHistoryPatient(controller);
        this.jDesktopPane1.add(historyFrame);
        historyFrame.setVisible(true);
    }//GEN-LAST:event_salesBtn1ActionPerformed

    private void patientsBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_patientsBtnActionPerformed
        ControllerHistoryPatient controller = new ControllerHistoryPatient();
        Util u = new Util();
        RegisterPatient registerFrame = new RegisterPatient(controller, u);
        this.jDesktopPane1.add(registerFrame);
        registerFrame.setVisible(true);
    }//GEN-LAST:event_patientsBtnActionPerformed

    private void patientsBtn1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_patientsBtn1ActionPerformed
        ControllerHistoryPatient controller = new ControllerHistoryPatient();
        HistoryPatient historyFrame = new HistoryPatient(controller);
        this.jDesktopPane1.add(historyFrame);
        historyFrame.setVisible(true);
    }//GEN-LAST:event_patientsBtn1ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDesktopPane jDesktopPane1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JButton patientsBtn;
    private javax.swing.JButton patientsBtn1;
    private javax.swing.JButton productsBtn;
    private javax.swing.JButton salesBtn1;
    // End of variables declaration//GEN-END:variables

}
