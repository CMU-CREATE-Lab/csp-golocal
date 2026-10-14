require "test_helper"

class CuisineTest < ActiveSupport::TestCase
  test "is valid with a unique name" do
    assert Cuisine.new(name: "Thai").valid?
  end

  test "requires a name" do
    cuisine = Cuisine.new(name: "")
    assert_not cuisine.valid?
    assert_includes cuisine.errors[:name], "can't be blank"
  end

  test "requires a unique name" do
    cuisine = Cuisine.new(name: cuisines(:one).name)
    assert_not cuisine.valid?
    assert_includes cuisine.errors[:name], "has already been taken"
  end

  test "links parent and children" do
    assert_equal cuisines(:one), cuisines(:two).parent_cuisine
    assert_includes cuisines(:one).children, cuisines(:two)
  end

  test "destroying a parent keeps its children as top-level cuisines" do
    cuisines(:one).destroy
    assert_nil cuisines(:two).reload.parent_cuisine
  end
end
