/**
 * Created by Wyatt on 2/28/2016.
 */
public class Ship {
    private int[] pos = new int[6];
    private int dir;
    private int health = 3;


    //Direction is vertical if dir = 1, horizontal if dir = 0
    //m = x coord, n = y coord
    //Health: 0 = stern, 1 = center, 2 = bow
    //Position: 0,1 = stern, 2,3 = center, 4,5 = bow

    public Ship(int m, int n, int d){
        pos[2] = m;
        pos[3] = n;
        dir = d;
        switch(dir) {
            case 0:
                pos[0] = m - 1;
                pos[1] = n;
                pos[4] = m + 1;
                pos[5] = n;
                break;
            case 1:
                pos[0] = m;
                pos[1] = n - 1;
                pos[4] = m;
                pos[5] = n + 1;
                break;
            default:
                break;
        }
    }

    public int getHealth() {
        return health;
    }

    public int[] getPos() {
        return pos;
    }

    public String hit(int x, int y){
        String retstr = "";
        health--;
        if(getHealth() == 0){
            retstr = " and sunk. (+1 point)";
        } else{
            retstr = ". (+1 point)";
        }
        return retstr;
    }

    public String toString(){
        String retstring = "Coordinates: ("+pos[0]+", "+pos[1]+"), ("+pos[2]+", "+pos[3]+"), ("+pos[4]+", "+pos[5]+") \n" +
                "Health: "+getHealth();
        return retstring;
    }



}
