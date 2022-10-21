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
public class GUI extends JFrame {

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
        JLabel reiseziel = new JLabel("Gewünschtes Reiseziel: ");
        String[] reiseziele = {"Deutschland", "Österreich", "Schweiz", "Spanien", "Italien", "Portugal", "USA"};
        JComboBox<String> reisezielComboBox = new JComboBox<>(reiseziele);
        reisezielComboBox.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = reisezielComboBox.getSelectedItem().toString();
                //TODO: implement functionality
                System.out.println(text); // debug
            }
        } );
        reisezielpanel.add(reiseziel);
        reisezielpanel.add(reisezielComboBox);

        // ADD ANREISE PANEL
        JPanel anreisepanel = new JPanel();
        JLabel anreise = new JLabel("Anreise: ");
        JTextField anreiseTextField = new JTextField("", 10);
        anreisepanel.add(anreise);
        anreisepanel.add(anreiseTextField);

        // ADD ABREISE PANEL
        JPanel abreisepanel = new JPanel();
        JLabel abreise = new JLabel("Abreise: ");
        JTextField abreiseTextField = new JTextField("", 10);
        abreisepanel.add(abreise);
        abreisepanel.add(abreiseTextField);

        // ADD AUSSTATTUNG PANEL
        JPanel ausstattungpanel = new JPanel();
        JLabel ausstattungLabel = new JLabel("Ausstattung: ");
        String[] ausstattung = {"Parkplatz", "Restaurant", "Haustiere erlaubt", "Zimmerservice", "Fitnesscenter",
        "Flughafenshuttle", "Spa & Wellnesscenter", "WLAN inklusive", "Pool"};
        JComboBox<String> ausstattungComboBox = new JComboBox<>(ausstattung);
        ausstattungComboBox.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                String text = ausstattungComboBox.getSelectedItem().toString();
                //TODO: implement functionality
                System.out.println(text); // debug
            }
        } );
        ausstattungpanel.add(ausstattungLabel);
        ausstattungpanel.add(ausstattungComboBox);

        // ADD SEARCH BUTTON PANEL
        JPanel searchbuttonpanel = new JPanel();
        JButton searchButton = new JButton(" Suchen ");
        searchbuttonpanel.add(searchButton);

        // ADD ALL PANELS TO MAIN PANEL
        panel.add(titlepanel);          // titel
        panel.add(reisezielpanel);      // reiseziel bzw. land eingeben
        panel.add(anreisepanel);        // anreise
        panel.add(abreisepanel);        // abreise
        panel.add(ausstattungpanel);    // optional: ausstattungen angeben
        panel.add(searchbuttonpanel);   // search button

        // SET UP AND DISPLAY WINDOW
        frame.setContentPane(panel);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setResizable(false);
        //frame.setSize(new Dimension(1200, 800));
        frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
        frame.setVisible(true);
    }
}
