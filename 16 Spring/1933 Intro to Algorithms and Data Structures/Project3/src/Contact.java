/**
 * Created by Wyatt on 2/23/2016.
 */
public class Contact {

    private String name;
    private long phone = 0;
    private String address = " ";
    private String comments = " ";

    public Contact(String name){
        this.name = name;
    }
    public Contact(){}

    public String getName(){return name;}
    public long getPhone(){return phone;}
    public String getAddress(){return address;}
    public String getComments(){return comments;}

    public void setName(String n){name = n;}
    public void setPhone(long p){phone = p;}
    public void setAddress(String a){address = a;}
    public void setComments(String c){comments = c;}

    public String toString(){
        return name+"\n"+phone+"\n"+address+"\n"+comments;
    }

    public boolean equals(Contact c){
        if(name.equals(c.getName()) && phone == c.getPhone() && address.equals(c.getAddress()) && comments.equals(c.getComments())){
            return true;
        }
        return false;

    }

   /* public static void main(String[] args) {
        Contact c1 = new Contact("Brito");
        Contact c2 = new Contact("Sam");

        System.out.println(c1.equals(c2));
        c1.setPhone(5);
        c2.setPhone(5);
        c1.setAddress("Ayy St.");
        c2.setAddress("Ayy St.");
        c1.setComments("Nullerino");
        c2.setComments("lmao");
        System.out.println(c1.equals(c2));
        System.out.println(c1.toString());
        System.out.println(c2.toString());
        c1.setName("Sam");
        c2.setComments("Nullerino");
        System.out.println(c1.equals(c2));


    }*/


}
