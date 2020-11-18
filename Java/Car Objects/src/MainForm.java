import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.EventListener;

/*
This program creates a gui Cars entry program
 */

public class MainForm extends JFrame implements EventListener {
    JButton button1 = new JButton("Enter Car");
    JButton button2 = new JButton("View Entries");

    public MainForm()
    {
        add(button1);
        add(button2);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        CarEntry car = new CarEntry();
        car.setVisible(false);

        button1.addActionListener(new ActionListener(){

            public void actionPerformed(ActionEvent e){

                car.setVisible(true);

            }
        });

        button2.addActionListener(new ActionListener(){

            public void actionPerformed(ActionEvent e){
                DisplayCars carDisplay = new DisplayCars(car.getCarList());
                carDisplay.setVisible(true);
            }
        });
        setLayout(new FlowLayout());
    }

    public static void main(String[] args)
    {
        MainForm frame = new MainForm();
        frame.setSize(150, 150);
        frame.setVisible(true);
    }

}
