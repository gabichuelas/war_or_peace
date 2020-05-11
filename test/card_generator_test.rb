require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'


class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
  end

end
