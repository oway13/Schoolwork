public class LCM {
	//Part 3: Number with LCM
	//Note: As per the instructions, make sure this class is instantiable 
    private int number;

    public LCM(int num){
       if (num < 0){
           throw new IllegalArgumentException("Number must be a positive integer");
       } else{
           number = num;
       }
    }

    public int getLCM(int n){
        int lcm = Math.max(number, n);
        int count = 0;
        while (count < Math.min(n,number)){
            count++;
            if(count*number % n == 0){
                lcm = count*number;
                break;
            }
        }
        return lcm;
    }

    public int getGCD(int n){
        return (number*n)/(getLCM(n));
    }

    public int getRatio(int n){
        return getLCM(n)/getGCD(n);
    }
}
