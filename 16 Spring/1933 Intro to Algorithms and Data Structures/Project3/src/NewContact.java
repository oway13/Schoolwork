/**
 * Created by kormi001 on 3/8/16.
 */
public class NewContact extends Contact{
    private String email = "";
    private String group = "";
    private String quickRef = "";

    public NewContact(String nname){
        setName(nname);
    }
    public NewContact(){}


    public String getEmail() {
        return email;
    }

    public String getGroup() {
        return group;
    }

    public String getQuickRef() {
        return quickRef;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public void setQuickRef(String quickRef) {
        this.quickRef = quickRef;
    }

    public String toString(){
        return getName()+"\n"+getPhone()+"\n"+getAddress()+"\n"+getComments()+"\n"
                +getEmail()+"\n"+getGroup()+"\n"+getQuickRef();
    }

    /*public boolean equals(NewContact c) {
        return super.equals(c) && getEmail().equals(c.getEmail()) && getGroup().equals(c.getGroup()) && getQuickRef().equals(c.getQuickRef());
    }*/



}
