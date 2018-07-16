/**
 * Created by Wyatt on 4/17/2016.
 */
public class TrainCar {
    private Q1 car = new Q1();

    public void addPass(Passenger p){
        car.add(p);
    }

    public int removeAtStop(int stop){
        int wait = 0;
        Q1 after = new Q1();
        while(car.length() > 0){
            Passenger p = (Passenger) car.remove();
            if(p.getDestination() == stop){
                p.setArrivalTime((int) TrainSim.schedule.getCurrentTime());
                TrainSim.stats.passUpdate(p);
                wait+=2;
            } else{
                after.add(p);
            }
        }
        car = after;
        return wait;
    }

    public int getPass(){return car.length();}


}
