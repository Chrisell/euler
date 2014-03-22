class Triangle
  def initialize
    f = File.open("words.txt") or die "Unable to open file..."
    @values = Hash[('A'..'Z').to_a.zip((1..26).to_a)]
    @words = f.readline.gsub("\"", "").split(",")
  end
  
  def loop
    total = 0
    @words.each do |word|
       total += 1 if check_triangle(word)
    end
    puts total
  end
  
  def check_triangle(word)
    value = word.split("").collect { |letter| @values[letter] }.inject(&:+)
    #return @triangle_numbers.include?(0.5 * value * (value + 1))
    return (0.5)*(-1 + Math.sqrt(8*value + 1)) % 1 =
    = 0
  end
end
Triangle.new.loop