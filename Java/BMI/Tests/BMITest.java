import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class BMITest {
    public  static BMI[] arrayOfBMIs = new BMI[6];//0: default, 1: under min, 2: at min, 3: at max, 4:over max, 5: setters doing crazy stuf
    public static void main(String[]args){

    }

    /**
     * tests sending the constructor garbage
     * @throws Exception
     */
    @Test
    void underMinTest() throws Exception{
        arrayOfBMIs[1] = new BMI(" ","",0,0,0);
        assertEquals(170,arrayOfBMIs[0].getHeight());
        assertEquals(70, arrayOfBMIs[0].getWeight());
        assertEquals(1, arrayOfBMIs[0].getUnits());
        assertEquals(24.2, Math.round(arrayOfBMIs[0].calcBMI()*10)/10d);
    }

    /**
     * tests the lowerbounds of what we can send the class
     * @throws Exception
     */
    @Test
    void atMinTest() throws Exception{
        arrayOfBMIs[0] = new BMI(" ","",1,1,1);
        assertEquals(1,arrayOfBMIs[0].getHeight());
        assertEquals(1, arrayOfBMIs[0].getWeight());
        assertEquals(1, arrayOfBMIs[0].getUnits());
        assertEquals(10000.0, arrayOfBMIs[0].calcBMI());
    }

    /**
     * tests large numbers for the weight and height, and the max for units
     * @throws Exception
     */
    @Test
    void atMaxTest() throws Exception{
        arrayOfBMIs[0] = new BMI(" ","",9999,9999,2);
        assertEquals(9999,arrayOfBMIs[0].getHeight());
        assertEquals(9999, arrayOfBMIs[0].getWeight());
        assertEquals(2, arrayOfBMIs[0].getUnits());
        assertEquals(0.1, arrayOfBMIs[0].calcBMI());
    }

    /**
     * tests random height and weight
     * @throws Exception
     */
    @Test
    void overMaxTest() throws Exception{
        arrayOfBMIs[0] = new BMI(" ","",120,60,3);
        assertEquals(60,arrayOfBMIs[0].getHeight());
        assertEquals(120, arrayOfBMIs[0].getWeight());
        assertEquals(1, arrayOfBMIs[0].getUnits());
        assertEquals(333.3, arrayOfBMIs[0].calcBMI());
    }

    /**
     * tests default constructor
     * @throws Exception
     */
    @Test
    void defaultTest() throws Exception{
        arrayOfBMIs[0] = new BMI();
        assertEquals(170,arrayOfBMIs[0].getHeight());
        assertEquals(70, arrayOfBMIs[0].getWeight());
        assertEquals(1, arrayOfBMIs[0].getUnits());
        assertEquals(24.2, arrayOfBMIs[0].calcBMI());
    }

    /**
     * tests setting a height too small
     * @throws Exception
     */
    @Test
    void wrongTestHeight() throws Exception{
        arrayOfBMIs[5] = new BMI();
        arrayOfBMIs[5].setHeight(0);
        assertEquals (170, arrayOfBMIs[5].getHeight());
    }

    /**
     * tests setting a weight too low
     * @throws Exception
     */
    @Test
    void wrongTestWeight() throws Exception{
        arrayOfBMIs[5] = new BMI();
        arrayOfBMIs[5].setWeight(0);
        assertEquals (70, arrayOfBMIs[5].getWeight());
    }

    /**
     * tests setting incorrect units
     * @throws Exception
     */
    @Test
    void wrongTestUnits() throws Exception{
        arrayOfBMIs[5] = new BMI();
        arrayOfBMIs[5].setUnits(0);

        assertEquals (1, arrayOfBMIs[5].getUnits());
    }

    /**
     * tests the output of the toString of the BMI objects
     */
    @Test
    void main(){

        arrayOfBMIs[0] = new BMI();
        System.out.println(arrayOfBMIs[0].toString());
        arrayOfBMIs[1] = new BMI(" ","",0,0,0);
        System.out.println(arrayOfBMIs[1].toString());
        arrayOfBMIs[2] = new BMI(" ","",1,1,1);
        System.out.println(arrayOfBMIs[2].toString());
        arrayOfBMIs[3] = new BMI(" ","",9999,9999, 2);
        System.out.println(arrayOfBMIs[3].toString());
        arrayOfBMIs[4] = new BMI(" ","",24,24,3);
        System.out.println(arrayOfBMIs[4].toString());
        arrayOfBMIs[5] = new BMI();
        System.out.println(arrayOfBMIs[5].toString());
    }
}