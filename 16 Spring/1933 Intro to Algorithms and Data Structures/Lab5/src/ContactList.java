/**
 * Created by Wyatt on 2/23/2016.
 */

import com.sun.org.apache.xpath.internal.SourceTree;

import java.util.Scanner;
import java.io.PrintWriter;
import java.io.File;



public class ContactList {

    public static void main(String[] args) {

        //Parts of Step 1
        Contact c1 = new Contact("Brito");
        Contact c2 = new Contact("Sam");
        Contact c3 = new Contact("Wyatt");
        Contact c4 = new Contact("Ben");
        Contact c5 = new Contact ("Random Guy");
        Contact c6 = new Contact("Ayy");
        c3.setAddress("Ayy");
        c3.setPhone(1234);
        c3.setComments("lmao");

        //Step 2
        ContactList group = new ContactList(3);
        System.out.println("Add Person 1: "+group.add(c2));
        System.out.println("Add Person 2: "+group.add(c1));
        System.out.println("Add Person 3: "+group.add(c3));
        System.out.println("Find Wyatt: "+group.find("Wyatt"));
        System.out.println("Remove: "+group.remove());
        System.out.println("Re-add Wyatt: "+group.add(c3));

        //Step 3
        System.out.println("Write to contacts.txt: "+group.write("contacts.txt"));
        System.out.println("Read from contacts.txt: "+group.read("contacts.txt"));

        //Step 4
        System.out.println("Get Current: "+group.getCurrent());
        System.out.println("Get First Contact (index 0): "+group.get(0));
        System.out.println("Get Next: "+group.next());
        System.out.println("Get Previous: "+group.previous());
        System.out.println("Get outside array Length: "+group.get(10));

        //Step 5
        ContactList sorted = new ContactList(6);
        sorted.add(c1);
        sorted.add(c2);
        sorted.add(c3);
        sorted.add(c4);
        sorted.add(c5);
        sorted.add(c6);
        sorted.write("presort.txt");
        sorted.sort();
        sorted.write("sort.txt");
        System.out.println("See sort.txt and presort.txt for results of bubble sort.");



    }

    private int ptr = 0;
    private Contact[] clist;

    public ContactList(){
        clist = new Contact[20];
    }
    public ContactList(int len){
        clist = new Contact[len];
    }

    public boolean add(Contact c){
        int count = -1;
        while (count < clist.length-1){
            count++;
            if (clist[count] == null){
                clist[count] = c;
                return true;
            }
        }
        return false;
    }

    public Contact find(String name) {
        int start = ptr;
        Contact result = null;

        while (ptr < clist.length) {
            if (clist[ptr] != null) {
                if (clist[ptr].getName().contains(name)) {
                    result = clist[ptr];
                    break;
                }
            }
            if (ptr + 1 == start) {
                break;
            }else{
                if (ptr < clist.length) {
                    ptr++;
                } else {
                    ptr = 0;
                }
            }
        }


        return result;
    }

    public Contact remove(){
        Contact c = clist[ptr];
        clist[ptr] = null;
        return c;
    }



    public boolean write(String filename){
        PrintWriter p = null;
        try {
            p = new PrintWriter(new File(filename));
        } catch (Exception e) {
            System.out.println(e);
        }
        int count = 0;
        while(count < clist.length){
            if (clist[count] != null){
                p.print(clist[count].getName()+";");
                p.print(clist[count].getPhone()+";");
                p.print(clist[count].getAddress()+";");
                p.println(clist[count].getComments()+";");
            }
            count++;
        }


        p.close();
        return true;
    }

    public boolean read(String filename){
        Scanner s = null;
        try {
            s = new Scanner(new File(filename));
        } catch (Exception e) {return false;}
        ContactList fileContacts = new ContactList();
        while (s.hasNextLine()){
            String line = s.nextLine();
            String[] ctact = line.split(";");
            Contact c = new Contact(ctact[0]);
            c.setPhone(Long.valueOf(ctact[1]));
            c.setAddress(ctact[2]);
            c.setComments(ctact[3]);
            fileContacts.add(c);
        }
        s.close();
        if (equals(fileContacts)){
            return true;
        }
        return false;
    }

    public Contact getCurrent(){
        return clist[ptr];
    }

    public Contact get(int i){
        if (i > clist.length || i < 0){return null;}
        return clist[i];}

    public Contact next(){
        ptr++;
        if (ptr >= clist.length){
            ptr = 0;
        }
        return clist[ptr];
    }

    public Contact previous(){
        ptr--;
        if (ptr < 0){
            ptr = clist.length-1;
        }
        return clist[ptr];
    }

    public boolean equals(ContactList cl){
        int count = 0;
        while (count < clist.length){
            if (!clist[count].equals(cl.get(count))){
                return false;
            }
            count++;
        }
        return true;
    }

    public void sort(){
        int count = 0;
        while (count < clist.length){
            int c2 = 0;
            while (c2 < clist.length-count-1){
                if(clist[c2] != null && clist[c2+1] != null && clist[c2].getName().compareTo(clist[c2+1].getName()) > 0){
                    Contact temp = clist[c2];
                    clist[c2]=clist[c2+1];
                    clist[c2+1]=temp;
                }
                c2++;
            }
            count++;

        }

    }

}
