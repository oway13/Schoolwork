/**
 * Created by Wyatt on 2/28/2016.
 */
import java.util.Scanner;

public class MainGame {
    public static void main(String[] args) {
        MainGame newgame = new MainGame();
    }

    private Scanner s = new Scanner(System.in);

    public MainGame() {
        s.useDelimiter("\n");
        boolean val = false;
        while (!val) {
            System.out.println("Welcome to Battleship! \nWould you like to PLAY, DEBUG, or EXIT?");
            String start = s.next();
            if (start.equalsIgnoreCase("play")) {
                val = true;
                play();
            } else if (start.equalsIgnoreCase("debug")){
                val = true;
                debug();
            } else if (start.equalsIgnoreCase("exit")){
                val = true;
                break;
            } else{
                System.out.println("I'm sorry I didn't understand that.");
            }

        }
    }

    private void play(){
        int row;
        int col;
        while (true){
            System.out.println("What size game board would you like to play on?\n" +
                    "Input should be in the form: (3-10) (3-10) Ex:5 9 creates a board with 5 rows and 9 columns");
            String size = s.next();
            String[] dimens = size.split(" ");
            row = Integer.valueOf(dimens[0]);
            col = Integer.valueOf(dimens[1]);
            if (row < 3 || row > 10 || col < 3 || row > 10) {
                System.out.println("Invalid Dimensions Entered. Please try again.");
            } else{
                break;
            }
        }
        BattleShipBoard newboard = new BattleShipBoard(row, col);
        //Ship Locations for testing
        System.out.println(newboard.toString());
        System.out.println("There are "+newboard.getShips() + " ships on the board.");
        System.out.println("The current best score is: "  +newboard.getHigh());
        System.out.println("The x-coordinates are the columns of the board and are numbered starting from left to right, 1 through " + (newboard.getColumns()));
        System.out.println("The y-coordinates are the rows of the board and are numbered from top to bottom, 1 through " + (newboard.getRows()));
        while(newboard.getSinks() != newboard.getShips()){
            int xcoord;
            int ycoord;
            while (true) {
                System.out.println("Enter the x, and y coordinates of your shot in the form x y: ");
                String shot = s.next();
                String[] coords = shot.split(" ");
                xcoord = Integer.valueOf(coords[0])-1;
                ycoord = Integer.valueOf(coords[1])-1;
                if (xcoord < 0 || xcoord > newboard.getColumns()-1 || ycoord < 0 || ycoord > newboard.getRows()-1 ) {
                    System.out.println("Invalid Coordinates Entered. Please try again.");
                } else {
                    break;
                }
            }
            System.out.println(newboard.Shot(xcoord, ycoord));
        }
        System.out.println("Congratulations! All the ships have been sunk!");
        System.out.println("Your score is: " + newboard.getPoints());
        if (newboard.getHigh() == "Not Set" || Integer.valueOf(newboard.getHigh().toString()) < (newboard.getPoints())){
            System.out.println("You have the new high score!");
            BattleShipBoard.setHigh(newboard.getPoints());
        } else{
            System.out.println("The best score is still: "+newboard.getHigh());
        }
    }

    private void debug(){
        int row;
        int col;
        while (true){
            System.out.println("What size game board would you like to play on?\n" +
                    "Input should be in the form: (3-10) (3-10) Ex:5 9 creates a board with 5 rows and 9 columns");
            String size = s.next();
            String[] dimens = size.split(" ");
            row = Integer.valueOf(dimens[0]);
            col = Integer.valueOf(dimens[1]);
            if (row < 3 || row > 10 || col < 3 || row > 10) {
                System.out.println("Invalid Dimensions Entered. Please try again.");
            } else{
                break;
            }
        }
        BattleShipBoard newboard = new BattleShipBoard(row, col);
        System.out.println(newboard.toString());
        System.out.println("There are "+newboard.getShips() + " ships on the board.");
        System.out.println("The current best score is: "  +newboard.getHigh());
        System.out.println("The x-coordinates are the columns of the board and are numbered starting from left to right, 1 through " + (newboard.getColumns()));
        System.out.println("The y-coordinates are the rows of the board and are numbered from top to bottom, 1 through " + (newboard.getRows()));
        while(newboard.getSinks() != newboard.getShips()){
            int xcoord;
            int ycoord;
            while (true) {
                System.out.println("Enter the x, and y coordinates of your shot in the form x y: ");
                String shot = s.next().trim();
                String[] coords = shot.split(" ");
                xcoord = Integer.valueOf(coords[0])-1;
                ycoord = Integer.valueOf(coords[1])-1;
                if (xcoord < 0 || xcoord > newboard.getColumns()-1 || ycoord < 0 || ycoord > newboard.getRows()-1 ) {
                    System.out.println("Invalid Coordinates Entered. Please try again.");
                } else {
                    break;
                }
            }
            System.out.println(newboard.Shot(xcoord, ycoord));
            System.out.println(newboard.toString());
        }
        System.out.println("Congratulations! All the ships have been sunk!");
        System.out.println("Your score is: " + newboard.getPoints());
        if (newboard.getHigh() == "Not Set" || Integer.valueOf(newboard.getHigh().toString()) < (newboard.getPoints())){
            System.out.println("You have the new high score!");
            BattleShipBoard.setHigh(newboard.getPoints());
        } else{
            System.out.println("The best score is still: "+newboard.getHigh());
        }
    }


}


