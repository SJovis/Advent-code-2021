require 'byebug'

def read_input
  file = File.open('input.txt')
  input = file.readlines.map(&:chomp).map(&:to_i)
  file.close
  input
end

sample = [196,
          197,
          176,
          182,
          179,
          177,
          171,
          172,
          170,
          147,
          143,
          153,
          158]

def check_depth(arr)
  times_increased = 0
  arr.each_with_index do |number, i|
    next if i.zero?

    times_increased += 1 if number > arr[i - 1]
  end
  times_increased
end

def check_depth_avg(arr)
  depths = []
  arr.each_with_index do |number, i|
    break if arr[i + 1].nil? || arr[i + 2].nil?

    depths << number + arr[i + 1] + arr[i + 2]
  end
  check_depth(depths)
end

puts check_depth(read_input)
puts check_depth_avg(read_input)
