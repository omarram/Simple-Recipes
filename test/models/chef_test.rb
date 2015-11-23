require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "Omar Ramadneh", email: "omarramadneh@gmail.com")
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "chef name should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end

  test "chefname should not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end

  test "chefname should not be too short" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "email should be within bounds" do 
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end

  test "email should be unique" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au omar+ram@mank.cm]
    valid_addresses.each do |a|
      @chef.email = a
      assert @chef.valid?, "#{a.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com haha_hehehe_huhu.org, user.name@wawa. eee@ff_a_sd+aar.com]
    invalid_addresses.each do |a|
      @chef.email = a
      assert_not @chef.valid?, "#{a.inspect} should be invalid"
    end
  end


end