require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


class TurnTest < Minitest::Test

  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
  end

  def test_it_exists
    #BASIC turn decks
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_it_has_players
    #BASIC turn decks
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
  end

  def test_it_starts_with_no_spoils_of_war
    #BASIC turn decks
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal [], turn.spoils_of_war
  end

  # BASIC TURN TESTS
  def test_is_basic
    #BASIC turn decks
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    assert_equal :basic, turn.type
  end

  def test_basic_has_a_winner
    #BASIC turn decks
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    winner = turn.winner
    assert_equal "Megan", winner.name
  end

  def test_basic_can_pile_cards
    #BASIC turn decks
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    # the following asserts that the 2 cards that were
    # shifted (removed) from the top of each player's
    # deck were then added to @spoils_of_war
    turn.pile_cards
    assert_equal [@card1, @card3], turn.spoils_of_war
    # test that player's deck was affected
    assert_equal 3, player1.deck.cards.count
    assert_equal 3, player2.deck.cards.count

  end

  def test_basic_awards_spoils_to_turn_winner

    #BASIC turn decks
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    assert_equal 5, winner.deck.cards.count
  end

  # WAR TURN TESTS
  def test_it_is_war
    # WAR turn decks
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    # ------------------
    assert_equal :war, turn.type
  end

  def test_war_has_a_winner
    # WAR turn decks
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    # ------------------
    winner = turn.winner
    assert_equal "Aurora", winner.name
  end

  def test_war_can_pile_cards
    # WAR turn decks
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    # ------------------
    turn.pile_cards
    assert_equal [@card1, @card2, @card5, @card4, @card3, @card6], turn.spoils_of_war
  end

  def test_war_awards_spoils_to_turn_winner
    # WAR turn decks
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    # ------------------
    # On a WAR turn,
    # Players start with 4 cards each,
    # they each play 3 cards, and winner takes
    # all cards played, which == 7 in their deck/hand.
    winner = turn.winner

    turn.pile_cards
    turn.award_spoils(winner)

    assert_equal 7, winner.deck.cards.count
  end

  # MUTUALLY_ASSURED_DESTRUCTION TURN TESTS (MAD)
  def test_it_is_mad
    # MAD turn decks; only card6 changes
    card6 = Card.new(:diamond, '8', 8)
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    # ------------------
    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_mad_has_a_winner
    # MAD turn decks; only card6 changes
    card6 = Card.new(:diamond, '8', 8)
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    # ------------------

    assert_equal "No Winner", turn.winner
  end

  def test_mad_can_remove_cards_from_players
    # MAD turn decks; only card6 changes
    card6 = Card.new(:diamond, '8', 8)
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    # ------------------
    turn.pile_cards
    assert_equal [], turn.spoils_of_war
    # neither player gets cards in this type of turn
  end

  def test_mad_awards_no_spoils
    # MAD turn decks; only card6 changes
    card6 = Card.new(:diamond, '8', 8)
    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    # ------------------
    # On a MAD turn,
    # Players start with 4 cards each,
    # they each play 3 cards, and no cards
    # are awarded. 1 card remains in each deck/hand.
    winner = turn.winner
    turn.pile_cards

    assert_equal 1, player1.deck.cards.count
    assert_equal 1, player2.deck.cards.count
    assert_equal "No spoils to award!", turn.award_spoils(winner)
  end
end
