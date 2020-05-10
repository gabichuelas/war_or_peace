require './lib/card'

values = %w[2 3 4 5 6 7 8 9 10 jack queen king ace]
ranks_and_values = (2..14).zip(values)

heart_args = []
ranks_and_values.each do |ary|
  ary << :hearts
  heart_args << ary.reverse
end

hearts = hearts_args.collect do |ary|
  Card.new(ary[0], ary[1], ary[2])
end

p hearts
p hearts.count
# hearts is the collection of 13 heart suit cards
# problem is, when I repeat this process for all
# the other suits, the ranks_and_values array is now
# corrupted bc it permanently includes :hearts

#
# diamond_args = []
# ranks_and_values.each do |ary|
#   ary << :diamonds
#   diamond_args << ary.reverse
# end
#
# diamonds = diamond_args.collect do |ary|
#   Card.new(ary[0], ary[1], ary[2])
# end
#
# p diamonds
# p diamonds.count
#
# spades_args = []
# ranks_and_values.each do |ary|
#   ary << :spades
#   spades_args << ary.reverse
# end
#
# spades = spades_args.collect do |ary|
#   Card.new(ary[0], ary[1], ary[2])
# end
#
# p spades
# p spades.count
# require "pry"; binding.pry
