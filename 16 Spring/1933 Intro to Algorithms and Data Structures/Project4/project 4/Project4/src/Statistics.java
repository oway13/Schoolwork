/**
 * Created by Wyatt on 4/17/2016.
 */
public class Statistics {
    private int passengers;
    private double averageTrainPassengers;
    private double averageTrainCarPass;
    private int totalTrainPassengers ;
    private int totalTrainCarPass;
    private int totalTrainCars;
    private int totalTrains;
    private double averagePassengerWaitTime;
    private double averageStartToFinish;
    private int totalWaitTime;
    private int totalStartToFinish;
    private int maximumWaitTime ;
    private int maximumStartToFinish;
    private int maximumWaitStop;
    private double[] averagePassStops;
    private int[] totalPassStops;
    private int[] update;

    public Statistics(){
        passengers = 0;
        totalTrainCars = 0;
        totalTrains = 0;
        totalStartToFinish = 0;
        totalWaitTime = 0;
        totalTrainCarPass = 0;
        totalTrainPassengers = 0;
        maximumStartToFinish = 0;
        maximumWaitStop = 0;
        maximumWaitTime = 0;
        averagePassStops = new double[23];
        update = new int[23];
        totalPassStops = new int[23];

    }




    public void passUpdate(Passenger p){
        passengers++;

        //Start to Finish
        int s2f = p.getArrivalTime()-p.getStartTime();
        totalStartToFinish += s2f;
        maximumStartToFinish = Math.max(maximumStartToFinish, s2f);

        //Wait Time
        int wait = p.getBoardingTime()-p.getStartTime();
        totalWaitTime += wait;
        maximumWaitTime = Math.max(maximumWaitTime, wait);
        if(maximumWaitTime == wait) maximumWaitStop = p.getStop();
    }

    //Updates Stop Average
    public void stopUpdate(Stop s){
        int pass = s.eastLength()+s.westLength();
        update[s.getId()]++;
        maximumWaitStop = Math.max(maximumWaitStop, pass);
        totalPassStops[s.getId()]+=pass;
    }

    //Updates Train Averages
    public void trainUpdate(Train train){
        //Train Averages
        totalTrainPassengers+=train.getPass();
        totalTrains++;

        //Train Car Averages
        for(TrainCar tc : train.trainCars){
            totalTrainCarPass+=tc.getPass();
            totalTrainCars++;
        }


    }

    public void report(){
        averageStartToFinish = totalStartToFinish/passengers;
        averagePassengerWaitTime =totalWaitTime/passengers;
        averageTrainCarPass = totalTrainCarPass/totalTrainCars;
        averageTrainPassengers = totalTrainPassengers/totalTrains;

        System.out.println(TrainSim.trainCars+" Train Cars");
        System.out.println(TrainSim.trainAmount+" Trains");

        //System.out.println("Simulated Green Line Time: "+TrainSim.schedule.getCurrentTime()+" seconds");
        System.out.println("Total Passengers Processed: "+passengers+"\n");

        //System.out.println("Total Passenger Existence Time in seconds: "+totalStartToFinish);
        System.out.println("Average Passenger Existence Time in seconds: "+averageStartToFinish);
        //System.out.println("Maximum Passenger Existence Time in seconds: "+maximumStartToFinish+"\n");

        //System.out.println("Total Passenger Wait Time in seconds: "+totalWaitTime);
        System.out.println("Average Passenger Wait Time in seconds: "+averagePassengerWaitTime);
        System.out.println("Maximum Passenger Wait Time in seconds: "+maximumWaitTime+"\n");

        //System.out.println("Total Train Stops: "+totalTrains);
        //System.out.println("Total Train Car Stops (should be the amount of cars per train times the total train stops): "+totalTrainCars);
        //System.out.println("Average Train Passenger Amount: "+averageTrainPassengers);
        //System.out.println("Average Train Car Passenger Amount: "+averageTrainCarPass+"\n");

        //System.out.println("Maximum Passengers Waiting at a Stop: "+maximumWaitStop);
        //System.out.println("Average Passengers at each stop:");
        for(int i = 0; i<23; i++){
            averagePassStops[i] = totalPassStops[i]/update[i];
            //System.out.println(TrainSim.stops[i].getName()+": "+averagePassStops[i]);
        }

        double averageDowntownWaiters = (averagePassStops[0]+averagePassStops[1]+averagePassStops[2]+averagePassStops[3]+averagePassStops[4]+averagePassStops[18]+averagePassStops[20]+
                averagePassStops[19]+averagePassStops[21]+averagePassStops[22])/10;
        double averageCampusWaiters = (averagePassStops[5]+averagePassStops[6]+averagePassStops[7])/3;
        double averageOtherWaiters = 0;
        for(int i = 8; i<=17; i++){
            averageOtherWaiters+=averagePassStops[i];
        }
        averageOtherWaiters /= 10;

        System.out.println("Average Downtown Waiters: "+ averageDowntownWaiters);
        System.out.println("Average Campus Waiters: "+averageCampusWaiters);
        System.out.println("Average Other Waiters: "+averageOtherWaiters);






    }

}
