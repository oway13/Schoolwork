// Written by Seth Larson CSCI 1933

import java.util.Scanner;
import java.io.*;
import java.util.List;
import java.util.LinkedList;

public class TextScan {
	
    public static List<String> scanTokens(String fileName) {

        Scanner readFile = null;

        try {
            readFile = new Scanner(new File(fileName));
        }
        catch (FileNotFoundException e) {
            System.out.println("TEXTSCAN ERROR: File: " + fileName + " not found");
            System.exit(1);
        }
        
        List<String> tokens = new LinkedList<String>();

        while (readFile.hasNext()) {
            String token = readFile.next();
            if (!tokens.contains(token)) {
                tokens.add(token);
            }
        }
        
        return tokens;
    }
    
}