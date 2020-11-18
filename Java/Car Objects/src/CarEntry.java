import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ArrayList;
import java.util.List;

public class CarEntry  extends JFrame implements ItemListener {


    private List carList = new ArrayList();

    public List getCarList(){
        return carList;
    }

    //text fields
    JLabel lblMake = new JLabel("Make: ");
    JTextField txtMake = new JTextField(16);

    JLabel lblModel = new JLabel("Model: ");
    JTextField txtModel = new JTextField(16);

    JLabel lblYear = new JLabel("Year:");
    JTextField txtYear = new JTextField(16);

    JLabel lblWeight = new JLabel("Weight");
    JTextField txtWeight = new JTextField(16);

    //Combo Boxes
    JLabel lblColor = new JLabel("Color");
    JComboBox cmbColor = new JComboBox(new String[] {"Galaxy","Tie Dye", "Camo", "Christmas", "Invisible"});

    //Radio Buttons
    JLabel lblEnergySrc = new JLabel("Energy source: ");
    JRadioButton radElectric = new JRadioButton("Electric");
    JRadioButton radGas = new JRadioButton("Gas");

    //Electric stuff
    JLabel lblBatSize = new JLabel("Battery Size: ");
    JTextField txtBatSize = new JTextField(16);

    JLabel lblBatType = new JLabel("Battery Type: ");
    JTextField txtBatType = new JTextField(16);

    //Gas stufff
    JLabel lblTankSize = new JLabel("Tank Size: ");
    JTextField txtTankSize = new JTextField(16);

    JLabel lblGasType = new JLabel("Gas Type: ");
    JTextField txtGasType = new JTextField(16);

    JButton btnSubmit = new JButton("Submit");

    public CarEntry() {
        super("Car Entry");
        setSize(250,500);
        ButtonGroup btnGrp = new ButtonGroup();
        radElectric.setBounds(150,20,150,40);
        btnGrp.add(radElectric);
        radElectric.addItemListener(this);

        radGas.setBounds(150,20,150,40);
        btnGrp.add(radGas);
        radGas.addItemListener(this);

        JPanel pan = new JPanel();
        pan.setLayout(new FlowLayout());
        add(pan);

        pan.add(lblMake);
        pan.add(txtMake);

        pan.add(lblModel);
        pan.add(txtModel);

        pan.add(lblYear);
        pan.add(txtYear);

        pan.add(lblWeight);
        pan.add(txtWeight);

        pan.add(lblColor);
        pan.add(cmbColor);

        pan.add(lblEnergySrc);
        pan.add(radElectric);
        radElectric.setSelected(true);
        pan.add(radGas);

        pan.add(lblBatSize);
        pan.add(txtBatSize);

        pan.add(lblBatType);
        pan.add(txtBatType);

        pan.add(lblTankSize);
        pan.add(txtTankSize);

        pan.add(lblGasType);
        pan.add(txtGasType);

        pan.add(btnSubmit);

        btnSubmit.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent clc) {
                Car selection;
                if(radElectric.isSelected()){
                    try {
                        selection = new ElectricCar(txtMake.getText(), txtModel.getText(), Integer.parseInt(txtYear.getText()), cmbColor.getSelectedItem().toString(), Integer.parseInt(txtWeight.getText()), Double.parseDouble(txtBatSize.getText()), txtBatType.getText());
                        carList.add(selection);
                    }catch (NumberFormatException NE){
                        JOptionPane.showMessageDialog(null, "You entered non-numeric data into a numeric field");
                    }catch (Exception p){
                        JOptionPane.showMessageDialog(null,p.getLocalizedMessage());

                    }
                }else{
                    try {
                        selection = new ElectricCar(txtMake.getText(), txtModel.getText(), Integer.parseInt(txtYear.getText()), cmbColor.getSelectedItem().toString(), Integer.parseInt(txtWeight.getText()), Double.parseDouble(txtTankSize.getText()), txtGasType.getText());
                        carList.add(selection);
                    }catch (NumberFormatException NE){
                        JOptionPane.showMessageDialog(null, "You entered non-numeric data into a numeric field");
                    }catch (Exception p){
                        JOptionPane.showMessageDialog(null,p.getLocalizedMessage());

                    }
                }
            }
        });
    }

    @Override
    public void itemStateChanged(ItemEvent e)
    {
        if(e.getSource() == radElectric){
            txtBatSize.setEditable(true);
            txtBatType.setEditable(true);
            txtTankSize.setEditable(false);
            txtGasType.setEditable(false);
        }else{
            txtBatSize.setEditable(false);
            txtBatType.setEditable(false);
            txtTankSize.setEditable(true);
            txtGasType.setEditable(true);
        }
    }
}


