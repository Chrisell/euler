f = File.open("names.txt", "r").read.downcase.gsub("\"","").split(",").sort
values = Hash[('a'..'z').to_a.zip((1..26).to_a)]
total = 0
f.each_with_index do |name, index|
  sum = 0
  name.each_char do |char|
     sum += values[char]
  end
  total += sum * (index + 1)
end
puts total