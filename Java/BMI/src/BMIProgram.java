import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/*
This program asks the user for a system of measurement and then asks for weight, and height.
It then uses the BMI object to store the data and return the data in string format.
It also reads and writes patients from a file, and can display all of them in a table
 */

public class BMIProgram {
    public static Scanner scannyMcScanner = new Scanner(System.in);
    public static List<BMI> myBMIList = new ArrayList<>();

    public static void main(String[] args){
        int option = 0;
        init();
        //BMI myBMI;

        do {
            option = menu();
            switch(option) {
                case 1:
                case 2:
                    myBMIList.add(genInput(option));
                    break;
                case 3:
                    displayPatients();
                    break;
                case 4:
                    closing();
                    System.out.println("\nProgram will now exit, press Enter");
                    scannyMcScanner.nextLine();
                    break;
                default:
                    System.out.println("\nOption must be 1 - 4, press Enter");
                    scannyMcScanner.nextLine();
            }
        }while(option != 4);
    }

    /**
     * opens up input file, reads the contents into a list of BMI objects, then closes the files
     */
    private static void init() {
        String filename = "Patients.ser";
        FileInputStream inFile;
        ObjectInputStream inStream;

        // Deserialization
        try
        {
            inFile = new FileInputStream(filename);
            inStream = new ObjectInputStream(inFile);

            // read the objects as an entire array
            //myBMIList = (List<BMI>) inStream.readObject();

            while(inFile.available() > 0) {
                //if logic to determine what type of object is being read in
                myBMIList.add((BMI)inStream.readObject());    //get the object
            }

            inStream.close();
            inFile.close();

        }

        catch(Exception ex)
        {
            System.out.println("Error reading Patients file");
        }
    }

    /**
     * asks the user whether they want metric or standard for the unit of measurement and returns the value they enter.
     * @return
     */
    public static int menu() {
        int opt = 0;

        System.out.println("Welcome to the To Your Health BMI Calculator\n\n");
        System.out.println("MENU\n");
        System.out.println("\tOption 1: Metric\n");
        System.out.println("\tOption 2: Standard\n");
        System.out.println("\tOption 3: Display patients\n");
        System.out.println("\tOption 4: Exit");
        System.out.print("Enter your option: ");

        try {
            opt = Integer.parseInt(scannyMcScanner.nextLine());
        }
        catch(Exception e) {
            opt = 0;
        }
        System.out.println();

        return opt;
    }

    public static BMI genInput(int option){
        BMI myBMI;
        int weight = 0, height = 0;
        String fName, lName;
        fName = inputFirstName();
        lName = inputLastName();
        weight = inputWeight(option);
        height = inputHeight(option);
        myBMI = new BMI(fName,lName,weight, height, option);
        showBMI(myBMI);
        return myBMI;
    }

    /**
     * Prompts the user for the first name
     * @return the non blank first name
     */
    public static String inputFirstName(){
        String fName ="";
        Boolean invalid = true;

        do{
            System.out.print("Enter first name: ");
            try {
                fName = scannyMcScanner.nextLine().trim();
                invalid = validNameLength(fName);
            } catch (Exception e){
                System.out.println("Error: Name not string, please try again.");
                invalid = true;
            }
        }while(invalid);
        return fName;
    }

    /**
     * Prompts user for last name
     * @return non-blank last name
     */
    public static String inputLastName(){
        String lName ="";
        Boolean invalid = true;

        do{
            System.out.print("Enter last name: ");
            try {
                lName = scannyMcScanner.nextLine().trim();
                invalid = validNameLength(lName);
            } catch (Exception e){
                System.out.println("Error: Name not string, please try again.");
                invalid = true;
            }
        }while(invalid);
        return lName;
    }

    /**
     * Validates that the length of a name entered is greater than zero, trimming whitespace before and after
     * @param name a string that needs to be verified if it is not blank
     * @return true for a valid name length, or false for an invalid name length
     */
    public static Boolean validNameLength(String name){
        Boolean invalid;
        if (name.trim().length() > 0){
            invalid = false;
        } else {
            System.out.println("Name must not be blank.");
            invalid = true;
        }
        return invalid;
    }

