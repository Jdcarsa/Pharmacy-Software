
package UI;

import javax.swing.ImageIcon;

public class Login extends javax.swing.JFrame {

 
    public Login() {
        initComponents();
        this.setLocationRelativeTo(null);
         ImageIcon icon = new ImageIcon("C:\\Users\\ideapad330S\\Documents\\NetBeansProjects"
                 + "\\Pharmacy Software\\src\\UI\\Images\\Icono.png");
         this.setIconImage(icon.getImage());
    }


    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        bgPanel = new javax.swing.JPanel();
        textLogIn = new javax.swing.JLabel();
        loginLb = new javax.swing.JLabel();
        usernameLb = new javax.swing.JLabel();
        passwordLb = new javax.swing.JLabel();
        singUpBtn = new javax.swing.JButton();
        userTf = new javax.swing.JTextField();
        subLinePnl1 = new javax.swing.JPanel();
        passwordField = new javax.swing.JPasswordField();
        subLinePnl = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        Logo = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Login");
        setName("loginFrame"); // NOI18N
        setResizable(false);

        bgPanel.setBackground(new java.awt.Color(255, 255, 255));
        bgPanel.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        textLogIn.setFont(new java.awt.Font("Sitka Small", 1, 30)); // NOI18N
        textLogIn.setForeground(new java.awt.Color(255, 255, 255));
        textLogIn.setText("Pharmacy Software");
        textLogIn.setDisplayedMnemonicIndex(1);
        bgPanel.add(textLogIn, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 260, 320, 80));

        loginLb.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        loginLb.setForeground(new java.awt.Color(0, 0, 0));
        loginLb.setText("Login");
        bgPanel.add(loginLb, new org.netbeans.lib.awtextra.AbsoluteConstraints(480, 40, 60, 40));

        usernameLb.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        usernameLb.setForeground(new java.awt.Color(0, 0, 0));
        usernameLb.setText("Username");
        bgPanel.add(usernameLb, new org.netbeans.lib.awtextra.AbsoluteConstraints(360, 160, 110, 30));

        passwordLb.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        passwordLb.setForeground(new java.awt.Color(0, 0, 0));
        passwordLb.setText("Password");
        bgPanel.add(passwordLb, new org.netbeans.lib.awtextra.AbsoluteConstraints(360, 260, 110, 30));

        singUpBtn.setBackground(new java.awt.Color(51, 51, 255));
        singUpBtn.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        singUpBtn.setForeground(new java.awt.Color(255, 255, 255));
        singUpBtn.setText("Login");
        singUpBtn.setBorder(null);
        singUpBtn.setBorderPainted(false);
        singUpBtn.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        singUpBtn.setFocusPainted(false);
        singUpBtn.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                singUpBtnMouseClicked(evt);
            }
        });
        bgPanel.add(singUpBtn, new org.netbeans.lib.awtextra.AbsoluteConstraints(360, 420, 290, 50));

        userTf.setBackground(new java.awt.Color(255, 255, 255));
        userTf.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        userTf.setForeground(new java.awt.Color(0, 0, 0));
        userTf.setBorder(null);
        bgPanel.add(userTf, new org.netbeans.lib.awtextra.AbsoluteConstraints(365, 200, 310, 30));

        subLinePnl1.setBackground(new java.awt.Color(51, 51, 255));
        subLinePnl1.setForeground(new java.awt.Color(51, 51, 255));

        javax.swing.GroupLayout subLinePnl1Layout = new javax.swing.GroupLayout(subLinePnl1);
        subLinePnl1.setLayout(subLinePnl1Layout);
        subLinePnl1Layout.setHorizontalGroup(
            subLinePnl1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 280, Short.MAX_VALUE)
        );
        subLinePnl1Layout.setVerticalGroup(
            subLinePnl1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1, Short.MAX_VALUE)
        );

        bgPanel.add(subLinePnl1, new org.netbeans.lib.awtextra.AbsoluteConstraints(365, 333, 280, 1));

        passwordField.setBackground(new java.awt.Color(255, 255, 255));
        passwordField.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        passwordField.setForeground(new java.awt.Color(0, 0, 0));
        passwordField.setBorder(null);
        bgPanel.add(passwordField, new org.netbeans.lib.awtextra.AbsoluteConstraints(365, 303, 310, 30));

        subLinePnl.setBackground(new java.awt.Color(51, 51, 255));
        subLinePnl.setForeground(new java.awt.Color(51, 51, 255));

        javax.swing.GroupLayout subLinePnlLayout = new javax.swing.GroupLayout(subLinePnl);
        subLinePnl.setLayout(subLinePnlLayout);
        subLinePnlLayout.setHorizontalGroup(
            subLinePnlLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 280, Short.MAX_VALUE)
        );
        subLinePnlLayout.setVerticalGroup(
            subLinePnlLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1, Short.MAX_VALUE)
        );

        bgPanel.add(subLinePnl, new org.netbeans.lib.awtextra.AbsoluteConstraints(365, 230, 280, 1));

        jPanel1.setBackground(new java.awt.Color(51, 51, 255));

        Logo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/v1033-a-11-b-removebg-preview.png"))); // NOI18N

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(29, 29, 29)
                .addComponent(Logo, javax.swing.GroupLayout.PREFERRED_SIZE, 234, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(67, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(42, 42, 42)
                .addComponent(Logo)
                .addContainerGap(202, Short.MAX_VALUE))
        );

        bgPanel.add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 330, 500));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(bgPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(bgPanel, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    
    private void singUpBtnMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_singUpBtnMouseClicked
       this.setVisible(false);
     SalesUI a = new SalesUI();
      a.setVisible(true);

    }//GEN-LAST:event_singUpBtnMouseClicked



    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Logo;
    private javax.swing.JPanel bgPanel;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel loginLb;
    private javax.swing.JPasswordField passwordField;
    private javax.swing.JLabel passwordLb;
    private javax.swing.JButton singUpBtn;
    private javax.swing.JPanel subLinePnl;
    private javax.swing.JPanel subLinePnl1;
    private javax.swing.JLabel textLogIn;
    private javax.swing.JTextField userTf;
    private javax.swing.JLabel usernameLb;
    // End of variables declaration//GEN-END:variables
}
