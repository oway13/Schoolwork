/**
 * Created by Wyatt on 2/8/2016.
 */
public class PrimeTest {
    public static void main(String[] args) {
        System.out.println("Instantiated");
        PrimeInst p = new PrimeInst();
        PrimeInst p2 = new PrimeInst();
        System.out.println(p.getPrime());
        System.out.println(p2.getPrime());
        p.reset(2);
        System.out.println(p2.getPrime());
        System.out.println(p2.sumPrimes(4));
        System.out.println(p2.getPrime());
        System.out.println(p.getPrime());

        System.out.println("Static");
        Prime p3 = new Prime();
        Prime p4 = new Prime();
        System.out.println( p3.getPrime());
        System.out.println(p4.getPrime());
        System.out.println(Prime.getPrime());
        p3.reset(2);
        System.out.println(p4.getPrime());
        System.out.println(p4.sumPrimes(4));
        System.out.println(p4.getPrime());
        System.out.println(p3.getPrime());
    }
}
