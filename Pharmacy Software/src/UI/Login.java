
package UI;

public class Login extends javax.swing.JFrame {

 
    public Login() {
        initComponents();
        this.setLocationRelativeTo(null);
    }


    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        bgPanel = new javax.swing.JPanel();
        Logo = new javax.swing.JLabel();
        textLogIn = new javax.swing.JLabel();
        bgLb = new javax.swing.JLabel();
        loginLb = new javax.swing.JLabel();
        usernameLb = new javax.swing.JLabel();
        passwordLb = new javax.swing.JLabel();
        singUpBtn = new javax.swing.JButton();
        userTf = new javax.swing.JTextField();
        subLinePnl1 = new javax.swing.JPanel();
        passwordField = new javax.swing.JPasswordField();
        subLinePnl = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Login");
        setName("loginFrame"); // NOI18N
        setResizable(false);

        bgPanel.setBackground(new java.awt.Color(255, 255, 255));
        bgPanel.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        Logo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/clip-online-pharmacy-shopping.png"))); // NOI18N
        bgPanel.add(Logo, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 10, 234, -1));

        textLogIn.setFont(new java.awt.Font("Sitka Small", 1, 30)); // NOI18N
        textLogIn.setForeground(new java.awt.Color(255, 255, 255));
        textLogIn.setText("Pharmacy Software");
        textLogIn.setDisplayedMnemonicIndex(1);
        bgPanel.add(textLogIn, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 240, 320, 90));

        bgLb.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/6922721_23670 (1).jpg"))); // NOI18N
        bgPanel.add(bgLb, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 400, 500));

        loginLb.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        loginLb.setForeground(new java.awt.Color(0, 0, 0));
        loginLb.setText("Login");
        bgPanel.add(loginLb, new org.netbeans.lib.awtextra.AbsoluteConstraints(510, 40, 60, 40));

        usernameLb.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        usernameLb.setForeground(new java.awt.Color(0, 0, 0));
        usernameLb.setText("Username");
        bgPanel.add(usernameLb, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 160, 110, 30));

        passwordLb.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        passwordLb.setForeground(new java.awt.Color(0, 0, 0));
        passwordLb.setText("Password");
        bgPanel.add(passwordLb, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 260, 110, 30));

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
        bgPanel.add(singUpBtn, new org.netbeans.lib.awtextra.AbsoluteConstraints(560, 420, 160, 50));

        userTf.setBackground(new java.awt.Color(255, 255, 255));
        userTf.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        userTf.setForeground(new java.awt.Color(0, 0, 0));
        userTf.setBorder(null);
        bgPanel.add(userTf, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 200, 310, 30));

        subLinePnl1.setBackground(new java.awt.Color(51, 51, 255));
        subLinePnl1.setForeground(new java.awt.Color(51, 51, 255));

        javax.swing.GroupLayout subLinePnl1Layout = new javax.swing.GroupLayout(subLinePnl1);
        subLinePnl1.setLayout(subLinePnl1Layout);
        subLinePnl1Layout.setHorizontalGroup(
            subLinePnl1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );
        subLinePnl1Layout.setVerticalGroup(
            subLinePnl1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1, Short.MAX_VALUE)
        );

        bgPanel.add(subLinePnl1, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 333, 300, 1));

        passwordField.setBackground(new java.awt.Color(255, 255, 255));
        passwordField.setFont(new java.awt.Font("Segoe UI", 0, 18)); // NOI18N
        passwordField.setForeground(new java.awt.Color(0, 0, 0));
        passwordField.setBorder(null);
        bgPanel.add(passwordField, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 303, 310, 30));

        subLinePnl.setBackground(new java.awt.Color(51, 51, 255));
        subLinePnl.setForeground(new java.awt.Color(51, 51, 255));

        javax.swing.GroupLayout subLinePnlLayout = new javax.swing.GroupLayout(subLinePnl);
        subLinePnl.setLayout(subLinePnlLayout);
        subLinePnlLayout.setHorizontalGroup(
            subLinePnlLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );
        subLinePnlLayout.setVerticalGroup(
            subLinePnlLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 1, Short.MAX_VALUE)
        );

        bgPanel.add(subLinePnl, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 230, 300, 1));

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
     Employee a = new Employee();
      a.setVisible(true);
        System.out.println("click");
    }//GEN-LAST:event_singUpBtnMouseClicked



    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Logo;
    private javax.swing.JLabel bgLb;
    private javax.swing.JPanel bgPanel;
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
