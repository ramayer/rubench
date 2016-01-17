require 'set'

class RuBench_elem
  attr :tim
  attr :lbl
  def initialize(lbl)
      @tim = Time.now
      @lbl  = lbl
  end
end

class RuBench

  def initialize()
      super
      @a  = [RuBench_elem.new("starting")]
      @t0 = [Time.now, Process.times.utime, Process.times.stime]
  end

  def mark(s)
      @a << RuBench_elem.new(s);
  end

  def to_html
      p0 = p1 = @a[0]
      '<table class="font7">'+
      @a[1..-1].map{|r|
          t=%Q{<tr><td align="right">%6.3f</td><td align="right">%6.3f</td><td>#{r.lbl}</td></tr>}%[(r.tim-p0.tim)*1000,(r.tim-p1.tim)*1000];
          p1=r;
          t
      }.join("")+
      "</table>"
  end

  def to_text
      p0 = p1 = @a[0]
      @a[1..-1].map{|r| t="  %6.3f %6.3f %s"%[(r.tim-p0.tim)*1000,(r.tim-p1.tim)*1000,r.lbl]; p1=r; t}.join("\n")
  end

  def times
      @t1 = [Time.now, Process.times.utime, Process.times.stime]      
      @t0.zip(@t1).map{|v0,v1| v1-v0}
  end

  def data
      @a
  end

end

$rubench ||= RuBench.new

# require 'rubench/translator'
