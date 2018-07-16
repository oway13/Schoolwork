/**
 * Created by Wyatt on 4/17/2016.
 */
public class Passenger {
    private int stop; //Destination
    private int startTime; //Time of Creation
    private int arrivalTime; //Time of Deletion
    private int boardingTime; //Time loaded onto Train Car

    public int getDestination() {
        return stop;
    }

    public Passenger(int creation, int destination){
        stop = destination;
        startTime = creation;
    }

    public void setArrivalTime(int arrivalTime) {
        this.arrivalTime = arrivalTime;
    }
    public int getArrivalTime() {
        return arrivalTime;
    }
    public int getStartTime() {
        return startTime;
    }
    public int getStop() {
        return stop;
    }
    public int getBoardingTime() {
        return boardingTime;
    }
    public void setBoardingTime(int boardingTime) {
        this.boardingTime = boardingTime;
    }
}
