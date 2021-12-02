def read_input
  file = File.open('input.txt')
  input = file.readlines.map(&:chomp)
  file.close
  input
end

def calc_distance(input)
  horizontal = 0
  depth = 0
  input.each do |move|
    value = (move.match(/\d+/))[0].to_i
    horizontal += value if move.include?('forward')
    depth += value if move.include?('down')
    depth -= value if move.include?('up')
  end
  horizontal * depth
end

def calc_distance_second(input)
  horizontal = 0
  depth = 0
  aim = 0
  input.each do |move|
    value = (move.match(/\d+/))[0].to_i
    if move.include?('forward')
      horizontal += value
      depth += (aim * value)
    elsif move.include?('down')
      aim += value
    elsif move.include?('up')
      aim -= value
    end
  end
  horizontal * depth
end

puts calc_distance(read_input)
puts calc_distance_second(read_input)
