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
public class JMainFrame extends JFrame {

    public static void main(String[] args) {

        // CREATE WINDOW
        JFrame frame = new JFrame("Online-Reservierungssystem für Ferienwohnungen");

        // SET UP CONTENT PANE
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(6, 1));

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
        title.setText("CHECK25 Ferienwohnungvermietung");
        titlepanel.add(title);

        // ADD REISEZIEL PANEL
        JPanel reisezielpanel = new JPanel();
        JLabel reisezielLabel = new JLabel("Reiseziel: ");
        String[] reiseziele = { "Deutschland", "Österreich", "Schweiz", "Spanien", "Italien", "Portugal", "USA" };
        JComboBox<String> reisezielComboBox = new JComboBox<>(reiseziele);
        reisezielComboBox.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = reisezielComboBox.getSelectedItem().toString();
                // TODO: implement functionality
                System.out.println(text); // debug
            }
        });
        reisezielpanel.add(reisezielLabel);
        reisezielpanel.add(reisezielComboBox);

        // ADD ANREISE PANEL
        JPanel anreisepanel = new JPanel();
        JLabel anreiseLabel = new JLabel("Anreise: ");
        JTextField anreiseTextField = new JTextField("", 10);
        anreisepanel.add(anreiseLabel);
        anreisepanel.add(anreiseTextField);

        // ADD ABREISE PANEL
        JPanel abreisepanel = new JPanel();
        JLabel abreiseLabel = new JLabel("Abreise: ");
        JTextField abreiseTextField = new JTextField("", 10);
        abreisepanel.add(abreiseLabel);
        abreisepanel.add(abreiseTextField);

        // ADD AUSSTATTUNG PANEL
        JPanel ausstattungpanel = new JPanel();
        JLabel ausstattungLabel = new JLabel("Ausstattung: ");
        JCheckBox parkplatzCheckBox = new JCheckBox("Parkplatz");
        JCheckBox restaurantCheckBox = new JCheckBox("Restaurant");
        JCheckBox zimmerserviceCheckBox = new JCheckBox("Zimmerservice");
        JCheckBox flughafenshuttleCheckBox = new JCheckBox("Flughafenshuttle");
        JCheckBox poolCheckBox = new JCheckBox("Pool");
        JCheckBox wlanCheckBox = new JCheckBox("WLAN inklusive");

        // ADD AN ACTION LISTENER
        ActionListener actionListener = new ActionListener() {
            public void actionPerformed(ActionEvent event) {
                JCheckBox checkbox = (JCheckBox) event.getSource();
                // TODO: implement functionality
                if (checkbox == parkplatzCheckBox) {

                } else if (checkbox == restaurantCheckBox) {

                } else if (checkbox == zimmerserviceCheckBox) {

                } else if (checkbox == flughafenshuttleCheckBox) {

                } else if (checkbox == poolCheckBox) {

                } else if (checkbox == wlanCheckBox) {

                }
            }
        };
        parkplatzCheckBox.addActionListener(actionListener);
        restaurantCheckBox.addActionListener(actionListener);
        zimmerserviceCheckBox.addActionListener(actionListener);
        flughafenshuttleCheckBox.addActionListener(actionListener);
        poolCheckBox.addActionListener(actionListener);
        wlanCheckBox.addActionListener(actionListener);

        ausstattungpanel.add(ausstattungLabel);
        ausstattungpanel.add(parkplatzCheckBox);
        ausstattungpanel.add(restaurantCheckBox);
        ausstattungpanel.add(zimmerserviceCheckBox);
        ausstattungpanel.add(flughafenshuttleCheckBox);
        ausstattungpanel.add(poolCheckBox);
        ausstattungpanel.add(wlanCheckBox);

        // ADD SEARCH BUTTON AND REGISTER BUTTON PANEL
        JPanel searchregisterpanel = new JPanel();
        searchregisterpanel.setAlignmentX(BOTTOM_ALIGNMENT);
        JButton searchButton = new JButton(" Suchen ");
        JButton registerButton = new JButton("Registrieren");
        searchButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // TODO: implement functionality
            }
        });
        registerButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                new JRegisterFrame().setVisible(true);
            }
        });
        searchregisterpanel.add(searchButton);
        searchregisterpanel.add(registerButton);

        // ADD ALL PANELS TO MAIN PANEL
        panel.add(titlepanel);
        panel.add(reisezielpanel);
        panel.add(anreisepanel);
        panel.add(abreisepanel);
        panel.add(ausstattungpanel);
        panel.add(searchregisterpanel);

        // SET UP AND DISPLAY WINDOW
        frame.setContentPane(panel);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setResizable(false);
        frame.setSize(new Dimension(800, 600));
        frame.setLocationRelativeTo(null);
        // frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
        frame.setVisible(true);
    }
}
