# Much more efficent method (about 200ms vs 150s)
# require 'rational'
# value = (1..20).inject(1) { |result, n| result.lcm n }

range = 1..20
value = 0 
(1..Float::INFINITY).each do |number|
  range.each do |divisor|
    break if number % divisor != 0
    if divisor == range.last
      value = number
    end
  end
  break unless value.zero?
end
puts value