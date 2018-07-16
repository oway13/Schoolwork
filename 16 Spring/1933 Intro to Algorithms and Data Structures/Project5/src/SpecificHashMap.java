
import java.util.LinkedList;
import java.util.List;

public class SpecificHashMap extends MyHashMap {

	public SpecificHashMap() {
		buckets = new List[50];
	}

	@Override
	protected int hash(String token) {
		int hash = 0;
		return hash;
	}




	@Override
	public void add(String token) {
		int hash = hash(token);
		int key = hash%buckets.length;
		if(buckets[key] == null) {
			buckets[key] = new LinkedList<String>();
			buckets[key].add(token);
		} else{
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
