/**
 * Created by Wyatt on 2/8/2016.
 */
public class RomanNumeralTest {
    public static void main(String[] args){
        int count = 0;
        while (count < 2500){
            count++;
            RomanNumeral r4 = new RomanNumeral(count);
            System.out.println(r4.toString());
        }

        RomanNumeral r1 = new RomanNumeral(66);
        RomanNumeral r2 = new RomanNumeral(199);
        RomanNumeral r3 = new RomanNumeral(2499);
        System.out.println(r1.compareTo(r2));
        System.out.println(r3.compareTo(r1));
        System.out.println(r2.compareTo(r2));
        System.out.println(r1.toString());
        System.out.println(r2.toString());
        System.out.println(r3.toString());
        System.out.println(r1.toInt());
        System.out.println(r2.toInt());
        System.out.println(r3.toInt());

    }
}
