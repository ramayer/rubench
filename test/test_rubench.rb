require 'test/unit'
require 'rubench'

class RuBenchTest < Test::Unit::TestCase
  def test_rubench
      bench = RuBench.new
      bench.mark("started")
      sleep(1)
      bench.mark("later")
      duration = bench.data.last.tim - bench.data.first.tim
      duration_text = (duration>1) ? "over one second" : "under one second"
      assert_equal duration_text, "over one second"
  end
end
