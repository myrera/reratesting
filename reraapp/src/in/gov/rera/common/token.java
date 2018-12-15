package in.gov.rera.common;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.security.KeyStore;
import java.security.Provider;
import java.security.Security;
import java.security.cert.X509Certificate;
import java.util.Enumeration;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;

public class token {

    private JFrame frame;
    private JPasswordField textField;
    

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    token window = new token();
                    window.frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Create the application.
     */
    public token() {
        initialize();
    }

    /**
     * Initialize the contents of the frame.
     */
    private void initialize() {
        frame = new JFrame();
        frame.setBounds(100, 100, 230, 189);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().setLayout(null);
    
        textField = new JPasswordField();
        textField.setBounds(58, 28, 126, 20);
        frame.getContentPane().add(textField);
        textField.setColumns(40);
        textField.setEchoChar('*');
        
        System.out.println(System.getProperty("os.name"));
        
        JLabel lblName = new JLabel("PIN");
        lblName.setBounds(25, 31, 46, 14);
        frame.getContentPane().add(lblName);
        
        
        
        
        
        
        
        
        JButton btnClear = new JButton("Clear");
        
        btnClear.setBounds(112, 87, 89, 23);
        frame.getContentPane().add(btnClear);
        
        
        
    
        
        
        
        
        JButton btnSubmit = new JButton("submit");
        
        btnSubmit.setBackground(Color.BLUE);
        btnSubmit.setForeground(Color.BLACK);
        btnSubmit.setBounds(25, 87, 89, 23);
        frame.getContentPane().add(btnSubmit);
        
        
        btnSubmit.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
                if(textField.getText().isEmpty())
                    JOptionPane.showMessageDialog(null, "Data Missing");
                else{       
                
                
                
                
                try {
                    // Load token configuration file and register provider
                    String configName =  "c:/token/eToken.txt";
                    Provider p = new sun.security.pkcs11.SunPKCS11(configName);
                    Security.addProvider(p);

                    // Create key store
                    try {
                        KeyStore ks = KeyStore.getInstance("PKCS11");
                        ks.load(null, textField.getPassword());
                        Enumeration aliases = ks.aliases();
                        if (aliases.hasMoreElements() == false) {
                            System.out.println("No digital IDs found in token.");
                            System.exit(-1);
                        }
                        String idAlias = (String) aliases.nextElement();
                        X509Certificate certificationChain=(X509Certificate)ks.getCertificate(idAlias);
                        
                        
                        
                        String name=certificationChain.getSubjectDN().toString().split(",")[0].split("=")[1];
                        System.out.println(name);
                       // String[] certArray=certificationChain.getSubjectDN().toString().split(",");
                       // name=certArray[0]+","+certArray[3]+","+certArray[7]+","+certArray[8];
                        name=URLEncoder.encode(name,"UTF-8");
                        JOptionPane.showMessageDialog(null,new String("Successfully Authenticated"));
                        
                         URL yahoo = new URL("http://localhost:8080/reraapp/sslLogin?userId=rerauserl11&name="+name);
                     URLConnection yc = yahoo.openConnection();
                     BufferedReader in = new BufferedReader(
                     new InputStreamReader(
                     yc.getInputStream()));
                     String inputLine;

                     /*while ((inputLine = in.readLine()) != null)
                     System.out.println(inputLine);*/
                     in.close();
                        
                    } catch (Exception e2) {
                        JOptionPane.showMessageDialog(null,new String(" Authentication Failed"));
                        e2.printStackTrace();
                    }
                    System.exit(-1);
                
                
                } catch (Exception e2) {
                    // TODO: handle exception
                }
            }
        }});
        
        btnClear.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                
                textField.setText(null);
                
                
                
            }
        });
        
    }
}