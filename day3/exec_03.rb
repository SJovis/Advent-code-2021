require 'byebug'

def read_input
  file = File.open('input.txt')
  input = file.readlines.map(&:chomp)
  file.close
  input
end

def reverse(number)
  number.chars.map do |digit|
    digit == '1' ? '0' : '1'
  end
end

def task_one(input)
  value = [0] * 12
  input.each do |code|
    code.chars.map(&:to_i).each_with_index do |n, i|
      n == 1 ? value[i] += 1 : value[i] -= 1
    end
  end
  value.each_with_index { |digit, index| value[index] = digit.positive? ? 1 : 0 }
  gamma = value.join.to_i(2)
  epsilon = reverse(value.join).join.to_i(2)
  gamma * epsilon
end

# puts task_one(read_input)

def find_common(input, index, thing)
  value = 0
  input.each do |number|
    number[index] == '1' ? value += 1 : value -= 1
  end


  thing == 'o2' ? (value = value >= 0 ? 1 : 0) : (value = value.negative? ? 1 : 0)
  new_input = input.select { |n| n[index].to_i == value }

  index += 1
  find_common(new_input, index, thing) if new_input.length > 1

  # nless new_input.length == 1

  result = new_input.join.to_i(2)
  return result
end

puts find_common(read_input, 0, 'o2')
puts find_common(read_input, 0, 'noto2')

# def task_two
#   o2 = find_common(read_input, 0, 'o2').to_i
#   co2 = find_common(read_input, 0, 'noto2').to_i
#   o2 * co2
# end

# puts task_two
