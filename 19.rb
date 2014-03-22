# uses a little too much ruby to solve it, but it solves it.
require 'date'
start_date = Date.new(1901,1,1)
end_date = Date.new(2000,12,31)
count = 0
(start_date..end_date).each do |date|
  count += 1 if (date.day == 1 && date.sunday?)
end
puts count