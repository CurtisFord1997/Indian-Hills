import javax.swing.*;
import java.util.ArrayList;
import java.util.List;

public class DisplayCars extends JFrame{
    JTextArea txt = new JTextArea();
    JScrollPane sp = new JScrollPane(txt);

    private List<Car> cars = new ArrayList<Car>();

    public DisplayCars(List<Car> carList){
        super("Display Cars");
        setSize(500,500);
        cars = carList;
        add(sp);
        add(txt);
        txt.setEditable(false);


        for(int i = 0; i < carList.size(); i++){
            txt.append("Car "+(i+1)+"\n");
            txt.append(cars.get(i).toString());
            txt.append("\n\n");
        }

    }

}
