require 'prime'
class Integer 
  def divisors
    return [1] if self == 1
    primes, powers = self.prime_division.transpose 
    exponents = powers.map{|i| (0..i).to_a} 
    divisors = exponents.shift.product(*exponents).map do |powers| 
      primes.zip(powers).map{|prime, power| prime ** power}.inject(:*) 
    end 
    divisors.sort.reject{ |x| x == self}.uniq
  end
end

numbers = {}
amiciable = []
(1..10000).each do |n|
  numbers[n] = n.divisors.inject(&:+)
  if numbers[numbers[n]] == n && n != numbers[n]
    amiciable << n 
    amiciable << numbers[n]
  end
end
puts amiciable.uniq.sort.inject(&:+)