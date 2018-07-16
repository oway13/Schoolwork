/**
 * MyList interface. You will implement this two ways. Once with Arrays and once with Linked Lists.
 */

public interface MyList {



    // Adds the given object to the end of the list.
    // Returns false if the input is null, true otherwise.
    public boolean add(Object o);

    // Inserts the given object at the given index.
    // Shifts the element at the specified index and any subsequent elements (if any) towards the end of the list
    // So if you have a list of size n, you should be able to insert any object from indices 0 <= index < n.
    // The list should be able to grow if need be.
    // If an index is given not in the range 0 <= index < n, return false. If the given object is null, return false.
    public boolean insert(int index, Object o);

    // Clears all data from from the list.
    // In the Array implementation, set the underlying array to a new array of size 2.
    // In the Node implementation, set head.next to null.
    public void clear();

    // If the given object is in the list, return true otherwise false. If the input object is null, also return false.
    public boolean contains(Object o);

    // Returns the object at a given index. Returns null if index is out of bounds.
    public Object get(int index);

    // Returns the index of the input object in the list. Return -1 if the object is not found or is null.
    public int indexOf(Object o);

    // Returns true if the list is empty and false otherwise.
    public boolean isEmpty();

    // Removes and returns object at the given index.
    public Object remove(int index);

    // Removes the first instance of the input object from the list.
    // Return true if successful and false if the object is not found.
    public boolean remove(Object o);

    // Replaces the object at the given instance with the given object.
    // If the index is out of bounds or the object is null, do nothing.
    public void set(int index, Object o);

    // Returns the size of the list.
    public int size();
}
