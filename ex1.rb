# frozen_string_literal: true

sum = 0
1000.times do |x|
  if (x % 3).zero? || (x % 5).zero?
    sum += x
  end
end

puts sum
