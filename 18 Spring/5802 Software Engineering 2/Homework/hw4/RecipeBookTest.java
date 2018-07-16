package edu.ncsu.csc326.coffeemaker;

import junit.framework.TestCase;

/**
 * 
 * @author Wyatt Kormick
 *
 * Unit tests for Recipe Book class.
 */

public class RecipeBookTest extends TestCase {
	RecipeBook rb;
	Recipe r1;
	Recipe r2;
	Recipe r3;
	Recipe r4;
	Recipe r5;
	
	protected void setUp() throws Exception {
		rb = new RecipeBook();
		r1 = new Recipe();
		r1.setName("Steven");
		r2 = new Recipe();
		r2.setName("Jimbob");
		r3 = new Recipe();
		r3.setName("Jesse");
		r4 = new Recipe();
		r4.setName("Billy");
		r5 = new Recipe();
		r5.setName("Jen");
		
		super.setUp();
	}
	
	//addRecipe() adds the input to the recipe array and returns true
	public void testAddRecipe() {
		assert(rb.addRecipe(r1));
		assertEquals(r1, rb.getRecipes()[0]);
	}
	
	//addRecipe() returns false if the recipe is already in the recipe array
	public void testAddRecipeExists() {
		rb.addRecipe(r1);
		assert(!rb.addRecipe(r1));
	}
	
	//addRecipe() returns false if the recipe array is full and doesn't change the recipe array
	public void testAddRecipeFull() {
		String[] rs = {"Steven", "Jimbob", "Jesse", "Billy"};
		rb.addRecipe(r1);
		rb.addRecipe(r2);
		rb.addRecipe(r3);
		rb.addRecipe(r4);
		assert(!rb.addRecipe(r5));
		for(int i = 0; i < rs.length; i++) {
			assert(rs[i].equals(rb.getRecipes()[i].getName()));
		}
	}
	
	//deleteRecipe() sets the value of the deleted recipe to null and returns the name of the deleted recipe
	public void testDeleteRecipe() {
		rb.addRecipe(r1);
		rb.addRecipe(r2);
		rb.addRecipe(r3);
		rb.addRecipe(r4);
		assert(rb.deleteRecipe(3).equals("Billy"));
		assertNull(rb.getRecipes()[3]);
	}
	
	//deleteRecipe() returns null if the selected recipe is null
	public void testDeleteRecipeNull() {
		assertNull(rb.deleteRecipe(3));
	}
	
	//editRecipe() sets the recipe at the input position to the input recipe (without changing its name)
	//and returns the name of the old recipe
	public void testEditRecipe() {
		rb.addRecipe(r1);
		assert(rb.editRecipe(0, r2).equals("Steven"));
		assert(rb.getRecipes()[0].getName().equals("Jimbob"));
	}
	
	//editRecipe() returns null if the selected recipe is null
	public void testEditRecipeNull() {
		rb.addRecipe(r1);
		assertNull(rb.editRecipe(3, r2));
	}
}