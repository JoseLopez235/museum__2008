require "minitest/autorun"
require "minitest/pride"
require "./lib/museum"

class MuseumTest < Minitest::Test
  def test_should_exist
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_instance_of Museum, dmns
  end

  def test_its_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal "Denver Museum of Nature and Science", dmns.name
    assert_equal [], dmns.exhibits
  end
end
