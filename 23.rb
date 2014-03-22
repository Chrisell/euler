class Integer
  def abundent?
    self.factors.inject { |sum, x| sum + x} > self
  end
  
  def factors
    (1..self).select { |n| (self % n).zero? && self != n} 
  end
end
(12...28123).select { |n| n.abundent? }
#abundent_numbers = (1...28123).select { |n| n.abundent?}
#puts aubndent_numbers

