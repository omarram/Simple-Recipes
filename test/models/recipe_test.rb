require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  #was like this:
  #def setup
  #  @recipe = Recipe.new(name: "chicken ticka", summary: "this is the best chicken recipe ever", description: "head this, do that, add this, add that, bla bla bla, cook for bla bla")
  #end

  #but after i added association i had to fix this test to look like this:
  def setup
    @chef = Chef.create(chefname: "omar", email: "omar@gmail.com")
    @recipe = @chef.recipes.build(name: "chicken ticka", summary: "this is the best chicken recipe ever", description: "head this, do that, add this, add that, bla bla bla, cook for bla bla")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end

  test "name length should not be too short" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end

  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end

  test "summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end

  test "summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end

  test "description should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end

  test "description should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
end