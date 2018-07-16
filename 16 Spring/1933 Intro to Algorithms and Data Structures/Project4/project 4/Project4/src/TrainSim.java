/**
 * Created by Wyatt on 4/17/2016.
 */
//Created by Wyatt Kormick (4932481) and Sam Iverson (4530385)
//A lot of infrastructure code like the queues was downloaded from the lecture notes
import java.util.Random;

public class TrainSim {
    //Main Program Method
    public static void main(String[] args) {
        int runTime = 15000;
        stops = stopInit();
        lightRail = trains();
        for(int i = 0; i<23; i++){
            schedule.add(new PassengerMaker(arrivalTime, destinations, i), 1);
        }

        while(schedule.getCurrentTime() < runTime){
            schedule.remove().run();
        }

        stats.report();
    }

    //statics
    private static int[] arrivalTime = {53, 53, 45, 45, 45, 36, 36, 36, 36, 30, 30, 24, 24, 24, 24, 15, 15, 15, 7, 7};
    private static int[] destinations = {0,0,0,0,0, 1,1,1,1,1, 2,2,2,2,2, 3,3,3,3,3, 4,4,4,4,4, 18,18,18,18,18, 20,20,20,20,20,
                                 19,19,19,19,19, 21,21,21,21,21, 22,22,22,22,22, 5,5,5, 6,6,6, 7,7,7, 8 ,9, 10,
                                 11, 12, 13, 14, 15, 16, 17};
    static int trainCars = 2;
    static int trainAmount = 17; //22 is the maximum, because there has to be a stop open to go to the next stop
    static PQ schedule = new PQ();
    static Stop[] stops;
    static Train[] lightRail;
    static Statistics stats = new Statistics();


    //methods

        //creates all of the stops
    private static Stop[] stopInit() {
        Stop targetField = new Stop(0, "Target Field");
        Stop hennepinAve = new Stop(1, "Warehouse District / Hennepin Avenue");
        Stop nicolletMall = new Stop(2, "Nicollet Mall");
        Stop govPlaza = new Stop(3, "Government Plaza");
        Stop usBank = new Stop(4, "US Bank Stadium");
        Stop westBank = new Stop(5, "UMN West Bank");
        Stop eastBank = new Stop(6, "UMN East Bank");
        Stop stadiumVillage = new Stop(7, "UMN Stadium Village");
        Stop prospectPark = new Stop(8, "Prospect Park");
        Stop westgate = new Stop(9, "Westgate");
        Stop raymondAve = new Stop(10, "Raymond Avenue");
        Stop fairviewAve = new Stop(11, "Fairview Avenue");
        Stop snellingAve = new Stop(12, "Snelling Avenue");
        Stop hamlineAve = new Stop(13, "Hamline Avenue");
        Stop lexingtonPkwy = new Stop(14, "Lexington Parkway");
        Stop victoriaSt = new Stop(15, "Victoria Street");
        Stop daleSt = new Stop(16, "Dale Street");
        Stop westernAve = new Stop(17, "Western Avenue");
        Stop capitolSt = new Stop(18, "Capitol / Rice Street");
        Stop robertSt = new Stop(19, "Robert Street");
        Stop tenthSt = new Stop(20, "10th Street");
        Stop central = new Stop(21, "Central");
        Stop unionDepot = new Stop(22, "Union Depot");

        Stop[] stops = {targetField, hennepinAve, nicolletMall, govPlaza, usBank, westBank,
                eastBank, stadiumVillage, prospectPark, westgate, raymondAve, fairviewAve, snellingAve,
                hamlineAve, lexingtonPkwy, victoriaSt, daleSt, westernAve, capitolSt, robertSt, tenthSt,
                central, unionDepot};
        return stops;
    }

        //Creates an array of the same length as the number of stops. Randomly distributes trainEvents and associates trains with them
    private static Train[] trains(){
        Random r = new Random();

        Train[] trains = new Train[23];
        int count = 0;
        for (int i = 0; i<23; i++){

            if(count < trainAmount) {
                int y = r.nextInt(22);
                while (trains[y] != null){
                    y = r.nextInt(22);
                }
                count++;
                if (i == 0) { //Checks if the train is at the beginning: forces to go eastward
                    trains[i] = new Train(trainCars, i, 1);
                    schedule.add(new TrainEvent(i, count, trains[i]), 1);
                } else if (i == 22) { //Checks if the train is at the end: forces to go westward
                    trains[i] = new Train(trainCars, i, -1);
                    schedule.add(new TrainEvent(i, count, trains[i]), 1);
                } else {
                    int n = (int) Math.pow(-1, r.nextInt(100)); //Randomly assigns direction of the train
                    trains[i] = new Train(trainCars, i, n);
                    schedule.add(new TrainEvent(i, count, trains[i]), 1);
                }
            }
        }
        return trains;
    }
}
