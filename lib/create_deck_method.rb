require './lib/card'

def create_suit(suit)
  values = %w[2 3 4 5 6 7 8 9 10 jack queen king ace]
  # -----------------------------------------
  ranks_and_values = (2..14).zip(values)
  # use more descriptive variable names
  suits_values_ranks = []
  ranks_and_values.map do |rank_and_value|
    rank_and_value << suit
    suits_values_ranks << rank_and_value.reverse
  end

  suits_values_ranks.collect do |array|
    Card.new(array[0], array[1], array[2])
  end
end

def create_deck
  hearts = create_suit(:hearts)
  diamonds = create_suit(:diamonds)
  spades = create_suit(:spades)
  clubs = create_suit(:clubs)
  (hearts << diamonds << spades << clubs).flatten.shuffle!
end
