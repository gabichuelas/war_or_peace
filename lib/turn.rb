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
    if @type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif @type == :war
      3.times do
        @spoils_of_war << @player1.deck.cards.shift
      end
      3.times do
        @spoils_of_war << @player2.deck.cards.shift
      end
    elsif @type == :mutually_assured_destruction
      3.times do
        @player1.deck.cards.shift
      end
      3.times do
        @player2.deck.cards.shift
      end
    end
    @spoils_of_war
  end

  def award_spoils(winner)
    # this method will add each of the cards in the @spoils_of_war array to the winner of the turn.
    winners_deck = winner.deck.cards
    @spoils_of_war.each do |card|
      winners_deck << card
    end
    # this method leaves @spoils_of_war intact;
    # do we actually want to remove those cards from
    # @spoils_of_war permanently and into
    # the winner's deck?
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
