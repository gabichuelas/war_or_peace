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