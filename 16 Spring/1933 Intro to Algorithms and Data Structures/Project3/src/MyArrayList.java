/**
 * Created by Wyatt on 3/26/2016.
 */
public class MyArrayList implements MyList  {

    Object[] mal;
    int contents = 0;

    public MyArrayList(){
        mal = new Object[2];
    }
    public MyArrayList(int length){
        mal = new Object[length];
    }

    // Adds the given object to the end of the list.
    // Returns false if the input is null, true otherwise.
    public boolean add(Object o){
        if(o == null){
            return false;
        } else{
            if(contents == mal.length){
                mal = grow(mal);
            }
            contents++;
            mal[contents-1] = o;
            return true;
        }
    }

    private Object[] grow(Object[] o){
        Object[] newmal = new Object[o.length*2];
        alcopy(newmal);
        return newmal;
    }

    private void alcopy(Object[] o){
        Object[] newmal = new Object[o.length];
        int malcount = 0;
        int newmalcount = 0;
        while(malcount<mal.length){
            if(!(mal[malcount] == null)){
                newmal[newmalcount]=mal[malcount];
                newmalcount++;
            }
            malcount++;
        }
        mal = newmal;
    }

    // Inserts the given object at the given index.
    // Shifts the element at the specified index and any subsequent elements (if any) towards the end of the list
    // So if you have a list of size n, you should be able to insert any object from indices 0 <= index < n.
    // The list should be able to grow if need be.
    // If an index is given not in the range 0 <= index < n, return false. If the given object is null, return false.
    public boolean insert(int index, Object o){
        Object[] newmal = new Object[mal.length];
        if(index >= 0 && index < size()){
            for(int i = 0; i<newmal.length; i++){
                if(i < index){
                    newmal[i]=mal[i];
                } else if(i == index){
                    newmal[i]=o;
                    contents++;
                    if(contents == newmal.length){
                        newmal = grow(newmal);
                    }
                } else{
                    newmal[i]=mal[i+1];
                }
            }
            return true;
        }
        return false;
    }

    // Clears all data from from the list.
    // In the Array implementation, set the underlying array to a new array of size 2.
    public void clear(){
        mal = new Object[2];
        contents = 0;
    }

    // If the given object is in the list, return true otherwise false. If the input object is null, also return false.
    public boolean contains(Object o){
        return indexOf(o) != -1;
    }

    // Returns the object at a given index. Returns null if index is out of bounds.
    public Object get(int index){
        if(index >= 0 && index < size()){
            return mal[index];
        }
        return null;
    }

    // Returns the index of the input object in the list. Return -1 if the object is not found or is null.
    public int indexOf(Object o){
        int ret = -1;
        if(!(o == null)){
            for(int i = 0; i<mal.length; i++){
                if(mal[i].equals(o)){
                    ret = i;
                    break;
                }
            }
        }
        return ret;
    }

    // Returns true if the list is empty and false otherwise.
    public boolean isEmpty(){
        return contents == 0;
    }

    // Removes and returns object at the given index.
    public Object remove(int index){
        Object o = mal[index];
        mal[index] = null;
        alcopy(mal);
        contents--;
        return o;
    }

    // Removes the first instance of the input object from the list.
    // Return true if successful and false if the object is not found.
    public boolean remove(Object o){
        if(contains(o)){
            mal[indexOf(o)] = null;
            alcopy(mal);
            contents--;
            return true;
        }
        return false;
    }

    // Replaces the object at the given instance with the given object.
    // If the index is out of bounds or the object is null, do nothing.
    public void set(int index, Object o){
        if(index >= 0 && index < size() && !(o == null)){
            mal[index]=o;
        }
    }

    // Returns the size of the list.
    public int size(){
        return contents;
    }

}
