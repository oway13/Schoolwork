/**
 * Created by Wyatt on 4/17/2016.
 */
import java.util.Random;

public class PassengerMaker implements Event {
    private int[] destins;
    private int[] arrival;
    private int start;

    public PassengerMaker(int[] arrval, int[] stops, int start){
        arrival = arrval;
        destins = stops;
        this.start = start;
    }

    private int selectDest(){
        Random rand = new Random();
        int n = start;
        while(n == start){
            n = destins[rand.nextInt(destins.length-1)];
        }
        return n;
    }

    private int arrive(){
        Random rand = new Random();
        int ret;
        if(start == 1 || start == 2 || start == 3 || start == 4 || start == 18 || start == 20 || start == 19
                || start == 21 || start == 22){
            ret = Math.max(arrival[rand.nextInt(arrival.length-1)],0);
        } else if( start == 5 || start == 6 || start == 7){
            ret = arrival[rand.nextInt(arrival.length-1)]-5;
        }else{
            ret = arrival[rand.nextInt(arrival.length-1)];
        }
        return ret;
    }

    public void run() {
        //Updates Stop Statistics with each passenger creation
        TrainSim.stats.stopUpdate(TrainSim.stops[start]);
        int dest = selectDest();
        int dir;
        if(dest < start) dir = -1; else dir = 1;
        TrainSim.schedule.add(new PassengerMaker(arrival,destins, start), arrive());
        Passenger pass = new Passenger((int) TrainSim.schedule.getCurrentTime(), selectDest());
        if(dir == -1) TrainSim.stops[start].addWest(pass); else TrainSim.stops[start].addEast(pass);

    }
}
