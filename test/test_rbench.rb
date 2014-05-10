require 'test/unit'
require 'rubench'

class RuBenchTest < Test::Unit::TestCase
  def test_english_hello
    assert_equal "hello world", RuBench.hi("english")
  end

  def test_any_hello
    assert_equal "hello world", RuBench.hi("ruby")
  end

  def test_spanish_hello
    assert_equal "rubench mundo", RuBench.hi("spanish")
  end
end
