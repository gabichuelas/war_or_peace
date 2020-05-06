class Turn
  attr_reader :player1, :player2, :type, :spoils_of_war, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

    # control flow to determine what the turn.type is:
    @type = if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end

  end

  def pile_cards
  end

  def award_spoils
    # this method will add each of the cards in the @spoils_of_war array to the winner of the turn.
  end

  def winner
    if @type == :basic
      return @player1 unless @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
    elsif @type == :war
      return @player1 unless @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
    elsif @type == :mutually_assured_destruction
      return "No Winner"
    end
  end
end


# TURN TYPE HASH

# { basic: @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0),
#   war: @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0),
#   mutually_assured_destruction: @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
#   @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
# }
