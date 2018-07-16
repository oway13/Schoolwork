/**
 * Created by Wyatt on 4/17/2016.
 */
public class TrainEvent implements Event {
    private Train train;
    private int id;
    private int stop;

    public TrainEvent(int stop, int id, Train train){
        this.train = train;
        this.id = id;
        this.stop = stop;
    }

    //Removes all passengers that go to this stop
    //Fills Train Cars with passengers from the correct Q at the current stop
    //Calls Next Stop
    //Passengers Leave train at 2 seconds each, passengers board at 1 second each. These happen concurrently

    public void run() {
        int board = 0;
        int depart = 0;
        //Updates Train Statistics
        TrainSim.stats.trainUpdate(train);
        //Boarding and Emptying
        for(TrainCar tc : train.trainCars){
            //Departing
            depart+=tc.removeAtStop(stop);
            //boarding
            int space = 50-tc.getPass();
            for(int i = 1; i <= space; i++){
                if(getDirection() == -1){
                    if(TrainSim.stops[stop].westLength() > 0){
                        Passenger p = TrainSim.stops[stop].popWest();
                        p.setBoardingTime((int) TrainSim.schedule.getCurrentTime());
                        tc.addPass(p);
                        board++;
                    } else{
                        break;
                    }
                } else{
                    if(TrainSim.stops[stop].eastLength() > 0){
                        Passenger p = TrainSim.stops[stop].popEast();
                        p.setBoardingTime((int) TrainSim.schedule.getCurrentTime());
                        tc.addPass(p);
                        board++;
                    }
                    else{
                        break;
                    }
                }
            }
        }//end boarding

        nextStop();
        TrainSim.schedule.add(new TrainEvent(train.getStop(), id, train), 180+Math.max(Math.max(board, depart),15));


    }

    public int getDirection(){
       return train.getDirection();
    }

    //Moves the train to the next stop
    //Skips a stop if a train is at the station
    private void nextStop(){
        while(TrainSim.lightRail[train.getNextStop()] != null){
             train.nextStop();
        }
        TrainSim.lightRail[stop] = null;
        TrainSim.lightRail[train.nextStop()] = train;
    }



}
