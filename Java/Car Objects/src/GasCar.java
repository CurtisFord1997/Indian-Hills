import Exceptions.EmptyStingException;
import Exceptions.InvalidCarDataException;
import Exceptions.LowNumException;

/*
    Curtis Ford 4/28/2020 Project 4
    Object dependant on abstract Car object used to hold information on a gas car
*/

public class GasCar extends Car {
    private double tankSize;
    private String fuelType;

    public double getTankSize(){return tankSize;}
    public String getFuelType(){return fuelType;}

    /**
     * sets the tank size as long as it is over zero
     * @param theTankSize
     * @throws LowNumException
     */
    public void setTankSize(double theTankSize) throws LowNumException {
        if(validNum(theTankSize)){
            tankSize = theTankSize;
        }else {
            throw(new LowNumException());
        }
    }

    /**
     * sets the fuel type as long as it is non-blank
     * @param theFuelType
     * @throws EmptyStingException
     */
    public void setFuelType(String theFuelType) throws EmptyStingException {
        if (validString(theFuelType)){
            fuelType = theFuelType;
        }else{
            throw(new EmptyStingException());
        }
    }

    /**
     * Creates a default GasCar object based upon the default Car class.
     */
    public GasCar(){
        super();
        try {
            setTankSize(1);
            setFuelType("Default");
        }catch (Exception e){
            System.out.println("you did not set up default data correctly");
        }
    }

    /**
     * Creates a Gas Car based upon the data thrown to it as long as the data given to it is valid (numbers over zero
     * and strings non-blank)
     * @param iMake
     * @param iModel
     * @param iYear
     * @param iColor
     * @param iWeight
     * @param iTankSize
     * @param iFuelType
     * @throws InvalidCarDataException tells you exactly what data you passed to it that is incorrect.
     */
    public GasCar(String iMake, String iModel, int iYear, String iColor, int iWeight, double iTankSize, String iFuelType)throws InvalidCarDataException{
        super();
        String exceptionMessage = "";//used to tell what data given to it was bad
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
            setTankSize(iTankSize);
        }catch (Exception t){
            exceptionMessage += t.getMessage();
            exceptions = true;
        }

        try {
            setFuelType(iFuelType);
        }catch (Exception f){
            exceptionMessage += f.getMessage();
            exceptions =true;
        }

        if(exceptions){
            throw (new InvalidCarDataException(exceptionMessage));
        }
    }

    /**
     * overrides the default toSting method and returns data in understandable string form.
     * @return
     */
    @Override
    public String toString(){
        return (super.toString()+"\nTank size: "+tankSize+"\nFuel type: "+fuelType);
    }

    /**
     * ties GasCar to abstract Car
     * @param pumpCost
     * @return
     */
    public double CalcCostPerFill(double pumpCost){
        return pumpCost * tankSize;
    }
}
