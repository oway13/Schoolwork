// Written by Seth Larson CSCI 1933

import java.util.List;
import java.util.LinkedList;
//Only General Hashmap has been implemented

public abstract class MyHashMap {
	
	// METHODS THAT MUST BE IMPLEMENTED
	// IMPLEMENT THESE IN THE CHILDREN CLASSES
	
	// Converts a token into an integer hash
	protected abstract int hash(String token);
	
	// Adds the token to the hash map (must used the buckets)
	public abstract void add(String token);
	
	// Displays all elements within the hash map by bucket
	public abstract void display();
	
	//////////////////////////////////////////////
	// METHODS FOR TESTING YOUR IMPLEMENTATIONS //
	// DO NOT MODIFY, BUT FEEL FREE TO LOOK     //
	//////////////////////////////////////////////
	
	public static void main(String[] args) {
		
		MyHashMap generalHashMap = new GeneralHashMap();
		MyHashMap specificHashMap = new SpecificHashMap();
		
		System.out.println("GENERAL HASH MAP RESULTS: ");
		System.out.println("");
		
		double generalScore = MyHashMap.testHashMap(generalHashMap, "passwords.txt", 30.0);
		
		System.out.println("SPECIFIC HASH MAP RESULTS: ");
		System.out.println("");
		
		double specificScore = MyHashMap.testHashMap(specificHashMap, "keywords.txt", 20.0);
		
		double totalScore = 0.0;
		if(generalScore != -1.0 && specificScore != -1.0) {
			totalScore = generalScore + specificScore + 30.0;
		}
		else {
			totalScore = 0.0;
		}
		
		System.out.println("");
		System.out.println("TOTAL SCORE:              " + totalScore + " / " + "80.0");
		System.out.println("(20 PTS AWARDED FOR GOOD COMMENTS AND EXPLAINATIONS)");

		specificHashMap.display();

	}
	
	// THE TEST FUNCTION THAT USES A HASHMAP AND A FILE TO TEST
	// SPEED AND EFFECTIVENESS OF YOUR HASHMAP IMPLEMENTATION
	
	public static double testHashMap(MyHashMap hashMap, String tokenFileName, double maxScore) {
		
		List<String> allTokens = TextScan.scanTokens(tokenFileName);
		long executionTime = 0;
		long overheadExecutionTime = 0;
		
		System.out.println("ADDING ALL TOKENS");
		
		overheadExecutionTime = System.currentTimeMillis();
		
		for(int i = 0; i < allTokens.size(); i++);
		
		overheadExecutionTime = System.currentTimeMillis() - overheadExecutionTime;
		executionTime = System.currentTimeMillis();
		
		for(int i = 0; i < allTokens.size(); i++) {
			hashMap.add(allTokens.get(i));
		}
		
		executionTime = System.currentTimeMillis() - executionTime;
		
		System.out.println("TESTING CORRECTNESS");
		System.out.println("");
		
		System.out.print("BUCKETS INITIALIZED TEST: ");
		if(!hashMap.testBucketsInitialized()) {
			System.out.println("FAIL");
			System.out.println("YOU MUST HAVE AT LEAST 15 BUCKETS");
			return -1.0;
		}
		else {
			System.out.println("PASS");
		}
		
		System.out.print("ALL ELEMENTS ADDED TEST:  ");
		if(!hashMap.testTotalElements(allTokens.size())) {
			System.out.println("FAIL");
			return -1.0;
		}
		else {
			System.out.println("PASS");
		}
		
		System.out.print("TOKEN DUPLCIATES TEST:    ");
		if(!hashMap.testDuplicates()) {
			System.out.println("FAIL");
			return -1.0;
		}
		else {
			System.out.println("PASS");
		}
		
		System.out.print("HASH CORRECTNESS TEST:    ");
		if(!hashMap.testHashCorrectness()) {
			System.out.println("FAIL");
			return -1.0;
		}
		else {
			System.out.println("PASS");
		}
		
		double evenScore = maxScore * hashMap.proportional(2) * hashMap.proportional(5) * hashMap.proportional(10);
		double totalScore = evenScore;
		
		System.out.println("");
		System.out.println("BUCKET UTILIZATION:       " + (hashMap.bucketUtilization() * 100) + "%");
		System.out.println("AVERAGE BUCKET SIZE:      " + (hashMap.averageBucketSize()));
		System.out.println("MAXIMUM BUCKET SIZE:      " + (hashMap.maximumBucketSize()));
		System.out.println("MAX / AVG BUCKET SIZE:    " + (hashMap.maximumBucketSize() / hashMap.averageBucketSize()));
		System.out.println("TOTAL EXECUTION TIME:     " + (executionTime - overheadExecutionTime) + "ms");
		System.out.println("");
		
		evenScore = (double)Math.round(evenScore * 100) / 100;
		
		System.out.println("TOTAL SCORE:              " + evenScore + " / " + maxScore);
		System.out.println("");
		
		return totalScore;
	}
	
