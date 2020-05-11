require './lib/card'

def create_suit(suit)
  values = %w[2 3 4 5 6 7 8 9 10 jack queen king ace]
  # -----------------------------------------
  ranks_and_values = (2..14).zip(values)
  args = []
  ranks_and_values.map do |ary|
    ary << suit
    args << ary.reverse
  end

  args.collect do |ary|
    Card.new(ary[0], ary[1], ary[2])
  end
end


# values = %w[2 3 4 5 6 7 8 9 10 jack queen king ace]
# # -----------------------------------------
# ranks_and_values_hearts = (2..14).zip(values)
# hearts_args = []
# ranks_and_values_hearts.map do |ary|
#   ary << :hearts
#   hearts_args << ary.reverse
# end
#
# hearts = hearts_args.collect do |ary|
#   Card.new(ary[0], ary[1], ary[2])
# end
#
# # p hearts
# # p hearts.count
# # -----------------------------------------
# ranks_and_values_diamonds = (2..14).zip(values)
# diamonds_args = []
# ranks_and_values_diamonds.map do |ary|
#   ary << :diamonds
#   diamonds_args << ary.reverse
# end
#
# diamonds = diamonds_args.collect do |ary|
#   Card.new(ary[0], ary[1], ary[2])
# end
#
# # p diamonds
# # p diamonds.count
# # -----------------------------------------
# ranks_and_values_spades = (2..14).zip(values)
# spades_args = []
# ranks_and_values_spades.map do |ary|
#   ary << :spades
#   spades_args << ary.reverse
# end
#
# spades = spades_args.collect do |ary|
#   Card.new(ary[0], ary[1], ary[2])
# end
#
# # p spades
# # p spades.count
# # -----------------------------------------
# ranks_and_values_clubs = (2..14).zip(values)
# clubs_args = []
# ranks_and_values_clubs.map do |ary|
#   ary << :clubs
#   clubs_args << ary.reverse
# end
#
# clubs = clubs_args.collect do |ary|
#   Card.new(ary[0], ary[1], ary[2])
# end
#
# # p clubs
# # p clubs.count
# # -----------------------------------------
# std_deck_of_52 = (hearts << diamonds << spades << clubs).flatten
