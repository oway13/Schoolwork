

/**
 * Created by Wyatt on 3/28/2016.
 */
public class MyNodeList implements MyList {
    Node tail = null;
    Node header;

    public MyNodeList(){
        header = new Node(-1);
        tail = header;
    }

    // Adds the given object to the end of the list.
    // Returns false if the input is null, true otherwise.
    public boolean add(Object o){
        if(o == null){
            return false;
        } else{
            tail.setNext(new Node(o));
            tail = tail.getNext();
            header.setData((int) header.getData()+1);
            return true;
        }


    }

    // Inserts the given object at the given index.
    // Shifts the element at the specified index and any subsequent elements (if any) towards the end of the list
    // So if you have a list of size n, you should be able to insert any object from indices 0 <= index < n.
    // The list should be able to grow if need be.
    // If an index is given not in the range 0 <= index < n, return false. If the given object is null, return false.
    public boolean insert(int index, Object o){
        if(index >= 0 && index < size()){
            Node check = header;
            int count = -1;
            while(count+1 != index){
                count++;
                check = check.getNext();
            }
            check.setNext(new Node(o, check.getNext()));
            header.setData((int) header.getData()+1);
        }
        return false;
    }

    // Clears all data from from the list.
    // In the Node implementation, set header.next to null.
    public void clear(){
        header.setNext(null);
        header.setData(-1);
        tail = header;
    }

    // If the given object is in the list, return true otherwise false. If the input object is null, also return false.
    public boolean contains(Object o) {
        return indexOf(o) != -1;
    }


    // Returns the object at a given index. Returns null if index is out of bounds.
    public Object get(int index){
        if(index < size() && index >= 0) {
            Node check = header;
            for (int i = -1; i <= index; i++) {
                check = check.getNext();
            }
            return check.getData();
        }
        return null;
    }

    // Returns the index of the input object in the list. Return -1 if the object is not found or is null.
    public int indexOf(Object o){
        Node check = header;
        for(int i = -1; i < size(); i++){
            if(check.getData().equals(o)){
                return i;
            } else{
                check = check.getNext();
            }
        }
        return -1;
    }

    // Returns true if the list is empty and false otherwise.
    public boolean isEmpty(){
        return header.getNext() == null;
    }

    // Removes and returns object at the given index.
    public Object remove(int index){
        Node check = header;
        for(int i = -1; i < index; i++){
            check = check.getNext();
        }
        Node ret = check.getNext();
        check.setNext(ret.getNext());
        header.setData((int) header.getData()-1);
        return ret;}

    // Removes the first instance of the input object from the list.
    // Return true if successful and false if the object is not found.
    public boolean remove(Object o){
        if(contains(o)){
            Node check = header;
            for(int i = -1; i < size(); i++){
                if(check.getNext().getData() == o){
                    check.setNext(check.getNext().getNext());
                    header.setData((int) header.getData()-1);
                    return true;
                } else{
                    check = check.getNext();
                }
            }
        }
        return false;}

    // Replaces the object at the given instance with the given object.
    // If the index is out of bounds or the object is null, do nothing.
    public void set(int index, Object o){
        if(index >= 0 && index < size() && o != null){
            Node check = header;
            for (int i = -1; i <= index; i++) {
                check = check.getNext();
            }
            check.setData(o);
        }
    }

    // Returns the size of the list.
    public int size(){
        return (int) header.getData()+1;
    }
}
