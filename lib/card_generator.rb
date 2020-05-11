require 'csv'
require './lib/card'

class CardGenerator
  def initialize(file)
    @file = CSV.read(file)
  end

  def cards
    @file.map do |arg|
      Card.new(arg[0].to_sym, arg[1], arg[2].to_i)
    end
  end
end

cards = CardGenerator.new("cards.txt").cards
p cards
