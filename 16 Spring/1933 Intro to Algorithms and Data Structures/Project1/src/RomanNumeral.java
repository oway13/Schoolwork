public class RomanNumeral {
	//Part 1: Roman Numeral
	//place your methods in here

    private int inVal;
    private static String UNDEFINED = "-100";
    private String numeral[] = {"I", "V", "X", "L", "C", "D", "M" };


    public RomanNumeral(int integerValue){
        if (integerValue >= 1 && integerValue <= 2500) {
            inVal = integerValue;
        } else{
            throw new IllegalArgumentException("Argument must be an integer between 1 and 2500");
        }
    }

    public String toString(){
        if (inVal >=1 && inVal <= 2500){
            return toRoman(inVal/1000, 6) + toRoman((inVal/100) % 10, 4) +
                    toRoman((inVal/10)%10, 2) + toRoman(inVal % 10, 0);
        } else{
            return UNDEFINED;
        }
    }

    public int toInt(){
        return inVal;
    }

    public int compareTo(RomanNumeral r){
        if (r.toInt() > inVal) {
            return -1;
        } else if (r.toInt() == inVal){
            return 0;
        } else if (r.toInt() < inVal){
            return 1;
        } else {
            return Integer.valueOf(UNDEFINED);
        }
    }

    private String toRoman(int number, int num){
        String romNum;
        switch(number){
            case 1: romNum = numeral[num];
                break;
            case 2: romNum = numeral[num]+numeral[num];
                break;
            case 3: romNum = numeral[num]+numeral[num]+numeral[num];
                break;
            case 4: romNum = numeral[num]+numeral[num+1];
                break;
            case 5: romNum = numeral[num+1];
                break;
            case 6: romNum = numeral[num+1]+numeral[num];
                break;
            case 7: romNum = numeral[num+1]+numeral[num]+numeral[num];
                break;
            case 8: romNum = numeral[num+1]+numeral[num]+numeral[num]+numeral[num];
                break;
            case 9: romNum = numeral[num]+numeral[num+2];
                break;
            default: romNum = "";
                break;
        }
        return romNum;
    }

}
