triangle =  [
			[75],
		    [95, 64],
			[17, 47, 82],
			[18, 35, 87, 10],
			[20, 04, 82, 47, 65],
			[19, 01, 23, 75, 03, 34],
			[88, 02, 77, 73, 07, 63, 67],
			[99, 65, 04, 28, 06, 16, 70, 92],
			[41, 41, 26, 56, 83, 40, 80, 70, 33],
			[41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
			[53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
			[70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
			[91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
			[63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
			[04, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 04, 23]
			]

options = []
current_start = 0
current_index = 0
while current_start < triangle[triangle.length - 1].length
	max = []
	start = 0
	15.downto(1) do |i|
		if i == 1
			max << 75
		elsif start == 0
			max << current_value = triangle[i-1][current_start]
			current_index =	triangle[i-1].index(current_value)
		elsif current_index == triangle[i-1].length
			max << current_value = triangle[i-1][current_index - 1..current_index].max { |a,b| a <=> b }
			current_index =	triangle[i-1].index(current_value)
		else
			max << current_value = triangle[i-1][current_index..current_index + 1].max { |a,b| a <=> b }
			current_index =	triangle[i-1].index(current_value)
		end
		start += 1
		options << max
	end
	current_start += 1
end
puts options.count.to_s
puts options.max { |a,b| a.inject(0, &:+) <=> b.inject(0, &:+) }.inject(0, &:+) 