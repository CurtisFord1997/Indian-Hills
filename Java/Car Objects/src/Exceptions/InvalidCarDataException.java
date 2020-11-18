package Exceptions;

public class InvalidCarDataException extends Exception {

    public InvalidCarDataException(String exceptions){
        super("Creating class failed because of the following exceptions: \n"+exceptions);
    }
}
