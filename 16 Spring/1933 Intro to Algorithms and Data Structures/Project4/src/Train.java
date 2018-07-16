/**
 * Created by Wyatt on 4/17/2016.
 */
public class Train {
    TrainCar[] trainCars;
    private int direction; //-1 for westbound, 1 for eastbound
    private int stop;

    public Train(int cars, int stop, int direction){
        trainCars = new TrainCar[cars];
        for(int i = 0; i<cars; i++){
            trainCars[i] = new TrainCar();
        }
        this.stop = stop;
        this.direction = direction;
    }
    public int getPass(){
        int ret = 0;
        for(TrainCar tc : trainCars){
            ret+=tc.getPass();
        }
        return ret;
    }
    public int getNextStop(){
        if(stop == 0){
            direction = 1;
        } else if(stop == 22){
            direction = -1;
        }
        return stop+direction;
    }
    public int nextStop(){
        if(stop == 0){
            direction = 1;
        } else if(stop == 22){
            direction = -1;
        }
        stop += direction;
        return stop;
    }
    public int getStop() {
        return stop;
    }
    public int getDirection() {
        return direction;
    }

}
