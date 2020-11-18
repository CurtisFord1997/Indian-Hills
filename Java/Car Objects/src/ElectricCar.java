import Exceptions.EmptyStingException;
import Exceptions.InvalidCarDataException;
import Exceptions.LowNumException;

/*
    Curtis Ford 4/28/2020 Project 4
    Object dependant on abstract Car object used to hold information on an electric car
 */

public class ElectricCar extends Car {
    private double batterySize;
    private String batteryType;

    public double getBatterySize(){return batterySize;}
    public String getBatteryType(){return batteryType;}

    /**
     * sets the battery size as long as input over zero
     * @param theBatterySize
     * @throws LowNumException
     */
    public void setBatterySize(double theBatterySize) throws LowNumException {
        if(validNum(theBatterySize)){
            batterySize = theBatterySize;
        }else {
            throw(new LowNumException());
        }
    }

    /**
     * sets the batteryType as long as non-blank
     * @param theBatteryType
     * @throws EmptyStingException
     */
    public void setBatteryType(String theBatteryType) throws EmptyStingException {
        if (validString(theBatteryType)){
            batteryType = theBatteryType;
        }else{
            throw(new EmptyStingException());
        }
    }

    /**
     * creates a default ElectricCar object
     */
    public ElectricCar(){
        super();
        try {
            setBatterySize(1);
            setBatteryType("Default");
        }catch (Exception e){
            System.out.println("you did not set up default data correctly");
        }
    }

    /**
     * Creates an ElectricCar based upon the data thrown to it as long as the data given to it is valid (numbers over zero
     * and strings non-blank)
     * @param iMake
     * @param iModel
     * @param iYear
     * @param iColor
     * @param iWeight
     * @param iBatterySize
     * @param iBatteryType
     * @throws InvalidCarDataException
     */
    public ElectricCar(String iMake, String iModel, int iYear, String iColor, int iWeight, double iBatterySize, String iBatteryType)throws InvalidCarDataException {
        super();
        String exceptionMessage = "";
        boolean exceptions = false;

        //uses the nonValidatedCar method from the Car method to set the make model year, color and weight. returns an
        //exception formattd to tell what went wrong if something went wrong.
        try {
            nonValidatedCar(iMake,iModel,iYear,iColor,iWeight);
        }catch (Exception e){
            //adds the exception message to the exceptonMessage that will be used when the final Exception message is thrown.
            exceptionMessage += e.getMessage();
            exceptions = true;
        }

        //each one of the following try blocks attempts to use the setter for each piece of data and if using the setter
        //returns an exception it adds it to the named exceptions string that is passed to the ListExceptions exception
        //it also adds one to exceptions if a setter fails to keep track of how many exceptions have been thrown.
        try{
            setBatterySize(iBatterySize);
        }catch (Exception t){
            exceptionMessage += t.getMessage();
            exceptions = true;
        }

        try {
            setBatteryType(iBatteryType);
        }catch (Exception f){
            exceptionMessage += f.getMessage();
            exceptions =true;
        }

        if(exceptions){
            throw (new InvalidCarDataException(exceptionMessage));
        }
    }

    /**
     * overrides the default toSting method and returns data in usable form.
     * @return
     */
    @Override
    public String toString(){
        return (super.toString()+"\nBattery size: "+ batterySize +" kilowatts\nBattery type: "+ batteryType);
    }

    /**
     * ties GasCar to abstract Car
     * @param pumpCost
     * @return
     */
    public double CalcCostPerFill(double pumpCost){
        return pumpCost * batterySize;
    }
}
