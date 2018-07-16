/**
 * Created by Wyatt on 4/17/2016.
 */
public class Stop {
    private int id;
    private Q1 eastbound = new Q1();
    private Q1 westbound = new Q1();
    private String name;



    public Stop(int id, String name){
        this.id=id;
        this.name=name;
    }

    public int getId() {
        return id;
    }
    public String getName() {
        return name;
    }

    public void addEast(Passenger p){
        eastbound.add(p);
    }
    public void addWest(Passenger p){
        westbound.add(p);
    }

    public Passenger popEast(){
        return (Passenger) eastbound.remove();
    }
    public Passenger popWest(){
        return (Passenger) westbound.remove();
    }

    public int eastLength(){
        return eastbound.length();
    }
    public int westLength(){
        return westbound.length();
    }

}