    /**
     * gets the weight as an input based on whether they want to use metric or imperial units.
     * @param opt 1 for metric, 2 for imperial
     * @return the number of lb/kg
     */
    public static int inputWeight(int opt) {
        int weight = 0;
        Boolean invalid = true;

        do {
            switch (opt) {
                case 1:
                    System.out.print("\nEnter weight in kilograms: ");
                    try {
                        weight = Integer.parseInt(scannyMcScanner.nextLine());
                        invalid = lowTest(weight);
                    } catch (Exception e) {
                        System.out.print("Weight must be numeric, please try again.\n");
                        invalid = true;
                    }
                    break;
                case 2:
                    System.out.print("Enter weight in pounds: ");
                    try {
                        weight = Integer.parseInt(scannyMcScanner.nextLine());
                        invalid = lowTest(weight);
                    } catch (Exception e) {
                        System.out.print("Weight must be numeric, please try again.\n\n");
                        invalid = true;
                    }
                    break;
            }
        }while(invalid);

        return weight;
    }

    /**
     * gets the height as an input based on whether they want to use metric or imperial units.
     * @param opt 1 for metric, 2 for imperial
     * @return the number of in/cm
     */
    public static int inputHeight(int opt) {
        int height = 0;
        boolean invalid = true;

        do {
            switch (opt) {
                case 1:
                    System.out.print("\nEnter height in centimeters: ");
                    try {
                        height = Integer.parseInt(scannyMcScanner.nextLine());
                        invalid = lowTest(height);
                    } catch (Exception e) {
                        System.out.print("Height must be numeric, please try again.\n\n");
                        invalid = true;
                    }
                    break;
                case 2:
                    System.out.print("Enter height in inches: ");
                    try {
                        height = Integer.parseInt(scannyMcScanner.nextLine());
                        invalid = lowTest(height);
                    } catch (Exception e) {
                        System.out.print("Height must be numeric, please try again.\n\n");
                        invalid = true;
                    }
                    break;
            }
        }while(invalid);

        return height;
    }

    /**
     * checks to see if a number is less than or equal to 0
     * @param number
     * @return returns true if the number is less than or equal to 0
     */
    public static boolean lowTest(int number){
        boolean tooLow = false;
        if(number<=0){
            tooLow = true;
            System.out.println("Number too low, it needs to be over 0.");
        }
        return tooLow;
    }

    /**
     * shows the BMI based on the BMI object passed in through b
     * @param b
     */
    public static void showBMI(BMI b) {
        System.out.println(b.toString());
        System.out.print("\nPress Enter to return to Menu");
        scannyMcScanner.nextLine();
    }

    public static void displayPatients(){
        System.out.format("%-25s%5s%-10s%5s%-10s%5s%-10s%5s%-6s%5s%-10s\n", "Name"," ","Height"," ","Weight"," ","Type"," ","BMI"," ","Status");
        for(BMI b : myBMIList){
            System.out.format("%-25s%5s%-10s%5s%-10s%5s%-10s%5s%-6.2f%5s%-10s\n", b.getlName()+", "+b.getfName()," ",Integer.toString(b.getHeight()) ," ",Integer.toString(b.getWeight()) ," ",(b.getUnits() == 1 ? "Metric" : "Standard")," ",b.calcBMI()," ",b.detStatus());
        }
        System.out.print("\nPress enter to return to menu.");
        scannyMcScanner.nextLine();
    }

    /**
     * writes to the data file to store it for next run
     */
    public static void closing(){
        String filename = "Patients.ser";
        FileOutputStream outFile;
        ObjectOutputStream outStream;

        try{
            //Saving of object in a file
            outFile = new FileOutputStream(filename);
            outStream = new ObjectOutputStream(outFile);

            // write the objects as an entire array
            //outStream.writeObject(myBMIList);
            for(Object o : myBMIList) {
                outStream.writeObject(o);
            }

            outStream.close();
            outFile.close();

        }
        catch(Exception ex){
            System.out.println("Error writing patients to file" + ex.getMessage());
        }
    }
}

