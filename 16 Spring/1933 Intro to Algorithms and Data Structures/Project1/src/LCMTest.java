/**
 * Created by Wyatt on 2/8/2016.
 */
public class LCMTest {
    public static void main(String[] args) {
        int count = 0;
        while(count < 100) {
            count++;
            LCM l = new LCM(count);
            System.out.println("Between "+count+" and 4");
            System.out.println("LCM: "+l.getLCM(4));
            System.out.println("GCD: "+l.getGCD(4));
            System.out.println("Ratio: "+l.getRatio(4));
        }
    }
}
