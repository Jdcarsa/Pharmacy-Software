/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package UI;

import java.awt.Color;
import javax.swing.JInternalFrame;

/**
 *
 * @author ideapad330S
 */
public class Employee extends javax.swing.JFrame {

    /**
     * Creates new form Employee
     */
    public Employee() {
        initComponents();
         this.setExtendedState(MAXIMIZED_BOTH);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jDesktopPane1 = new javax.swing.JDesktopPane();
        jPanel1 = new javax.swing.JPanel();
        singUpBtn = new javax.swing.JButton();
        singUpBtn1 = new javax.swing.JButton();
        singUpBtn2 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jDesktopPane1.setBackground(new java.awt.Color(255, 255, 255));
        jDesktopPane1.setForeground(new java.awt.Color(255, 255, 255));

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));

        singUpBtn.setBackground(new java.awt.Color(255, 255, 255));
        singUpBtn.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        singUpBtn.setForeground(new java.awt.Color(0, 0, 0));
        singUpBtn.setText("Sing Up");
        singUpBtn.setContentAreaFilled(false);
        singUpBtn.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        singUpBtn.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        singUpBtn.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                singUpBtnMouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                singUpBtnMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                singUpBtnMouseExited(evt);
            }
        });

        singUpBtn1.setBackground(new java.awt.Color(51, 51, 255));
        singUpBtn1.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        singUpBtn1.setForeground(new java.awt.Color(0, 0, 0));
        singUpBtn1.setText("Sing Up");
        singUpBtn1.setBorder(null);
        singUpBtn1.setBorderPainted(false);
        singUpBtn1.setContentAreaFilled(false);
        singUpBtn1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        singUpBtn1.setFocusPainted(false);
        singUpBtn1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                singUpBtn1MouseClicked(evt);
            }
        });

        singUpBtn2.setBackground(new java.awt.Color(255, 255, 255));
        singUpBtn2.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        singUpBtn2.setForeground(new java.awt.Color(0, 0, 0));
        singUpBtn2.setText("Sing Up");
        singUpBtn2.setBorder(null);
        singUpBtn2.setBorderPainted(false);
        singUpBtn2.setContentAreaFilled(false);
        singUpBtn2.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        singUpBtn2.setFocusPainted(false);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(singUpBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 142, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(singUpBtn1, javax.swing.GroupLayout.PREFERRED_SIZE, 148, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(singUpBtn2, javax.swing.GroupLayout.PREFERRED_SIZE, 141, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(83, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(singUpBtn2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                .addComponent(singUpBtn, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addComponent(singUpBtn1, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        jDesktopPane1.setLayer(jPanel1, javax.swing.JLayeredPane.DEFAULT_LAYER);

        javax.swing.GroupLayout jDesktopPane1Layout = new javax.swing.GroupLayout(jDesktopPane1);
        jDesktopPane1.setLayout(jDesktopPane1Layout);
        jDesktopPane1Layout.setHorizontalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jDesktopPane1Layout.setVerticalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jDesktopPane1Layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 353, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jDesktopPane1)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jDesktopPane1)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void singUpBtnMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_singUpBtnMouseClicked
        SearchHistoryPatient p = new SearchHistoryPatient();
        jDesktopPane1.add(p);
        p.setVisible(true);
    }//GEN-LAST:event_singUpBtnMouseClicked

    private void singUpBtn1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_singUpBtn1MouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_singUpBtn1MouseClicked

    private void singUpBtnMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_singUpBtnMouseEntered
      singUpBtn.setForeground(Color.red);
       
    }//GEN-LAST:event_singUpBtnMouseEntered

    private void singUpBtnMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_singUpBtnMouseExited
      singUpBtn.setForeground(Color.black);
    }//GEN-LAST:event_singUpBtnMouseExited



    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDesktopPane jDesktopPane1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JButton singUpBtn;
    private javax.swing.JButton singUpBtn1;
    private javax.swing.JButton singUpBtn2;
    // End of variables declaration//GEN-END:variables
}
