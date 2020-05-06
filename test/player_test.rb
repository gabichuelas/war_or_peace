require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require 'pry'

class DeckTest < Minitest::Test

  def setup

    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)

    @deck = Deck.new([@card1, @card2, @card3])

    @player = Player.new('Clarisa', @deck)

  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_it_has_a_name
    assert_equal 'Clarisa', @player.name
  end

  def test_it_has_a_deck
    assert_equal @deck, @player.deck
  end

  def test_it_has_not_lost_by_default
    refute @player.has_lost?
  end

  def test_it_lost_when_deck_is_empty
    @player.deck.remove_card
    refute @player.has_lost?

    @player.deck.remove_card
    refute @player.has_lost?

    @player.deck.remove_card
    assert @player.has_lost?

    assert_equal [], @player.deck.cards
  end
end
