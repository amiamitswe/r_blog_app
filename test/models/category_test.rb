require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # this setup will run before every test execute
  def setup
    @category = Category.new(name: "Sports")
  end

  test "category should be valid" do
    # @category = Category.new(name:"Sports")
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "name should not be too long" do
    @category.name = "hellowoeldthisistobiggsdfgsd"
    assert_not @category.valid?
  end
  test "name should not be too short" do
    @category.name = "he"
    assert_not @category.valid?
  end
end