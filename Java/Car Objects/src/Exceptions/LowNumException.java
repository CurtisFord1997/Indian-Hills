package Exceptions;

public class LowNumException extends Exception {
    public LowNumException(){
        super(" needs to be greater than 0");
    }
}
