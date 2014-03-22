#class Integer
#  def factors
#    (1..self).select { |n| (self % n).zero?} 
#  end
#end
#solution = false
#number_last = 0
#number = 0
#while solution == false
#  number = number + 1
#  number_last = number + number_last
#  
#  solution = true if number_last.factors.count > 500
#  puts number_last
#end
#puts number_last

require 'mathn' 

class Integer 
  def divisors
    return [1] if self == 1
    primes, powers = self.prime_division.transpose 
    exponents = powers.map{|i| (0..i).to_a} 
    divisors = exponents.shift.product(*exponents).map do |powers| 
      primes.zip(powers).map{|prime, power| prime ** power}.inject(:*) 
    end 
    divisors.sort.map{|div| [div, self / div]} 
  end
end

triangles = Enumerator.new do |yielder|
  i = 1
  loop do
    yielder.yield i * (i + 1) / 2
    i += 1
  end
end
puts triangles.detect { |t| t.divisors.count > 500 }