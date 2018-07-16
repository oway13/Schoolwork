public class Prime {
  //Part 2: Primes
  //Place your methods in here


    private static int primeCounter = -10;

    public static boolean isPrime(int p){
        boolean prime = true;
        int count = 1;
        while (count < Math.ceil(p/2)){
            count++;
            if (p > 1 && p % count == 0){
                prime = false;
                break;
            }
        }
        return prime;
    }

    public static int getPrime(){
        if (primeCounter == -10){
            primeCounter = 2;
        } else{
            primeCounter++;
            while(!isPrime(primeCounter)){
                primeCounter++;
            }
        }
        return primeCounter;
    }

    public static void reset(){
        primeCounter = -10;
    }
    public static void reset(int n){
        primeCounter = n-1;
        getPrime();
    }

    public static int sumPrimes(int n){
        int sum = 0;
        int count = 0;
        while(count < n){
            count++;
            getPrime();
            sum += primeCounter;
        }
        return sum;
    }


}
