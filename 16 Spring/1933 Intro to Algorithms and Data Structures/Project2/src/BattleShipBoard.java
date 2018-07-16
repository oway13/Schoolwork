/**
 * Created by Wyatt on 2/28/2016.
 */
public class BattleShipBoard {

    private int rows;
    private int columns;
    private int[][] board;
    private int size;
    private int points = 0;
    private static Object high = "Not Set";
    private Ship ship1;
    private Ship ship2;
    private Ship ship3;
    private int sinks = 0;
    private int ships = 0;


    //m = rows(y), n = columns(x)

    public BattleShipBoard(int m, int n) {
        rows = m;
        columns = n;
        board = new int[rows][columns];
        size = rows * columns;
        ships();
        mines();
        if (size <= 16) {
            ships = 1;
        } else if (size <= 36) {
            ships = 2;
        } else {
            ships = 3;
        }

    }

    public int getShips() {
        return ships;
    }

    private int[] newMine() {
        int[] pos = new int[2];
        boolean val = false;
        while (!val) {
            int rand[] = {(int) Math.floor(Math.random() * columns), (int) Math.floor(Math.random() * rows)};
            if (board[rand[0]][rand[1]] == 0) {
                val = true;
                pos[0] = rand[0];
                pos[1] = rand[1];
            }
        }
        return pos;
    }

    private void mines() {
        if (size <= 16) {
            int[] mine1 = newMine();
            board[mine1[0]][mine1[1]] = 5;
        } else if (size <= 36) {
            int[] mine1 = newMine();
            board[mine1[0]][mine1[1]] = 5;
            int[] mine2 = newMine();
            board[mine2[0]][mine2[1]] = 5;
        } else {
            int[] mine1 = newMine();
            board[mine1[0]][mine1[1]] = 5;
            int[] mine2 = newMine();
            board[mine2[0]][mine2[1]] = 5;
            int[] mine3 = newMine();
            board[mine3[0]][mine3[1]] = 5;
        }
    }

    //Direction is vertical if dir = 1, horizontal if dir = 0
    private Ship newShip() {
        int xpos = 0;
        int ypos = 0;
        int dir;
        double randir = Math.random();
        if (randir < 0.5) {
            dir = 0;
        } else {
            dir = 1;
        }

        //Set X coordinate. If ship is horizontal
        //Generates a random number until it is at least one away from a side
        if (dir == 0) {
            boolean val = false;
            while (!val) {
                ypos = (int) Math.floor(Math.random() * rows);
                int rand = (int) Math.floor(Math.random() * columns);
                if ((rand > 0) && (rand < (columns - 1)) && (board[ypos][rand] == 0) && (board[ypos][rand + 1] == 0) && (board[ypos][rand - 1] == 0)) {
                    val = true;
                    xpos = rand;
                }
            }
            //Set Y coordinate. If ship isn't horizontal
            //Generates a random number until it is at least one away from a side
        } else {
            boolean val = false;
            while (!val) {
                xpos = (int) Math.floor(Math.random() * columns);
                int rand = (int) Math.floor(Math.random() * rows);
                if ((rand > 0) && (rand < (rows - 1)) && (board[rand][xpos] == 0) && (board[rand + 1][xpos] == 0) && (board[rand - 1][xpos] == 0)) {
                    val = true;
                    ypos = rand;
                }
            }
        }
        Ship ship = new Ship(xpos, ypos, dir);
        return ship;
    }

    private void ships() {
        if (size <= 16) {
            ship1 = newShip();
            board[ship1.getPos()[1]][ship1.getPos()[0]] = 1;
            board[ship1.getPos()[3]][ship1.getPos()[2]] = 1;
            board[ship1.getPos()[5]][ship1.getPos()[4]] = 1;
        } else if (size <= 36) {
            ship1 = newShip();
            board[ship1.getPos()[1]][ship1.getPos()[0]] = 1;
            board[ship1.getPos()[3]][ship1.getPos()[2]] = 1;
            board[ship1.getPos()[5]][ship1.getPos()[4]] = 1;

            ship2 = newShip();
            board[ship2.getPos()[1]][ship2.getPos()[0]] = 2;
            board[ship2.getPos()[3]][ship2.getPos()[2]] = 2;
            board[ship2.getPos()[5]][ship2.getPos()[4]] = 2;
        } else {
            ship1 = newShip();
            board[ship1.getPos()[1]][ship1.getPos()[0]] = 1;
            board[ship1.getPos()[3]][ship1.getPos()[2]] = 1;
            board[ship1.getPos()[5]][ship1.getPos()[4]] = 1;

            ship2 = newShip();
            board[ship2.getPos()[1]][ship2.getPos()[0]] = 2;
            board[ship2.getPos()[3]][ship2.getPos()[2]] = 2;
            board[ship2.getPos()[5]][ship2.getPos()[4]] = 2;

            ship3 = newShip();
            board[ship3.getPos()[1]][ship3.getPos()[0]] = 3;
            board[ship3.getPos()[3]][ship3.getPos()[2]] = 3;
            board[ship3.getPos()[5]][ship3.getPos()[4]] = 3;
        }

    }

