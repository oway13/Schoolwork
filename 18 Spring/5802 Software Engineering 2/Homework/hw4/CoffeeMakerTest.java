package edu.ncsu.csc326.coffeemaker;

import edu.ncsu.csc326.coffeemaker.exceptions.InventoryException;
import junit.framework.TestCase;



/**
 * First Three by Sarah Heckman
 * @author Wyatt Kormick
 *
 * Unit tests for CoffeeMaker class.
 */
public class CoffeeMakerTest extends TestCase {
	
	private CoffeeMaker cm;
	private Recipe r1;
	private Recipe r2;
	private Recipe r3;
	private Recipe r4;

	protected void setUp() throws Exception {
		cm = new CoffeeMaker();
		
		//Set up for r1
		r1 = new Recipe();
		r1.setName("Coffee");
		r1.setAmtChocolate("0");
		r1.setAmtCoffee("3");
		r1.setAmtMilk("1");
		r1.setAmtSugar("1");
		r1.setPrice("50");
		
		//Set up for r2
		r2 = new Recipe();
		r2.setName("Mocha");
		r2.setAmtChocolate("20");
		r2.setAmtCoffee("3");
		r2.setAmtMilk("1");
		r2.setAmtSugar("1");
		r2.setPrice("75");
		
		//Set up for r3
		r3 = new Recipe();
		r3.setName("Latte");
		r3.setAmtChocolate("0");
		r3.setAmtCoffee("3");
		r3.setAmtMilk("3");
		r3.setAmtSugar("1");
		r3.setPrice("100");
		
		//Set up for r4
		r4 = new Recipe();
		r4.setName("Hot Chocolate");
		r4.setAmtChocolate("4");
		r4.setAmtCoffee("0");
		r4.setAmtMilk("1");
		r4.setAmtSugar("1");
		r4.setPrice("65");
		
		super.setUp();
	}
	
	//addInventory() does not throw exception with valid inputs
	public void testAddInventory() {
		try {
			cm.addInventory("4","7","0","9");
		} catch (InventoryException e) {
			fail("InventoryException should not be thrown");
		}
	}
	
	//addInventory() throws exception with invalid inputs
	public void testAddInventoryException() {
		try {
			cm.addInventory("4", "-1", "asdf", "3");
			fail("InventoryException should be thrown");
		} catch (InventoryException e) {
			//success if thrown
		}
	}
	
	//makeCoffee() returns proper change with valid inputs
	public void testMakeCoffee() {
		cm.addRecipe(r1);
		assertEquals(25, cm.makeCoffee(0, 75));
	}
	
	//makeCoffee() returns full amount when input recipe is null
	public void testMakeCoffeeNullRecipe() {
		cm.addRecipe(r1);
		assertEquals(75, cm.makeCoffee(1, 75));
	}
	
	//makeCoffee() returns full amount when amount paid is less than price
	public void testMakeCoffeeNotEnoughPaid() {
		cm.addRecipe(r1);
		assertEquals(25, cm.makeCoffee(0,25));
	}
	
	//makeCoffee() returns full amount when not enough ingredients to make recipe
	public void testMakeCoffeeNotEnoughIngredients() {
		cm.addRecipe(r1);
		cm.makeCoffee(0, 50);
		cm.makeCoffee(0, 50);
		cm.makeCoffee(0, 50);
		cm.makeCoffee(0, 50);
		cm.makeCoffee(0, 50);
		assertEquals(75, cm.makeCoffee(0, 75));
	}
	
	//deleteRecipe does not return a null object when recipe to delete exists
	public void testDeleteRecipe() {
		cm.addRecipe(r1);
		assertNotNull(cm.deleteRecipe(0));
	}
	
	//edit recipe does not return a null object when recipe to edit exists
	public void testEditRecipe() {
		cm.addRecipe(r1);
		assertNotNull(cm.editRecipe(0, r2));
	}
	
	//checkInventory() returns the proper values as a string
	public void testCheckInventory() {
		String test = "Coffee: 15\nMilk: 15\nSugar: 15\nChocolate: 15\n";
		assert(cm.checkInventory().equals(test));
	}

}
