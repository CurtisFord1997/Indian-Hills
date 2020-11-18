
import Exceptions.EmptyStingException;
import Exceptions.InvalidCarDataException;
import Exceptions.ListExceptions;
import Exceptions.LowNumException;

/*
    Curtis Ford 4/28/2020 Project 4
    abstract object used to store information on a car.
 */

public abstract class Car {
    //instance variables
    protected String make;
    protected String model;
    protected int year;
    protected String color;
    protected int weight;

    //getters
    public String getMake(){return make;}
    public String getModel(){return model;}
    public String getColor(){return color;}
    public int getYear(){return year;}
    public int getWeight(){return weight;}

    /**
     * sets the make of the car as long as it is a valid string(non-blank)
     * @param theMake
     * @throws EmptyStingException
     */
    public void setMake(String theMake) throws EmptyStingException {
        if(validString(theMake)){
            make = theMake;
        }else{
            throw (new EmptyStingException());
        }
    }

    /**
     * sets the model of the car as long as it is a valid string(non-blank)
     * @param theModel
     * @throws EmptyStingException
     */
    public void setModel(String theModel) throws EmptyStingException {
        if(validString(theModel)) {
            model = theModel;
        } else {
            throw (new EmptyStingException());
        }
    }

    /**
     * sets the year the car was made as non as it is over zero
     * @param theYear
     * @throws LowNumException
     */
    public void setYear(int theYear) throws LowNumException {
        if(validNum(theYear)){
            year = theYear;
        }else {
            throw(new LowNumException());
        }
    }

    /**
     * sets the color of the car as long as it is a valid string(non-blank)
     * @param theColor
     * @throws EmptyStingException
     */
    public void setColor(String theColor) throws EmptyStingException{
        if(validString(theColor)){
            color = theColor;
        }else{
            throw(new EmptyStingException());
        }
    }

    /**
     * sets the weight as long as the number is over zero
     * @param theWeight
     * @throws LowNumException
     */
    public void setWeight(int theWeight) throws LowNumException{
        if(validNum(theWeight)){
            weight=theWeight;
        }else{
            throw(new LowNumException());
        }
    }

    /**
     * default constructor, sets make, model, year, color, and weight to default values
     */
    public Car(){
        try {
            setMake("DefaultFerrari");
            setModel("DefalutHorseShadow");
            setYear(2020);
            setColor("DefaultBlue");
            setWeight(9001);
        }catch (Exception e){
            System.out.println("You fool! You did not set valid default values!");
        }
    }

    /**
     * constructs a Car using the input values (strings need to be non-blank and numbers over zero)
     * Otherwise just prints out error.
     * @param iMake
     * @param iModel
     * @param iYear
     * @param iColor
     * @param iWeight
     */
    public Car(String iMake, String iModel, int iYear, String iColor, int iWeight){
        try{
            setMake(iMake);
            setModel(iModel);
            setYear(iYear);
            setColor(iColor);
            setWeight(iWeight);
        }catch (Exception e){
            System.out.println("Invalid Data Entry.");
        }
    }

    /**
     * sets all the data in the car class and throws detailed errors as to what is wrong with the data input.
     * @param iMake
     * @param iModel
     * @param iYear
     * @param iColor
     * @param iWeight
     * @throws ListExceptions
     */
    protected void nonValidatedCar(String iMake, String iModel, int iYear, String iColor, int iWeight) throws ListExceptions {
        int exceptions = 0;
        String namedExceptions ="";

        //each one of the following try blocks attempts to use the setter for each piece of data and if using the setter
        //returns an exception it adds it to the named exceptions string that is passed to the ListExceptions exception
        //it also adds one to exceptions if a setter fails to keep track of how many exceptions have been thrown.

        try{
            setMake(iMake);
        }catch(EmptyStingException e){
            exceptions++;
            namedExceptions += "Make"+e.getMessage()+"\n";
        }

        try{
            setModel(iModel);
        }catch(EmptyStingException e){
            exceptions++;
            namedExceptions += "Model"+e.getMessage()+"\n";
        }

        try{
            setYear(iYear);
        }catch (LowNumException e){
            exceptions++;
            namedExceptions += "Year"+e.getMessage()+"\n";
        }

        try{
            setColor(iColor);
        }catch(EmptyStingException e){
            exceptions++;
            namedExceptions += "Color"+e.getMessage()+"\n";
        }

        try{
            setWeight(iWeight);
        }catch (LowNumException e){
            exceptions++;
            namedExceptions += "Weight"+e.getMessage()+"\n";
        }


        //if there is at least one exception thrown from the setters it throws the ListExceptions exception using the
        // namedExceptions as the message fro the exception
        if(exceptions > 0){
            throw(new ListExceptions(namedExceptions));
        }
    }

    /**
     * validates that a string is non-blank
     * @param theString
     * @return
     */
    protected boolean validString(String theString){
        if(theString.trim().length() > 0){
            return true;
        }else{
            return false;
        }
    }

    /**
     * validates that the number passed to it is over zero
     * @param theNum
     * @return
     */
    protected boolean validNum(double theNum){
        if(theNum > 0){
            return  true;
        }else {
            return false;
        }
    }

    /**
     * overrides the toString method so that it formats the data in the class in an appropriate manner.
     * @return
     */
    @Override
    public String toString() {
        return("Make: " + make + "\nModel: " + model + "\nYear: " + year + "\nColor: " + color + "\nWeight: "+ weight);
    }

    /**
     * is the tie that ties the extension classes to it.
     * @param pumpCost
     * @return
     */
    protected abstract double CalcCostPerFill(double pumpCost);

}


