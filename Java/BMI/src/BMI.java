/*
Project 3
 Curtis Ford
 */

import java.io.Serializable;

public class BMI implements Serializable {
    //initialize vars
    private int weight;
    private int height;
    private int units; //1 is metric, 2 is customary
    private String fName;
    private String lName;

    /**
     * is the overloaded constructor that declares
     * @param iFName sets string first name
     * @param iLName sets string last name
     * @param iWeight sets an integer weight
     * @param iHeight sets the height
     * @param iUnits 1 is metric, 2 is customary
     */
    public BMI(String iFName, String iLName, int iWeight, int iHeight, int iUnits){
        setfName(iFName);
        setlName(iLName);
        setWeight(iWeight);
        setHeight(iHeight);
        setUnits(iUnits);
    }

    /**
     * creates a BMI obj that sets the weight to 70kg, and the height to 170 cm
     */
    public BMI(){
        setfName("John");
        setlName("Doh");
        setWeight(70);
        setHeight(170);
        setUnits(1);
    }

    /**
     * Sets first name in object
     * defaults to John
     * @param iFName String needs to be non-blank
     */
    public void setfName(String iFName){
        iFName = iFName.trim();
        if(iFName.length() > 0){
            fName = iFName;
        }else {
            fName = "John";
        }
    }

    /**
     * Sets last name in object
     * defaults to Doe
     * @param iLName String needs to be non-blank
     */
    public void setlName(String iLName){
        iLName = iLName.trim();
        if(iLName.length() > 0){
            lName = iLName;
        } else {
            lName = "Doe";
        }
    }

    /**
     * sets weight in obj
     * defaults to 70
     * @param iWeight needs to be over 0
     */
    public void setWeight(int iWeight){
        if (iWeight > 0){
            weight = iWeight;
        }else{
            weight = 70;
            //System.out.println("Weight invalid, setting to default 70");
        }
    }

    /**
     * sets weight in obj
     * defaults to 170
     * @param iHeight needs to be over 0
     */
    public void setHeight(int iHeight){
        if(iHeight > 0){
            height = iHeight;
        }else {
            height = 170;
            //System.out.println("Height invalid, setting to default 170");
        }
    }

    /**
     * sets units in obj
     * defaults to 1: metric
     * @param iUnits sets units to either 1: metric, or 2: customary
     */
    public void setUnits(int iUnits){
        if(iUnits == 1 || iUnits == 2){
            units = iUnits;
        }else{
            units = 1;
            //System.out.println("Unit input ivalid, setting to 1: metric");
        }
    }

    public String getfName(){return fName;}
    public String getlName(){return lName;}
    public int getWeight(){return weight;}
    public int getHeight(){return height;}
    public int getUnits(){return units;}


    /**
     * calculates the BMI based on height and weght stored in object
     * @return the BMI
     */
    public double calcBMI(){
        double BMI;
        if (units == 1){
            BMI = Math.round((weight)/(Math.pow(height/100.0,2))*10)/10d;
        }else{
            BMI = Math.round((weight*703)/(Math.pow((double)height,2))*10)/10d;
        }
        return BMI;
    }

    /**
     * Overridden toString method that formats the data and calls the BMI class to output a string
     * @return a formatted string
     */
    @Override
    public String toString(){
        String output;
        double bmi = calcBMI();
        String status = detStatus(bmi);

        output = String.format("%7s%2.2f%17s%-3s%1s", "BMI is ",bmi," and is considered ",status,"." );
        return  output;
    }

    /**
     * returns the status to a method that has already calculated the BMI
     * @param bmi
     * @return a string that tells whether the person is underweight, obese, normal, or underweight based on the passed BMI
     */
    public String detStatus(double bmi){
        String status;
        if (bmi < 18.5){
            status = "underweight";
        }else if(bmi < 25) {
            status = "normal";
        }else if (bmi < 30){
            status = "overweight";
        }else{
            status = "obese";
        }
        return status;
    }

    /**
     * returns the status to a method without the BMI to have previously been calculated
     * @return a string that tells whether the person is underweight, obese, normal, or underweight based on the data in the class
     */
    public String detStatus(){
        String status;
        double bmi = calcBMI();
        if (bmi < 18.5){
            status = "Underweight";
        }else if(bmi < 25) {
            status = "Normal";
        }else if (bmi < 30){
            status = "Overweight";
        }else{
            status = "Obese";
        }
        return status;
    }
}
