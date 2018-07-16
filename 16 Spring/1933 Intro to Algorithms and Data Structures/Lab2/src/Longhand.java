/**
 * Step 5
 */
public class Longhand {

    public static void main(String[] args) {
        String inDollars = args[0].substring(1,args[0].length());
        String cents;
        int dollars;
        if(inDollars.contains(".")) {
            String[] dollarsCents = inDollars.split("\\.");
            cents = dollarsCents[1];
            dollars = Integer.valueOf(dollarsCents[0]);
        }else{
            cents = "00";
            dollars = Integer.valueOf(inDollars);
        }
        String outDollars = " and " + cents + "/100 dollars.";

        if (dollars % 100 != 0){
            outDollars = numToWord((dollars % 100)) + outDollars;
            dollars -= dollars%100;
        }
        if(dollars % 1000 != 0){
            outDollars = numToWord((dollars % 1000)/100) + " hundred " + outDollars;
            dollars -= dollars%1000;
        }
        if (dollars % 100000 != 0) {
            outDollars = numToWord((dollars % 100000)/1000) + " thousand " + outDollars;
            dollars -= dollars%100000;
        }else if(dollars % 1000000 != 0){
            outDollars = "thousand " + outDollars;
        }
        if (dollars % 1000000 != 0){
            outDollars = numToWord((dollars % 1000000)/100000) + " hundred " + outDollars;
            dollars -= dollars%1000000;
        }
        if (dollars % 10000000 != 0){
            outDollars = numToWord((dollars%10000000)/1000000) + " million " + outDollars;
        }

        System.out.println(outDollars);





    }

    public static String numToWord(int n){
        String strVal;
        if (n < 20){
            switch(n) {
                case 1:
                    strVal = "one";
                    break;
                case 2:
                    strVal = "two";
                    break;
                case 3:
                    strVal = "three";
                    break;
                case 4:
                    strVal = "four";
                    break;
                case 5:
                    strVal = "five";
                    break;
                case 6:
                    strVal = "six";
                    break;
                case 7:
                    strVal = "seven";
                    break;
                case 8:
                    strVal = "eight";
                    break;
                case 9:
                    strVal = "nine";
                    break;
                case 10:
                    strVal = "ten";
                    break;
                case 11:
                    strVal = "eleven";
                    break;
                case 12:
                    strVal = "twelve";
                    break;
                case 13:
                    strVal = "thirteen";
                    break;
                case 14:
                    strVal = "fourteen";
                    break;
                case 15:
                    strVal = "fifteen";
                    break;
                case 16:
                    strVal = "sixteen";
                    break;
                case 17:
                    strVal = "seventeen";
                    break;
                case 18:
                    strVal = "eighteen";
                    break;
                case 19:
                    strVal = "nineteen";
                    break;
                default:
                    strVal = "";
                    break;

            }
            return strVal;
        }else{
            switch(n/10){
                case 2: strVal = "twenty";
                    break;
                case 3: strVal = "thirty";
                    break;
                case 4: strVal = "forty";
                    break;
                case 5: strVal = "fifty";
                    break;
                case 6: strVal = "sixty";
                    break;
                case 7: strVal = "seventy";
                    break;
                case 8: strVal = "eighty";
                    break;
                case 9: strVal = "ninety";
                    break;
                default:
                    strVal = "";
                    break;
            }
            return strVal+" "+numToWord(n%10);
        }

    }
}
