class Words
	def initialize
		@ones = ["", "one","two", "three", "four", "five", "six", "seven", "eight", "nine"]
		@twos = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty","ninety"]
		@threes = @ones.map { |one| one + "hundred" }
		@normals = ["eleven","twelve","thirteen", "fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
		@huge_string = ''
		1.upto(1000) do |i|
			@huge_string = "#{@huge_string}#{stringify(i)}"
		end
		puts @huge_string.split('').length
	end
	
	def stringify(i)
		number = i.to_s.split('').map { |x| x.to_i }
		if (i > 10) && (i < 20)
			
			@normals[(number[1] - 1)]
		else
			case number.length
				when 1
					@ones[number[0]]
				when 2
					@twos[number[0]] + @ones[number[1]]
				when 3
					if number[1] == 0 && number[2] == 0
						@threes[number[0]] 
					elsif number[1] == 1 && number[2] != 0
						@threes[number[0]] + "and" + @normals[number[2] - 1]
					else
						@threes[number[0]] + "and" + @twos[number[1]] + @ones[number[2]]
					end
				when 4
					"onethousand"
			end
		end
	end
	
end
Words.new
