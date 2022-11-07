import javax.swing.*;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;

import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

/**
 * GUI für ein Online-Reservierungssystem für Ferienwohnungen
 *
 * Autor: Julian Klimek, Dominik Bartsch
 * Datum: 21.10.2022
 */

public class JRegisterFrame extends JFrame {

    public void run() {

        // CREATE WINDOW
        JFrame frame = new JFrame("Online-Reservierungssystem für Ferienwohnungen");

        // SET UP CONTENT PANE
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(9, 1));
        panel.setAlignmentX(LEFT_ALIGNMENT);

        // ADD TITLE PANEL
        JPanel titlepanel = new JPanel();
        JTextPane title = new JTextPane();
        SimpleAttributeSet attributeSet = new SimpleAttributeSet();
        StyleConstants.setBold(attributeSet, true);
        StyleConstants.setForeground(attributeSet, Color.WHITE);
        StyleConstants.setBackground(attributeSet, Color.BLUE);
        StyleConstants.setFontSize(attributeSet, 40);
        title.setCharacterAttributes(attributeSet, false);
        title.setEditable(false);
        title.setText("Registrierung");
        titlepanel.add(title);

        // ADD NAME PANEL
        JPanel namepanel = new JPanel();
        JPanel vornamepanel = new JPanel();
        JLabel vornameLabel = new JLabel("Vorname:");
        JTextField vornameTextField = new JTextField("", 30);
        vornameTextField.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = vornameTextField.getText().toString();
                // TODO: implement functionality
            }
        });
        vornamepanel.add(vornameLabel);
        vornamepanel.add(vornameTextField);
        JPanel nachnamepanel = new JPanel();
        JLabel nachnameLabel = new JLabel("Nachname:");
        JTextField nachnameTextField = new JTextField("", 30);
        nachnameTextField.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = nachnameTextField.getText().toString();
                // TODO: implement functionality
            }
        });
        nachnamepanel.add(nachnameLabel);
        nachnamepanel.add(nachnameTextField);
        namepanel.add(vornamepanel);
        namepanel.add(nachnamepanel);

        // ADD MAIL PANEL
        JPanel mailpanel = new JPanel();
        JLabel mailLabel = new JLabel("E-Mail-Adresse:");
        JTextField mailTextField = new JTextField("", 65);
        mailTextField.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = mailTextField.getText().toString();
                // TODO: implement functionality
            }
        });
        mailpanel.add(mailLabel);
        mailpanel.add(mailTextField);

        // ADD LAND PANEL
        JPanel landpanel = new JPanel();
        JLabel landLabel = new JLabel("Land:");
        String[] land = { "Deutschland", "Österreich", "Schweiz", "Dänemark", "Niederlande", "Belgien" };
        JComboBox<String> landComboBox = new JComboBox<>(land);
        landComboBox.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = landComboBox.getSelectedItem().toString();
                // TODO: implement functionality
            }
        });
        landpanel.add(landLabel);
        landpanel.add(landComboBox);

        // ADD PLZ AND ORT PANEL
        JPanel plzortpanel = new JPanel();
        JPanel plzpanel = new JPanel();
        JLabel plzLabel = new JLabel("Postleitzahl:");
        JTextField plzTextField = new JTextField("", 30);
        plzTextField.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = plzTextField.getText().toString();
                // TODO: implement functionality
            }
        });
        plzpanel.add(plzLabel);
        plzpanel.add(plzTextField);
        JPanel ortpanel = new JPanel();
        JLabel ortLabel = new JLabel("Ort:");
        JTextField ortTextField = new JTextField("", 30);
        ortTextField.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = ortTextField.getText().toString();
                // TODO: implement functionality
            }
        });
        ortpanel.add(ortLabel);
        ortpanel.add(ortTextField);
        plzortpanel.add(plzpanel);
        plzortpanel.add(ortpanel);

        // ADD STREET PANEL
        JPanel streetnumberpanel = new JPanel();
        JPanel streetpanel = new JPanel();
        JLabel streetLabel = new JLabel("Straße:");
        JTextField streetTextField = new JTextField("", 30);
        streetTextField.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = streetTextField.getText().toString();
                // TODO: implement functionality
            }
        });
        streetpanel.add(streetLabel);
        streetpanel.add(streetTextField);
        JPanel numberpanel = new JPanel();
        JLabel numberLabel = new JLabel("Hausnummer:");
        JTextField numberTextField = new JTextField("", 30);
        numberTextField.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = numberTextField.getText().toString();
                // TODO: implement functionality
            }
        });
        numberpanel.add(numberLabel);
        numberpanel.add(numberTextField);
        streetnumberpanel.add(streetpanel);
        streetnumberpanel.add(numberpanel);

        // ADD IBAN PANEL
        JPanel ibanpanel = new JPanel();
        JLabel ibanLabel = new JLabel("IBAN:");
        JTextField ibanTextField = new JTextField("", 65);
        ibanTextField.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = ibanTextField.getText().toString();
                // TODO: implement functionality
            }
        });
        ibanpanel.add(ibanLabel);
        ibanpanel.add(ibanTextField);

        // ADD NEWSLETTER PANEL
        JPanel newsletterpanel = new JPanel();
        JCheckBox newsletterCheckBox = new JCheckBox("Newsletter abonnieren", true);
        newsletterCheckBox.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JCheckBox checkbox = (JCheckBox) e.getSource();
                // TODO: implement functionality
            }
        });
        newsletterpanel.add(newsletterCheckBox);

        // ADD ZURÜCK/BESTÄTIGEN PANEL
        JPanel backconfirmpanel = new JPanel();
        backconfirmpanel.setAlignmentX(RIGHT_ALIGNMENT);
        JButton backButton = new JButton(" Zurück ");
        JButton confirmButton = new JButton(" Bestätigen ");
        backButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                frame.setVisible(false);
            }
        });
        confirmButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // TODO: implement functionality
            }
        });
        backconfirmpanel.add(backButton);
        backconfirmpanel.add(confirmButton);

        // ADD ALL PANELS TO MAIN PANEL
        panel.add(titlepanel);
        panel.add(namepanel);
        panel.add(mailpanel);
        panel.add(landpanel);
        panel.add(plzortpanel);
        panel.add(streetnumberpanel);
        panel.add(ibanpanel);
        panel.add(newsletterpanel);
        panel.add(backconfirmpanel);

        // SET UP AND DISPLAY WINDOW
        frame.setContentPane(panel);
        frame.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        frame.pack();
        frame.setResizable(false);
        frame.setSize(new Dimension(1000, 800));
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}