	public double proportional(int every) {
		double totalSum = 0.0;
		double partialSum = 0.0;
		for(int i = 0; i < buckets.length; i++) {
			totalSum += buckets[i].size();
			if(i % every == 0) {
				partialSum += buckets[i].size();
			}
		}
		double clamp = (partialSum * every) / totalSum;
		if(clamp < 1.0) { clamp = 1 / clamp; }
		return 1.0 / Math.abs(clamp);
	}
	
	// Finds number of buckets that are non-empty.
	public double bucketUtilization() {
		double bucketsUsed = 0;
		for(int i = 0; i < buckets.length; i++) {
			if(buckets[i].size() > 0) {
				bucketsUsed ++;
			}
		}
		return bucketsUsed / buckets.length;
	}
	
	// Finds the average length of a bucket.
	public double averageBucketSize() {
		double sum = 0.0;
		for(int i = 0; i < buckets.length; i++) {
			sum += buckets[i].size();
		}
		return sum / buckets.length;
	}
	
	public double averageFilledBucketSize() {
		double sum = 0.0;
		int bucketsCount = 0;
		for(int i = 0; i < buckets.length; i++) {
			sum += buckets[i].size();
			if(buckets[i].size() > 0) {
				bucketsCount ++;
			}
		}
		return sum / bucketsCount;
	}
	
	// Finds the longest bucket length.
	private double maximumBucketSize() {
		double max = buckets[0].size();
		for(int i = 1; i < buckets.length; i++) {
			max = max > buckets[i].size() ? max : buckets[i].size();
		}
		return max;
	}
	
	private int totalBucketSize() {
		int sum = 0;
		for(int i = 0; i < buckets.length; i++) {
			sum += buckets[i].size();
		}
		return sum;
	}
	
	// Tests if all elements within each bucket map
	// to the bucket that the element was found in.
	private boolean testHashCorrectness() {
		for(int i = 0; i < buckets.length; i++) {
			for(String token : buckets[i]) {
				if(hash(token) % buckets.length != i) {
					return false;
				}
			}
		}
		return true;
	}
	
	// Tests if all elements within the hash map are
	// not duplicates of each other.
	private boolean testDuplicates() {
		List<String> tokensSeen = new LinkedList<String>();
		for(int i = 0; i < buckets.length; i++) {
			for(String token : buckets[i]) {
				if(tokensSeen.contains(token)) {
					return false;
				}
				tokensSeen.add(token);
			}
		}
		return true;
	}
	
	// Tests if the number of elements in the hash map
	// is equal to the number fed in to it.
	private boolean testTotalElements(int numberOfElements) {
		return totalBucketSize() == numberOfElements;
	}
	
	// Tests if buckets are initialized.
	private boolean testBucketsInitialized() {
		if(buckets == null || buckets.length < 15) {
			return false;
		}
		for(int i = 0; i < buckets.length; i++) {
			if(buckets[i] == null) {
				return false;
			}
		}
		return true;
	}
	
	// Variable to be used to store tokens within
	// the hash map.
	protected List<String>[] buckets;
}
