class Array
  def sum_with_number
    s = 0.0
    n = 0
    self.each do |v|
      next if v.nil?
      s += v.to_f
      n += 1
    end
    [s, n]
  end
  
  def sum
    s, n = self.sum_with_number
    s
  end
  
  def avg
    s, n = self.sum_with_number
    s / n
  end
  alias mean avg
  
  def var
    c = 0
    while self[c].nil?
      c += 1
    end
    mean = self[c].to_f
    sum = 0.0
    n = 1
    (c+1).upto(self.size-1) do |i|
      next if self[i].nil?
      sweep = n.to_f / (n + 1.0)
      delta = self[i].to_f - mean
      sum += delta * delta * sweep
      mean += delta / (n + 1.0)
      n += 1
    end
    sum / n.to_f
  end
  
  def stddev
    Math.sqrt(self.var)
end

