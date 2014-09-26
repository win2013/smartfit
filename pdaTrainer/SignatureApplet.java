/*
 * SignatureApplet.java
 *
 * Created on May 19, 2003, 10:41 PM
 */


/**
 *
 * @author  otnip
 */
import java.awt.*;
import java.awt.image.*;


public class SignatureApplet extends java.applet.Applet {
    int coor[][] = new int[5000][2];
    int start[] = new int[100];
    int end[] = new int[100];
    int count = 0;
    int pressed = 0;
    SignaturePanel panel = new SignaturePanel();
    
    /** Initializes the applet SignatureApplet */
    public void init() {
        initComponents();
        
        Thread thread = new Thread(panel);
        //  thread.start();
        add(panel, java.awt.BorderLayout.CENTER);
    }
    
    /** This method is called from within the init() method to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    private void initComponents() {//GEN-BEGIN:initComponents
        buttonsPanel = new java.awt.Panel();
        okButton = new java.awt.Button();
        restartButton = new java.awt.Button();

        setLayout(new java.awt.BorderLayout());

        buttonsPanel.setLayout(new java.awt.GridLayout(1, 2));

        okButton.setBackground(new java.awt.Color(255, 255, 204));
        okButton.setFont(new java.awt.Font("Arial Black", 3, 12));
        okButton.setForeground(new java.awt.Color(0, 102, 0));
        okButton.setLabel("OK");
        okButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                okButtonActionPerformed(evt);
            }
        });

        buttonsPanel.add(okButton);

        restartButton.setBackground(new java.awt.Color(255, 255, 204));
        restartButton.setFont(new java.awt.Font("Arial Black", 3, 12));
        restartButton.setForeground(new java.awt.Color(0, 102, 0));
        restartButton.setLabel("RESTART");
        restartButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                restartButtonActionPerformed(evt);
            }
        });

        buttonsPanel.add(restartButton);

        add(buttonsPanel, java.awt.BorderLayout.SOUTH);

    }//GEN-END:initComponents
    
    private void okButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_okButtonActionPerformed
        // Add your handling code here:
        try {
            StringBuffer buffer = new StringBuffer();
            
            buffer.append(pressed + ",");
            for (int i =0;i < pressed;i++)
                buffer.append(start[i] + "," + end[i] + ",");
            
            buffer.append(count + ",");
            for (int i =0;i < count;i++)
                buffer.append(coor[i][0] + "," + coor[i][1] + ",");
            
            getAppletContext().showDocument(new java.net.URL("http://" + getParameter("returnAddress") + "/smartfit/pdaTrainer/setWorkoutSignature.jsp?info=" + buffer.toString()));
        }
        catch (Exception e) {e.printStackTrace();}
    }//GEN-LAST:event_okButtonActionPerformed
    
    private void restartButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_restartButtonActionPerformed
        // Add your handling code here:
        pressed = 0;
        count = 0;
        panel.repaint();
    }//GEN-LAST:event_restartButtonActionPerformed
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private java.awt.Panel buttonsPanel;
    private java.awt.Button okButton;
    private java.awt.Button restartButton;
    // End of variables declaration//GEN-END:variables
    
    public class SignaturePanel extends java.awt.Canvas implements Runnable {
        public SignaturePanel() {
            super();
            addMouseListener(new java.awt.event.MouseAdapter() {
                public void mousePressed(java.awt.event.MouseEvent evt) {
                    coor[count][0] = evt.getX();
                    coor[count][1] = evt.getY();
                    start[pressed] = count+1;
                    count++;
                    
                }
                public void mouseReleased(java.awt.event.MouseEvent evt) {
                    coor[count][0] = evt.getX();
                    coor[count][1] = evt.getY();
                    end[pressed] = count;
                    count++;
                    pressed++;
                    repaint();
                }
            });
            
            addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
                public void mouseDragged(java.awt.event.MouseEvent evt) {
                    coor[count][0] = evt.getX();
                    coor[count][1] = evt.getY();
                    count++;
                    
                    
                }
            });
            setBackground(Color.black);
            
        }
        
        public void paint(java.awt.Graphics g) {
            //super.paint(g);
            
            
            g.setColor(Color.red);
            
            for (int j = 0;j < pressed;j++) {
                if ((end[j] - start[j]) > 2)
                    for (int i = (start[j]+1);i < (end[j]);i++)
                        g.drawLine(coor[i-1][0], coor[i-1][1], coor[i][0], coor[i][1]);
            }
            
            if ((count - start[pressed]) > 2)
                for (int i = start[pressed];i < count;i++)
                    g.drawLine(coor[i-1][0], coor[i-1][1], coor[i][0], coor[i][1]);
            
        }
        
        public void run() {
            while (true) {
                try {
                    Thread.sleep(1000);
                    repaint();
                }
                catch (Exception e) {e.printStackTrace();}
            }
        }
        
    }
}