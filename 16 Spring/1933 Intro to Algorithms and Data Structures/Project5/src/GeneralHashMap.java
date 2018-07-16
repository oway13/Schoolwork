import java.util.LinkedList;
import java.util.List;

public class GeneralHashMap extends MyHashMap {
	//139 was a number found through trial and error to give the highest score
	public GeneralHashMap() {
		buckets = new List[139];
	}

	@Override
	//The method iterates through the token, one character at a time.
	// It takes the ASCII value of the character, adds it to the total, and multiplies it by a prime number
	//Characters have their own unique integer values assigned to them, why not utilize them?
	//In this way, the words are hashed based not only on every character that the word contains, but the order that they are in.

	//After doing some research, this is pretty much what Java's hash function does D:
	protected int hash(String token) {
		int hash = 0;
		for(int i = 0; i<token.length(); i++){
			hash = hash*3+ token.charAt(i);
		}
		return hash;
		
	}

	@Override
	public void add(String token) {
		int hash = hash(token);
		int key = hash%buckets.length;
		if(buckets[key] != null) {
			if (!buckets[key].contains(token)) {
				buckets[key].add(token);
			}
		} else{
			buckets[key] = new LinkedList<String>();
			buckets[key].add(token);
		}
	}

	@Override
	public void display() {
		for(int i = 0; i<buckets.length; i++){
			if(buckets[i] != null){
				System.out.println("Bucket #"+i);
				System.out.println(buckets[i].toString());
			}
		}
	}
}
