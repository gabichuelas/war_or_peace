require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class BasicTurnTest < Minitest::Test

  def setup
    # setup for basic turn type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    @player1 = Player.new("Megan", deck1)
    @player2 = Player.new("Aurora", deck2)

    @turn = Turn.new(@player1, @player2)

  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_players
    assert_equal @player1, @turn.player1
    assert_equal @player2, @turn.player2
  end

  def test_it_starts_with_no_spoils_of_war
    assert_equal [], @turn.spoils_of_war
  end

  def test_it_is_basic
    assert_equal :basic, @turn.type
  end

  def test_it_has_a_winner
    winner = @turn.winner
    assert_equal "Megan", winner.name
  end

  def test_it_can_pile_cards_into_spoils_of_war
    # the following asserts that the 2 cards that were
    # shifted (removed) from the top of each player's
    # deck were then added to @spoils_of_war
    assert_equal @turn.spoils_of_war, @turn.pile_cards
  end

  def test_it_awards_spoils_to_turn_winner
    # On a basic turn,
    # Players start with 4 cards each,
    # they each play 1, and winner takes
    # both cards played, which == 5 in their deck/hand.
    winner = @turn.winner
    @turn.pile_cards

    @turn.award_spoils(winner)
    assert_equal 5, winner.deck.cards.count
  end

end
