package UI;

import Controller.Interfaces.IFindData;
import Controller.Interfaces.IController;
import Controller.Interfaces.IAddName;
import Controller.Interfaces.IAddDataTFCB;
import Controller.Interfaces.IAddDataTF;
import Controller.Interfaces.IAddDataCalendarTFCB;
import Controller.*;
import Controller.AdminFunctions.ControllerDetailsSales;
import Controller.AdminFunctions.FunctionsContractEmployee;
import Model.Util;
import UI.Admin.Options.ContractEmployee;
import UI.Admin.Options.DetailsSales;
import UI.Crud.Create.*;
import UI.Crud.Search.*;
import java.awt.Color;
import static java.awt.Frame.MAXIMIZED_BOTH;
import javax.swing.ImageIcon;
import UI.Crud.Disable.*;
import UI.Crud.Update.*;

public class AdminUI extends javax.swing.JFrame {

    private IController controller;
    private IAddDataTF addData;
    private Util u;
    private IFindData find;
    public boolean existsPanel = false;
    private String id;

    public AdminUI(Util u, String id) {
        initComponents();
        this.u = u;
        this.setExtendedState(MAXIMIZED_BOTH);
        ImageIcon icon = new ImageIcon("C:\\Users\\ideapad330S\\Documents\\NetBeansProjects"
                + "\\Pharmacy Software\\src\\UI\\Images\\Icono.png");
        this.setIconImage(icon.getImage());
        this.id = id;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jDesktopPane1 = new javax.swing.JDesktopPane();
        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jToolBar1 = new javax.swing.JToolBar();
        jSeparator4 = new javax.swing.JToolBar.Separator();
        detailsBtn = new javax.swing.JButton();
        jSeparator9 = new javax.swing.JToolBar.Separator();
        salesBtn3 = new javax.swing.JButton();
        jSeparator10 = new javax.swing.JToolBar.Separator();
        salesBtn2 = new javax.swing.JButton();
        jMenuBar1 = new javax.swing.JMenuBar();
        register = new javax.swing.JMenu();
        registerProduct = new javax.swing.JMenuItem();
        jSeparator1 = new javax.swing.JPopupMenu.Separator();
        registerProvider = new javax.swing.JMenuItem();
        jSeparator2 = new javax.swing.JPopupMenu.Separator();
        registerPresentation = new javax.swing.JMenuItem();
        jSeparator3 = new javax.swing.JPopupMenu.Separator();
        registerEmployee = new javax.swing.JMenuItem();
        jSeparator5 = new javax.swing.JPopupMenu.Separator();
        registerLaboratory = new javax.swing.JMenuItem();
        update = new javax.swing.JMenu();
        updateProduct = new javax.swing.JMenuItem();
        jSeparator13 = new javax.swing.JPopupMenu.Separator();
        updateProvider = new javax.swing.JMenuItem();
        jSeparator14 = new javax.swing.JPopupMenu.Separator();
        updatePresentation = new javax.swing.JMenuItem();
        jSeparator15 = new javax.swing.JPopupMenu.Separator();
        updateEmployee = new javax.swing.JMenuItem();
        jSeparator6 = new javax.swing.JPopupMenu.Separator();
        updateLaboratory = new javax.swing.JMenuItem();
        disable = new javax.swing.JMenu();
        disableProduct = new javax.swing.JMenuItem();
        jSeparator22 = new javax.swing.JPopupMenu.Separator();
        disableProvider = new javax.swing.JMenuItem();
        jSeparator23 = new javax.swing.JPopupMenu.Separator();
        disablePresentation = new javax.swing.JMenuItem();
        jSeparator24 = new javax.swing.JPopupMenu.Separator();
        disableEmployee = new javax.swing.JMenuItem();
        jSeparator7 = new javax.swing.JPopupMenu.Separator();
        disableLaboratory1 = new javax.swing.JMenuItem();
        search = new javax.swing.JMenu();
        searchProduct = new javax.swing.JMenuItem();
        jSeparator25 = new javax.swing.JPopupMenu.Separator();
        searchProvider = new javax.swing.JMenuItem();
        jSeparator26 = new javax.swing.JPopupMenu.Separator();
        searchPresentation = new javax.swing.JMenuItem();
        jSeparator27 = new javax.swing.JPopupMenu.Separator();
        searchEmployee = new javax.swing.JMenuItem();
        jSeparator8 = new javax.swing.JPopupMenu.Separator();
        searchLab = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Admin");
        setBackground(new java.awt.Color(255, 255, 255));

        jPanel2.setBackground(new java.awt.Color(204, 255, 255));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/v1033-a-11-b-removebg-preview.png"))); // NOI18N

        jToolBar1.setRollover(true);

        jSeparator4.setSeparatorSize(new java.awt.Dimension(20, 0));
        jToolBar1.add(jSeparator4);

        detailsBtn.setBackground(new java.awt.Color(51, 153, 255));
        detailsBtn.setFont(new java.awt.Font("Berlin Sans FB", 0, 24)); // NOI18N
        detailsBtn.setForeground(new java.awt.Color(51, 51, 51));
        detailsBtn.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-cost-32.png"))); // NOI18N
        detailsBtn.setText("Detail Sales");
        detailsBtn.setContentAreaFilled(false);
        detailsBtn.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        detailsBtn.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        detailsBtn.setFocusable(false);
        detailsBtn.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);
        detailsBtn.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                detailsBtnMouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                detailsBtnMouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                detailsBtnMouseExited(evt);
            }
        });
        detailsBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                detailsBtnActionPerformed(evt);
            }
        });
        jToolBar1.add(detailsBtn);
        jToolBar1.add(jSeparator9);

        salesBtn3.setBackground(new java.awt.Color(51, 153, 255));
        salesBtn3.setFont(new java.awt.Font("Berlin Sans FB", 0, 24)); // NOI18N
        salesBtn3.setForeground(new java.awt.Color(51, 51, 51));
        salesBtn3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-accounting-32.png"))); // NOI18N
        salesBtn3.setText("Employment Contracts");
        salesBtn3.setContentAreaFilled(false);
        salesBtn3.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        salesBtn3.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        salesBtn3.setFocusable(false);
        salesBtn3.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);
        salesBtn3.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        salesBtn3.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                salesBtn3MouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                salesBtn3MouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                salesBtn3MouseExited(evt);
            }
        });
        salesBtn3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                salesBtn3ActionPerformed(evt);
            }
        });
        jToolBar1.add(salesBtn3);
        jToolBar1.add(jSeparator10);

        salesBtn2.setBackground(new java.awt.Color(51, 153, 255));
        salesBtn2.setFont(new java.awt.Font("Berlin Sans FB", 0, 24)); // NOI18N
        salesBtn2.setForeground(new java.awt.Color(51, 51, 51));
        salesBtn2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-user-32.png"))); // NOI18N
        salesBtn2.setText("Account");
        salesBtn2.setContentAreaFilled(false);
        salesBtn2.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        salesBtn2.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);
        salesBtn2.setFocusable(false);
        salesBtn2.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);
        salesBtn2.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        salesBtn2.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                salesBtn2MouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                salesBtn2MouseEntered(evt);
            }
            public void mouseExited(java.awt.event.MouseEvent evt) {
                salesBtn2MouseExited(evt);
            }
        });
        salesBtn2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                salesBtn2ActionPerformed(evt);
            }
        });
        jToolBar1.add(salesBtn2);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap(307, Short.MAX_VALUE)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 300, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(325, Short.MAX_VALUE))
            .addComponent(jToolBar1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addComponent(jToolBar1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 207, Short.MAX_VALUE)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 178, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(43, 43, 43))
        );

        jDesktopPane1.setLayer(jPanel2, javax.swing.JLayeredPane.DEFAULT_LAYER);

        javax.swing.GroupLayout jDesktopPane1Layout = new javax.swing.GroupLayout(jDesktopPane1);
        jDesktopPane1.setLayout(jDesktopPane1Layout);
        jDesktopPane1Layout.setHorizontalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        jDesktopPane1Layout.setVerticalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        jMenuBar1.setBackground(new java.awt.Color(51, 51, 255));
        jMenuBar1.setForeground(new java.awt.Color(0, 0, 0));
        jMenuBar1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));

        register.setBackground(new java.awt.Color(51, 51, 255));
        register.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-healthcare-32.png"))); // NOI18N
        register.setText("Register    ");
        register.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        register.setFont(new java.awt.Font("Berlin Sans FB", 0, 24)); // NOI18N
        register.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);

        registerProduct.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        registerProduct.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-pills-32.png"))); // NOI18N
        registerProduct.setText("Product");
        registerProduct.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        registerProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                registerProductActionPerformed(evt);
            }
        });
        register.add(registerProduct);
        register.add(jSeparator1);

        registerProvider.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        registerProvider.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-shipping-32.png"))); // NOI18N
        registerProvider.setText("Provier");
        registerProvider.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        registerProvider.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                registerProviderActionPerformed(evt);
            }
        });
        register.add(registerProvider);
        register.add(jSeparator2);

        registerPresentation.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        registerPresentation.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-pills-bottle-32.png"))); // NOI18N
        registerPresentation.setText("Presentation");
        registerPresentation.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        registerPresentation.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                registerPresentationActionPerformed(evt);
            }
        });
        register.add(registerPresentation);
        register.add(jSeparator3);

        registerEmployee.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        registerEmployee.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-medical-support-32.png"))); // NOI18N
        registerEmployee.setText("Employee");
        registerEmployee.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        registerEmployee.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                registerEmployeeActionPerformed(evt);
            }
        });
        register.add(registerEmployee);
        register.add(jSeparator5);

        registerLaboratory.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        registerLaboratory.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-industry-32.png"))); // NOI18N
        registerLaboratory.setText("Laboratory");
        registerLaboratory.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        registerLaboratory.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                registerLaboratoryActionPerformed(evt);
            }
        });
        register.add(registerLaboratory);

        jMenuBar1.add(register);

        update.setBackground(new java.awt.Color(51, 51, 255));
        update.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-return-32.png"))); // NOI18N
        update.setText("Update        ");
        update.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        update.setFont(new java.awt.Font("Berlin Sans FB", 0, 24)); // NOI18N
        update.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);

        updateProduct.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        updateProduct.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-pills-32.png"))); // NOI18N
        updateProduct.setText("Product");
        updateProduct.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        updateProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updateProductActionPerformed(evt);
            }
        });
        update.add(updateProduct);
        update.add(jSeparator13);

        updateProvider.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        updateProvider.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-shipping-32.png"))); // NOI18N
        updateProvider.setText("Provider");
        updateProvider.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        updateProvider.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updateProviderActionPerformed(evt);
            }
        });
        update.add(updateProvider);
        update.add(jSeparator14);

        updatePresentation.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        updatePresentation.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-pills-bottle-32.png"))); // NOI18N
        updatePresentation.setText("Presentation");
        updatePresentation.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        updatePresentation.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updatePresentationActionPerformed(evt);
            }
        });
        update.add(updatePresentation);
        update.add(jSeparator15);

        updateEmployee.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        updateEmployee.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-medical-support-32.png"))); // NOI18N
        updateEmployee.setText("Employee");
        updateEmployee.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        updateEmployee.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updateEmployeeActionPerformed(evt);
            }
        });
        update.add(updateEmployee);
        update.add(jSeparator6);

        updateLaboratory.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        updateLaboratory.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-industry-32.png"))); // NOI18N
        updateLaboratory.setText("Laboratory");
        updateLaboratory.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        updateLaboratory.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updateLaboratoryActionPerformed(evt);
            }
        });
        update.add(updateLaboratory);

        jMenuBar1.add(update);

        disable.setBackground(new java.awt.Color(51, 51, 255));
        disable.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-documentation-32.png"))); // NOI18N
        disable.setText("Disable       ");
        disable.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        disable.setFont(new java.awt.Font("Berlin Sans FB", 0, 24)); // NOI18N
        disable.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        disable.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                disableActionPerformed(evt);
            }
        });

        disableProduct.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        disableProduct.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-pills-32.png"))); // NOI18N
        disableProduct.setText("Product");
        disableProduct.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        disableProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                disableProductActionPerformed(evt);
            }
        });
        disable.add(disableProduct);
        disable.add(jSeparator22);

        disableProvider.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        disableProvider.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-shipping-32.png"))); // NOI18N
        disableProvider.setText("Provider");
        disableProvider.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        disableProvider.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                disableProviderActionPerformed(evt);
            }
        });
        disable.add(disableProvider);
        disable.add(jSeparator23);

        disablePresentation.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        disablePresentation.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-pills-bottle-32.png"))); // NOI18N
        disablePresentation.setText("Presentation");
        disablePresentation.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        disablePresentation.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                disablePresentationActionPerformed(evt);
            }
        });
        disable.add(disablePresentation);
        disable.add(jSeparator24);

        disableEmployee.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        disableEmployee.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-medical-support-32.png"))); // NOI18N
        disableEmployee.setText("Employee");
        disableEmployee.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        disableEmployee.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                disableEmployeeActionPerformed(evt);
            }
        });
        disable.add(disableEmployee);
        disable.add(jSeparator7);

        disableLaboratory1.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        disableLaboratory1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-industry-32.png"))); // NOI18N
        disableLaboratory1.setText("Laboratory");
        disableLaboratory1.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        disableLaboratory1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                disableLaboratory1ActionPerformed(evt);
            }
        });
        disable.add(disableLaboratory1);

        jMenuBar1.add(disable);

        search.setBackground(new java.awt.Color(51, 51, 255));
        search.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-search-32.png"))); // NOI18N
        search.setText("Search    ");
        search.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        search.setFont(new java.awt.Font("Berlin Sans FB", 0, 24)); // NOI18N
        search.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);

        searchProduct.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        searchProduct.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-pills-32.png"))); // NOI18N
        searchProduct.setText("Product");
        searchProduct.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        searchProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchProductActionPerformed(evt);
            }
        });
        search.add(searchProduct);
        search.add(jSeparator25);

        searchProvider.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        searchProvider.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-shipping-32.png"))); // NOI18N
        searchProvider.setText("Provider");
        searchProvider.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        searchProvider.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchProviderActionPerformed(evt);
            }
        });
        search.add(searchProvider);
        search.add(jSeparator26);

        searchPresentation.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        searchPresentation.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-pills-bottle-32.png"))); // NOI18N
        searchPresentation.setText("Presentation");
        searchPresentation.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        searchPresentation.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchPresentationActionPerformed(evt);
            }
        });
        search.add(searchPresentation);
        search.add(jSeparator27);

        searchEmployee.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        searchEmployee.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-medical-support-32.png"))); // NOI18N
        searchEmployee.setText("Employee");
        searchEmployee.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        searchEmployee.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchEmployeeActionPerformed(evt);
            }
        });
        search.add(searchEmployee);
        search.add(jSeparator8);

        searchLab.setFont(new java.awt.Font("Sitka Text", 0, 16)); // NOI18N
        searchLab.setIcon(new javax.swing.ImageIcon(getClass().getResource("/UI/Images/icons8-industry-32.png"))); // NOI18N
        searchLab.setText("Laboratory");
        searchLab.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        searchLab.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchLabActionPerformed(evt);
            }
        });
        search.add(searchLab);

        jMenuBar1.add(search);

        setJMenuBar(jMenuBar1);

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

    private void detailsBtnMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_detailsBtnMouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_detailsBtnMouseClicked

    private void detailsBtnMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_detailsBtnMouseEntered
        // TODO add your handling code here:
    }//GEN-LAST:event_detailsBtnMouseEntered

    private void detailsBtnMouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_detailsBtnMouseExited
        // TODO add your handling code here:
    }//GEN-LAST:event_detailsBtnMouseExited

    private void salesBtn2MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_salesBtn2MouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_salesBtn2MouseClicked

    private void salesBtn2MouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_salesBtn2MouseEntered
        // TODO add your handling code here:
    }//GEN-LAST:event_salesBtn2MouseEntered

    private void salesBtn2MouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_salesBtn2MouseExited
        // TODO add your handling code here:
    }//GEN-LAST:event_salesBtn2MouseExited

    private void salesBtn3MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_salesBtn3MouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_salesBtn3MouseClicked

    private void salesBtn3MouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_salesBtn3MouseEntered
        // TODO add your handling code here:
    }//GEN-LAST:event_salesBtn3MouseEntered

    private void salesBtn3MouseExited(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_salesBtn3MouseExited
        // TODO add your handling code here:
    }//GEN-LAST:event_salesBtn3MouseExited

    private void registerProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_registerProductActionPerformed
        u = new Util();
        controller = new ControllerProduct();
        IController controller2 = new ControllerLaboratory();
        IAddName con = new ControllerPresentation();
        find = new ControllerProduct();
        IFindData find2 = new ControllerLaboratory();
        RegisterProduct regProduct = new RegisterProduct(u, controller, controller2, con, find, find2);
        this.jDesktopPane1.add(regProduct);
        regProduct.setVisible(true);
    }//GEN-LAST:event_registerProductActionPerformed

    private void registerProviderActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_registerProviderActionPerformed
        controller = new ControllerProvider();
        u = new Util();
        find = new ControllerProvider();
        RegisterProvider regProvider = new RegisterProvider(u, controller, find);
        this.jDesktopPane1.add(regProvider);
        regProvider.setVisible(true);
    }//GEN-LAST:event_registerProviderActionPerformed

    private void registerLaboratoryActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_registerLaboratoryActionPerformed
        u = new Util();
        controller = new ControllerLaboratory();
        find = new ControllerLaboratory();
        RegisterLab regLaboratory = new RegisterLab(u, controller, find);
        this.jDesktopPane1.add(regLaboratory);
        regLaboratory.setVisible(true);
    }//GEN-LAST:event_registerLaboratoryActionPerformed

    private void registerPresentationActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_registerPresentationActionPerformed
        u = new Util();
        controller = new ControllerPresentation();
        find = new ControllerPresentation();
        RegisterPresentation regPresentation = new RegisterPresentation(u, controller, find);
        this.jDesktopPane1.add(regPresentation);
        regPresentation.setVisible(true);
    }//GEN-LAST:event_registerPresentationActionPerformed

    private void registerEmployeeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_registerEmployeeActionPerformed
        controller = new ControllerEmployee();
        u = new Util();
        find = new ControllerEmployee();
        RegisterEmployee regEmployee = new RegisterEmployee(controller, u, find);
        this.jDesktopPane1.add(regEmployee);
        regEmployee.setVisible(true);
    }//GEN-LAST:event_registerEmployeeActionPerformed

    private void searchProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchProductActionPerformed
        find = new ControllerProduct();
        SearchProducts productsFrame = new SearchProducts(find);
        this.jDesktopPane1.add(productsFrame);
        productsFrame.setVisible(true);
    }//GEN-LAST:event_searchProductActionPerformed

    private void searchLabActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchLabActionPerformed
        find = new ControllerLaboratory();
        SearchLab labFrame = new SearchLab(find);
        this.jDesktopPane1.add(labFrame);
        labFrame.setVisible(true);
    }//GEN-LAST:event_searchLabActionPerformed

    private void searchPresentationActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchPresentationActionPerformed

        find = new ControllerPresentation();
        SearchPresentation pFrame = new SearchPresentation(find);
        this.jDesktopPane1.add(pFrame);
        pFrame.setVisible(true);
    }//GEN-LAST:event_searchPresentationActionPerformed

    private void searchEmployeeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchEmployeeActionPerformed
        find = new ControllerEmployee();
        SearchEmployee empFrame = new SearchEmployee(find);
        this.jDesktopPane1.add(empFrame);
        empFrame.setVisible(true);
    }//GEN-LAST:event_searchEmployeeActionPerformed

    private void searchProviderActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchProviderActionPerformed
        find = new ControllerProvider();
        SearchProvider pFrame = new SearchProvider(find);
        this.jDesktopPane1.add(pFrame);
        pFrame.setVisible(true);
    }//GEN-LAST:event_searchProviderActionPerformed

    private void disableProviderActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_disableProviderActionPerformed
        controller = new ControllerProvider();
        find = new ControllerProvider();
        DisableProvider disablePro = new DisableProvider(controller, find);
        this.jDesktopPane1.add(disablePro);
        disablePro.setVisible(true);
    }//GEN-LAST:event_disableProviderActionPerformed

    private void disablePresentationActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_disablePresentationActionPerformed
        controller = new ControllerPresentation();
        find = new ControllerPresentation();
        DisablePresentation disablePre = new DisablePresentation(controller, find);
        this.jDesktopPane1.add(disablePre);
        disablePre.setVisible(true);
    }//GEN-LAST:event_disablePresentationActionPerformed

    private void disableProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_disableProductActionPerformed
        controller = new ControllerProduct();
        find = new ControllerProduct();
        DisableProduct disablePro = new DisableProduct(controller, find);
        this.jDesktopPane1.add(disablePro);
        disablePro.setVisible(true);
    }//GEN-LAST:event_disableProductActionPerformed

    private void disableActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_disableActionPerformed

    }//GEN-LAST:event_disableActionPerformed

    private void disableEmployeeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_disableEmployeeActionPerformed
        controller = new ControllerEmployee();
        find = new ControllerEmployee();
        DisableEmployee disableEmp = new DisableEmployee(controller, find);
        this.jDesktopPane1.add(disableEmp);
        disableEmp.setVisible(true);
    }//GEN-LAST:event_disableEmployeeActionPerformed

    private void disableLaboratory1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_disableLaboratory1ActionPerformed
        controller = new ControllerLaboratory();
        find = new ControllerLaboratory();
        DisableLab disableLab = new DisableLab(controller, find);
        this.jDesktopPane1.add(disableLab);
        disableLab.setVisible(true);
    }//GEN-LAST:event_disableLaboratory1ActionPerformed

    private void updatePresentationActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updatePresentationActionPerformed
        u = new Util();
        controller = new ControllerPresentation();
        find = new ControllerPresentation();
        addData = new ControllerPresentation();
        UpdatePresentation updatePre = new UpdatePresentation(u, controller, find, addData);
        this.jDesktopPane1.add(updatePre);
        updatePre.setVisible(true);
    }//GEN-LAST:event_updatePresentationActionPerformed

    private void updateLaboratoryActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updateLaboratoryActionPerformed
        controller = new ControllerLaboratory();
        u = new Util();
        addData = new ControllerLaboratory();
        find = new ControllerLaboratory();
        UpdateLab updateLab = new UpdateLab(u, controller, addData, find);
        this.jDesktopPane1.add(updateLab);
        updateLab.setVisible(true);
    }//GEN-LAST:event_updateLaboratoryActionPerformed

    private void updateProviderActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updateProviderActionPerformed
        controller = new ControllerProvider();
        u = new Util();
        addData = new ControllerProvider();
        find = new ControllerProvider();
        UpdateProvider updatePro = new UpdateProvider(u, controller, addData, find);
        this.jDesktopPane1.add(updatePro);
        updatePro.setVisible(true);
    }//GEN-LAST:event_updateProviderActionPerformed

    private void updateEmployeeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updateEmployeeActionPerformed
        u = new Util();
        controller = new ControllerEmployee();
        IAddDataTFCB ad = new ControllerEmployee();
        find = new ControllerEmployee();
        UpdateEmployee updateE = new UpdateEmployee(u, controller, ad, find);
        this.jDesktopPane1.add(updateE);
        updateE.setVisible(true);
    }//GEN-LAST:event_updateEmployeeActionPerformed

    private void updateProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updateProductActionPerformed
        u = new Util();
        controller = new ControllerProduct();
        IAddDataCalendarTFCB ad = new ControllerProduct();
        IAddName addP = new ControllerPresentation();
        IController controller2 = new ControllerLaboratory();
        find = new ControllerProduct();
        IFindData find2 = new ControllerLaboratory();
        UpdateProduct upP = new UpdateProduct(u, controller, controller2, ad, addP, find, find2);
        this.jDesktopPane1.add(upP);
        upP.setVisible(true);
    }//GEN-LAST:event_updateProductActionPerformed

    private void salesBtn3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_salesBtn3ActionPerformed
        ContractEmployee cE = new ContractEmployee(new FunctionsContractEmployee());
        this.jDesktopPane1.add(cE);
        cE.setVisible(true);
    }//GEN-LAST:event_salesBtn3ActionPerformed

    private void detailsBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_detailsBtnActionPerformed
        find = new ControllerDetailsSales();
        DetailsSales details = new DetailsSales(find);
        this.jDesktopPane1.add(details);
        details.setVisible(true);
    }//GEN-LAST:event_detailsBtnActionPerformed

    private void salesBtn2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_salesBtn2ActionPerformed
        Account acc = new Account(id);
        this.jDesktopPane1.add(acc);
        acc.setVisible(true);
    }//GEN-LAST:event_salesBtn2ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton detailsBtn;
    private javax.swing.JMenu disable;
    private javax.swing.JMenuItem disableEmployee;
    private javax.swing.JMenuItem disableLaboratory1;
    private javax.swing.JMenuItem disablePresentation;
    private javax.swing.JMenuItem disableProduct;
    private javax.swing.JMenuItem disableProvider;
    private javax.swing.JDesktopPane jDesktopPane1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPopupMenu.Separator jSeparator1;
    private javax.swing.JToolBar.Separator jSeparator10;
    private javax.swing.JPopupMenu.Separator jSeparator13;
    private javax.swing.JPopupMenu.Separator jSeparator14;
    private javax.swing.JPopupMenu.Separator jSeparator15;
    private javax.swing.JPopupMenu.Separator jSeparator2;
    private javax.swing.JPopupMenu.Separator jSeparator22;
    private javax.swing.JPopupMenu.Separator jSeparator23;
    private javax.swing.JPopupMenu.Separator jSeparator24;
    private javax.swing.JPopupMenu.Separator jSeparator25;
    private javax.swing.JPopupMenu.Separator jSeparator26;
    private javax.swing.JPopupMenu.Separator jSeparator27;
    private javax.swing.JPopupMenu.Separator jSeparator3;
    private javax.swing.JToolBar.Separator jSeparator4;
    private javax.swing.JPopupMenu.Separator jSeparator5;
    private javax.swing.JPopupMenu.Separator jSeparator6;
    private javax.swing.JPopupMenu.Separator jSeparator7;
    private javax.swing.JPopupMenu.Separator jSeparator8;
    private javax.swing.JToolBar.Separator jSeparator9;
    private javax.swing.JToolBar jToolBar1;
    private javax.swing.JMenu register;
    private javax.swing.JMenuItem registerEmployee;
    private javax.swing.JMenuItem registerLaboratory;
    private javax.swing.JMenuItem registerPresentation;
    private javax.swing.JMenuItem registerProduct;
    private javax.swing.JMenuItem registerProvider;
    private javax.swing.JButton salesBtn2;
    private javax.swing.JButton salesBtn3;
    private javax.swing.JMenu search;
    private javax.swing.JMenuItem searchEmployee;
    private javax.swing.JMenuItem searchLab;
    private javax.swing.JMenuItem searchPresentation;
    private javax.swing.JMenuItem searchProduct;
    private javax.swing.JMenuItem searchProvider;
    private javax.swing.JMenu update;
    private javax.swing.JMenuItem updateEmployee;
    private javax.swing.JMenuItem updateLaboratory;
    private javax.swing.JMenuItem updatePresentation;
    private javax.swing.JMenuItem updateProduct;
    private javax.swing.JMenuItem updateProvider;
    // End of variables declaration//GEN-END:variables
}
