package edu.ncsu.csc326.coffeemaker;

import edu.ncsu.csc326.coffeemaker.exceptions.InventoryException;
import edu.ncsu.csc326.coffeemaker.exceptions.RecipeException;
import junit.framework.TestCase;

/**
 * 
 * @author Wyatt Kormick
 *
 * Unit tests for Recipe class.
 */

public class RecipeTest extends TestCase {
	private Recipe r1;
	private Recipe r2;
	private Recipe r3;
	private Recipe r4;
	private RecipeBook rb;
	
	protected void setUp() throws Exception {
		r1 = new Recipe();
		r2 = new Recipe();
		r3 = new Recipe();
		r4 = new Recipe();
		rb = new RecipeBook();
		r2.setName("Steven");
		r3.setName("Jimbob");
		
		super.setUp();
	}
	
	//setAmtChocolate() sets the value with a valid input, does not throw exception
	public void testSetAmtChocolate() {
		try {
			r1.setAmtChocolate("5");
			assertEquals(5,r1.getAmtChocolate());
		} catch (RecipeException e) {
			fail("RecipeException should not be thrown");
		}
	}
	
	//setAmtChocolate() throws exception when input is not a number
	public void testSetAmtChocolateNaN() {
		try {
			r1.setAmtChocolate("0xgq");
			fail("RecipeException should be thrown");
		} catch (RecipeException e) {
			//success
		}
	}
	
	//setAmtChocolate() throws exception when input is not positive
	public void testSetAmtChocolateNonpositive() {
		try {
			r1.setAmtChocolate("-5");
			fail("RecipeException should be thrown");
		} catch (RecipeException e) {
			//success
		}
	}
	
	//setAmtCoffee() sets the value with a valid input, does not throw exception
	public void testSetAmtCoffee() {
		try {
			r1.setAmtCoffee("5");
			assertEquals(5,r1.getAmtCoffee());
		} catch (RecipeException e) {
			fail("RecipeException should not be thrown");
		}
	}
	
	//setAmtCoffee() throws exception when input is not a number
	public void testSetAmtCoffeeNaN() {
		try {
			r1.setAmtCoffee("0xgq");
			fail("RecipeException should be thrown");
		} catch (RecipeException e) {
			//success
		}
	}
	
	//setAmtCoffee() throws exception when input is not positive
	public void testSetAmtCoffeeNonpositive() {
		try {
			r1.setAmtCoffee("-5");
			fail("RecipeException should be thrown");
		} catch (RecipeException e) {
			//success
		}
	}
	
	//setAmtMilk() sets the value with a valid input, does not throw exception
	public void testSetAmtMilk() {
		try {
			r1.setAmtMilk("5");
			assertEquals(5,r1.getAmtMilk());
		} catch (RecipeException e) {
			fail("RecipeException should not be thrown");
		}
	}
	
	//setAmtMilk() throws exception when input is not a number
	public void testSetAmtMilkNaN() {
		try {
			r1.setAmtMilk("0xgq");
			fail("RecipeException should be thrown");
		} catch (RecipeException e) {
			//success
		}
	}
	
	//setAmtMilk() throws exception when input is not positive
	public void testSetAmtMilkNonpositive() {
		try {
			r1.setAmtMilk("-5");
			fail("RecipeException should be thrown");
		} catch (RecipeException e) {
			//success
		}
	}
	
	//setAmtSugar() sets the value with a valid input, does not throw exception
	public void testSetAmtSugar() {
		try {
			r1.setAmtSugar("5");
			assertEquals(5,r1.getAmtSugar());
		} catch (RecipeException e) {
			fail("RecipeException should not be thrown");
		}
	}
	
	//setAmtSugar() throws exception when input is not a number
	public void testSetAmtSugarNaN() {
		try {
			r1.setAmtSugar("0xgq");
			fail("RecipeException should be thrown");
		} catch (RecipeException e) {
			//success
		}
	}
	
	//setAmtSugar() throws exception when input is not positive
	public void testSetAmtSugarNonpositive() {
		try {
			r1.setAmtSugar("-5");
			fail("RecipeException should be thrown");
		} catch (RecipeException e) {
			//success
		}
	}

	//setName() sets the value with a valid input
	public void testSetName() {
		r1.setName("Steven");
		assert(r1.getName().equals("Steven"));
	}
	
	//setName() does not change name when input is null
	public void testSetNameNull() {
		String test = r1.getName();
		r1.setName(null);
		assert(r1.getName().equals(test));
	}

	//setPrice() sets the value with a valid input, does not throw exception
	public void testSetPrice() {
		try {
			r1.setPrice("5");
			assertEquals(5,r1.getPrice());
		} catch (RecipeException e) {
			fail("RecipeException should not be thrown");
		}
	}
	
	//setPrice() throws exception when input is not a number
	public void testSetPriceNaN() {
		try {
			r1.setPrice("0xgq");
			fail("RecipeException should be thrown");
		} catch (RecipeException e) {
			//success
		}
	}
	
	//setPrice() throws exception when input is not positive
	public void testSetPriceNonpositive() {
		try {
			r1.setPrice("-5");
			fail("RecipeException should be thrown");
		} catch (RecipeException e) {
			//success
		}
	}

	//toString() returns the name of the recipe
	public void testToString() {
		r1.setName("Steven");
		assert(r1.toString().equals("Steven"));
	}

	//equals() returns true when both inputs are the same object
	public void testEqualsSameObject() {
		assert(r1.equals(r1));
	}
	
	//equals() returns false when one input is null
	public void testEqualsNull() {
		assert(!r1.equals(null));
	}
	
	//equals() returns false if the inputs are different classes
	public void testEqualsDifferentClass() {
		assert(!r1.equals(rb));
	}
	
	//equals() returns true if both have null names
	//I'm not sure this case is actually possible
	public void testEqualsNullName() {
		assert(r1.equals(r4));
		assert(!r1.equals(r2));
	}
	
	//equals() returns true if both inputs are recipes with the same name
	public void testEqualsSameName() {
		r1.setName("Steven");
		assert(r1.equals(r2));
	}
	
}