package edu.ncsu.csc326.coffeemaker;

import edu.ncsu.csc326.coffeemaker.exceptions.InventoryException;
import junit.framework.TestCase;

/**
 * 
 * @author Wyatt Kormick
 *
 * Unit tests for Inventory class.
 */

public class InventoryTest extends TestCase {
	private Inventory inv;
	private Recipe r1;
	private Recipe r2;
	private Recipe r3;
	
	protected void setUp() throws Exception {
		inv = new Inventory();
		
		//Set up for r1
		r1 = new Recipe();
		r1.setName("Sludge");
		r1.setAmtChocolate("30");
		r1.setAmtCoffee("30");
		r1.setAmtMilk("30");
		r1.setAmtSugar("30");
		r1.setPrice("5");
		
		r2 = new Recipe();
		r2.setName("Water");
		r2.setAmtChocolate("0");
		r2.setAmtCoffee("0");
		r2.setAmtMilk("0");
		r2.setAmtSugar("0");
		r2.setPrice("5");
		
		r3 = new Recipe();
		r3.setName("Latte");
		r3.setAmtChocolate("0");
		r3.setAmtCoffee("3");
		r3.setAmtMilk("3");
		r3.setAmtSugar("1");
		r3.setPrice("100");
		
		super.setUp();
		
	}
	
	//setChocolate() changes the value of the member variable properly with valid input
	public void testSetChocolate() {
		inv.setChocolate(20);
		assertEquals(20, inv.getChocolate());
	}
	
	//setChocolate() does not change value of the member variable with invalid input
	public void testSetChocolateException() {
		inv.setChocolate(-20);
		assertEquals(15, inv.getChocolate());
	}
	
	//addChocolate() changes value and does not throw exception with valid input
	public void testAddChocolate() {
		try {
			inv.addChocolate("5");
			assertEquals(20, inv.getChocolate());
		} catch (InventoryException e) {
			fail("InventoryException should not be thrown");
		}
	}

	//addChocolate() throws exception when input is not a number
	public void testAddChocolateNaN() {
		try {
			inv.addChocolate("0xg");
			fail("InventoryException should be thrown");
		} catch (InventoryException e) {
			//success
		}
	}
	
	//addChocolate() throws exception when input is not a positive number
	public void testAddChocolateNonpositive() {
		try {
			inv.addChocolate("-5");
			fail("InventoryException should be thrown");
		} catch (InventoryException e) {
			//success
		}
	}
	
	//setCoffee() changes the value of the member variable properly with valid input
	public void testSetCoffee() {
		inv.setCoffee(20);
		assertEquals(20, inv.getCoffee());
	}
	
	//setCoffee() does not change value of the member variable with invalid input
	public void testSetCoffeeException() {
		inv.setCoffee(-20);
		assertEquals(15, inv.getCoffee());
	}
	
	//addCoffee() changes value and does not throw exception with valid input
	public void testAddCoffee() {
		try {
			inv.addCoffee("5");
			assertEquals(20, inv.getCoffee());
		} catch (InventoryException e) {
			fail("InventoryException should not be thrown");
		}
	}

	//addCoffee() throws exception when input is not a number
	public void testAddCoffeeNaN() {
		try {
			inv.addCoffee("0xg");
			fail("InventoryException should be thrown");
		} catch (InventoryException e) {
			//success
		}
	}
	
	//addCoffee() throws exception when input is not a positive number
	public void testAddCoffeeNonpositive() {
		try {
			inv.addCoffee("-5");
			fail("InventoryException should be thrown");
		} catch (InventoryException e) {
			//success
		}
	}
	
	//setMilk() changes the value of the member variable properly with valid input
	public void testSetMilk() {
		inv.setMilk(20);
		assertEquals(20, inv.getMilk());
	}
	
	//setMilk() does not change value of the member variable with invalid input
	public void testSetMilkException() {
		inv.setMilk(-20);
		assertEquals(15, inv.getMilk());
	}
	
	//addMilk() changes value and does not throw exception with valid input
	public void testAddMilk() {
		try {
			inv.addMilk("5");
			assertEquals(20, inv.getMilk());
		} catch (InventoryException e) {
			fail("InventoryException should not be thrown");
		}
	}

	//addMilk() throws exception when input is not a number
	public void testAddMilkNaN() {
		try {
			inv.addMilk("0xg");
			fail("InventoryException should be thrown");
		} catch (InventoryException e) {
			//success
		}
	}
	
	//addMilk() throws exception when input is not a positive number
	public void testAddMilkNonpositive() {
		try {
			inv.addMilk("-5");
			fail("InventoryException should be thrown");
		} catch (InventoryException e) {
			//success
		}
	}
	
	//setSugar() changes the value of the member variable properly with valid input
	public void testSetSugar() {
		inv.setSugar(20);
		assertEquals(20, inv.getSugar());
	}
	
	//setSugar() does not change value of the member variable with invalid input
	public void testSetSugarException() {
		inv.setSugar(-20);
		assertEquals(15, inv.getSugar());
	}
	
	
	//addSugar() changes value and does not throw exception with valid input
	public void testAddSugar() {
		try {
			inv.addSugar("5");
			assertEquals(20, inv.getSugar());
		} catch (InventoryException e) {
			fail("InventoryException should not be thrown");
		}
	}

	//addSugar() throws exception when input is not a number
	public void testAddSugarNaN() {
		try {
			inv.addSugar("0xg");
			fail("InventoryException should be thrown");
		} catch (InventoryException e) {
			//success
		}
	}
	
	//addSugar() throws exception when input is not a positive number
	public void testAddSugarNonpositive() {
		try {
			inv.addSugar("-5");
			fail("InventoryException should be thrown");
		} catch (InventoryException e) {
			//success
		}
	}
	
	//enoughIngredients() returns true when there is enough ingredients for a recipe
	public void testEnoughIngredientsEnough() {
		assert(inv.enoughIngredients(r2));
	}
	
	//enoughIngredients() returns false when there is not enough ingredients for a recipe
	public void testEnoughIngredientsNotEnough() {
		assert(!inv.enoughIngredients(r1));
	}
	
	//useIngredients() changes the values of variables when there is enough ingredients for a recipe
	public void testUseIngredientsEnough() {
		inv.useIngredients(r3);
		assertEquals(15,inv.getChocolate());
		assertEquals(12,inv.getMilk());
		assertEquals(12,inv.getCoffee());
		assertEquals(14,inv.getSugar());
	}
	
	//useIngredients() does not change the values of variables when there is not enough ingredients for a recipe
	public void testUseIngredientsNotEnough() {
		inv.useIngredients(r1);
		assertEquals(15,inv.getChocolate());
		assertEquals(15,inv.getMilk());
		assertEquals(15,inv.getCoffee());
		assertEquals(15,inv.getSugar());
	}
	
	//toString() returns the proper values as a string
	public void testToString() {
		String test = "Coffee: 15\nMilk: 15\nSugar: 15\nChocolate: 15\n";
		assert(inv.toString().equals(test));
	}
	
	
}