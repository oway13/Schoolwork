/**
 * Command line Demo
 */
public class MyProg {
    public static void main(String[] args) {
        for (int i = 0; i < args.length ; i++) {
            System.out.format("For argument %d, you typed in: %s\n", i, args[i]);
        }
    }
}
