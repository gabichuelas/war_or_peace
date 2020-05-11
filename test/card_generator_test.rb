require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './cards'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
  end

end
