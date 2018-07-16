/**
 * Created by Wyatt on 3/31/2016.
 */
public class ContactArrayList extends MyArrayList {
    private int ptr = 0;
    private MyArrayList calist;

    public ContactArrayList(){ calist = new MyArrayList();}
    public ContactArrayList(int n){ calist = new MyArrayList(n);}

    public boolean add(Contact c){
        return calist.add(c);
    }

    public Contact find(String name) {
        int start = ptr;
        Contact result = null;

        while (ptr < calist.size()) {
            if (calist.get(ptr) != null) {
                if (((Contact) calist.get(ptr)).getName().contains(name)) {
                    result = (Contact) calist.get(ptr);
                    break;
                }
            }
            if (ptr + 1 == start) {
                break;
            } else {
                if (ptr < calist.size()) {
                    ptr++;
                } else {
                    ptr = 0;
                }
            }
        }
        return result;
    }

    public Contact remove(){
        return (Contact) calist.remove(ptr);
    }

    public Contact getCurrent(){
        return (Contact) calist.get(ptr);
    }

    public Contact get(int index){
        if (index > calist.size() || index < 0){
            return null;
        }
        return (Contact) calist.get(index);
    }

    public Contact next(){
        ptr++;
        if (ptr >= calist.size()){
            ptr = 0;
        }
        return (Contact) calist.get(ptr);
    }

    public Contact previous(){
        ptr--;
        if (ptr < 0){
            ptr = calist.size()-1;
        }
        return (Contact) calist.get(ptr);
    }

    public void sort(){
        int count = 0;
        while (count < calist.size()){
            int c2 = 0;
            while (c2 < calist.size()-count-1){
                if(calist.get(c2) != null && calist.get(c2+1) != null && ((Contact) calist.get(c2)).getName().compareTo(((Contact) calist.get(c2+1)).getName()) > 0){
                    Contact temp = (Contact) calist.get(c2);
                    calist.set(c2,calist.get(c2+1));
                    calist.set(c2+1,temp);
                }
                c2++;
            }
            count++;
        }
    }

    public boolean addInOrder(Contact c){
        boolean ret = add(c);
        sort();
        return ret;
    }


}