    public String toString() {
        String bstring = "";
        int count = 0;
        while (count < board.length) {
            int c2 = 0;
            while (c2 < board[count].length) {
                bstring += Integer.toString(board[count][c2]);
                c2++;
            }
            bstring += "\n";
            count++;
        }
        return bstring;

    }

    //0 = Empty, 1 = Ship1, 2 = Ship2, 3 = Ship3, 5 = Mine, 9 = Missed Shot, 8 = Hit Shot
    public String Shot(int x, int y) {
        String retState;
        switch (board[y][x]) {
            case 1:
                board[y][x] = 8;
                String hit1 = ship1.hit(x, y);
                retState = "A ship was hit" + hit1;
                points++;
                if (hit1.equals(" and sunk. (+1 point)")) {
                    sinks++;
                }
                break;
            case 2:
                board[y][x] = 8;
                String hit2 = ship2.hit(x, y);
                retState = "A ship was hit" + hit2;
                points++;
                if (hit2.equals(" and sunk. (+1 point)")) {
                    sinks++;
                }
                break;
            case 3:
                board[y][x] = 8;
                String hit3 = ship3.hit(x, y);
                retState = "A ship was hit" + hit3;
                if (hit3.equals(" and sunk. (+1 point)")) {
                    sinks++;
                }
                points++;
                break;
            case 0:
                points++;
                if (isClose(x,y) == 1) {
                    retState = "A Miss, but very close. (+1 point)";
                } else if (isClose(x,y) == 2) {
                    retState = "A Miss, but close. (+1 point)";
                } else {
                    retState = "Miss. (+1 point)";
                }
                board[y][x] = 9;
                break;

            case 5:
                points++;
                points++;
                retState = "A Mine was hit. (+2 points)";
                break;
            case 8:
                points++;
                points++;
                retState = "This position has already been shot. It was a hit. (+2 points)";
                break;
            case 9:
                points++;
                points++;
                retState = "This position has already been shot. It was a miss. (+2 points)";
                break;
            default:
                retState = "Invalid Shot";
                break;
        }
        return retState + "\n The current score is: " + points;
    }

    public int getSinks() {
        return sinks;
    }

    public Object getHigh() {
        return high;
    }

    public static void setHigh(Object h) {
        high = h;
    }

    public int getPoints() {
        return points;
    }

    public int getRows() {
        return rows;
    }

    public int getColumns() {
        return columns;
    }

    private int isClose(int x, int y){
        if (board[Math.min(y+1,rows-1)][x] == 1 || board[Math.min(y+1,rows-1)][x] == 2 || board[Math.min(y+1,rows-1)][x] == 3 ||
                board[Math.max(y-1,0)][x] == 1 || board[Math.max(y-1,0)][x] == 2 || board[Math.max(y-1,0)][x] == 3 ||
                board[y][Math.min(x+1,columns-1)] == 1 || board[y][Math.min(x+1,columns-1)] == 2 || board[y][Math.min(x+1,columns-1)] == 3 ||
                board[y][Math.max(x-1, 0)] == 1 || board[y][Math.max(x-1, 0)] == 2 || board[y][Math.max(x-1, 0)] == 3){
            return 1;
        } else if (board[Math.min(y+2,rows-1)][x] == 1 || board[Math.min(y+2,rows-1)][x] == 2 || board[Math.min(y+2,rows-1)][x] == 3 ||
                board[Math.max(y-2,0)][x] == 1 || board[Math.max(y-2,0)][x] == 2 || board[Math.max(y-2,0)][x] == 3 ||
                board[y][Math.min(x+2,columns-1)] == 1 || board[y][Math.min(x+2,columns-1)] == 2 || board[y][Math.min(x+2,columns-1)] == 3 ||
                board[y][Math.max(x-2, 0)] == 1 || board[y][Math.max(x-2, 0)] == 2 || board[y][Math.max(x-2, 0)] == 3){
            return 2;
        }else {
            return 0;
        }
    }

}