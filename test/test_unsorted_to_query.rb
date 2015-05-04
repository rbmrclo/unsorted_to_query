$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_support/core_ext/object/to_query'
require 'unsorted_to_query'
require 'minitest/autorun'

class TestUnsortedToQuery < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil UnsortedToQuery::VERSION
  end

  def test_without_monkey_patch
    assert_equal({ z: 'z', a: 'a', r: 'r'}.to_query, 'a=a&r=r&z=z')
  end

  using UnsortedToQuery

  def test_if_it_works
    assert_equal({ z: 'z', a: 'a', r: 'r'}.to_query, 'z=z&a=a&r=r')
  end

end
