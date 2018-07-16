/**
 * Created by Wyatt on 3/31/2016.
 */
public class ContactLinkedList extends MyNodeList {
    private int ptr = 0;
    private MyNodeList cllist;

    public ContactLinkedList() {
        cllist = new MyNodeList();
    }

    public Contact find(String name) {
        int start = ptr;
        Contact result = null;

        while (ptr < cllist.size()) {
            if (cllist.get(ptr) != null) {
                if (((Contact) cllist.get(ptr)).getName().contains(name)) {
                    result = (Contact) cllist.get(ptr);
                    break;
                }
            }
            if (ptr + 1 == start) {
                break;
            } else {
                if (ptr < cllist.size()) {
                    ptr++;
                } else {
                    ptr = 0;
                }
            }
        }
        return result;
    }

    public Contact remove() {
        return (Contact) (cllist.remove(ptr));
    }

    public Contact getCurrent() {
        return (Contact) cllist.get(ptr);
    }

    public Contact get(int index) {
        if (index > cllist.size() || index < 0) {
            return null;
        }
        return (Contact) cllist.get(index);
    }

    public Contact next() {
        ptr++;
        if (ptr >= cllist.size()) {
            ptr = 0;
        }
        return (Contact) cllist.get(ptr);
    }

    public Contact previous() {
        ptr--;
        if (ptr < 0) {
            ptr = cllist.size() - 1;
        }
        return (Contact) cllist.get(ptr);
    }

    public void sort() {
        int count = 0;
        while (count < cllist.size()) {
            int c2 = 0;
            while (c2 < cllist.size() - count - 1) {
                if (cllist.get(c2) != null && cllist.get(c2 + 1) != null && ((Contact) cllist.get(c2)).getName().compareTo(((Contact) cllist.get(c2 + 1)).getName()) > 0) {
                    Contact temp = (Contact) cllist.get(c2);
                    cllist.set(c2, cllist.get(c2 + 1));
                    cllist.set(c2 + 1, temp);
                }
                c2++;
            }
            count++;
        }
    }

    public boolean addInOrder(Contact c) {
        boolean ret = add(c);
        sort();
        return ret;
    }
}