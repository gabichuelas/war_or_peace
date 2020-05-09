require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
# --------------------------------

# create 52 cards (std deck)
card1 =
# put those cards into two decks at random
deck1 =
deck2 =
# create two players with latter decks
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)
# -------------------
p "Welcome to War! (or Peace)"
p "This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"
# loop to get user to start game with GO
user = gets.upcase.chomp!
until user.match(/GO/)
  p "Type 'GO' to start the game!"
  user = gets.upcase.chomp!
end
# ---------------------------
# start game using #start
# start method lives in Turn class
# WRITE END GAME CONDITIONS
until (end game conditions)
  turn = Turn.new(player1, player2)
  turn.start
  # turn.start calls piling & awarding helper methods
  # it also returns turn outcome statement
end

# --------------------
# Win/draw statement, end of game.
if player1.deck.cards.count == 0
  p "#{player2.name} has won the game!"
elsif player2.deck.cards.count == 0
  p "#{player1.name} has won the game!"
elsif turn_count == 1000000 || (player1.deck.cards.count == player2.deck.cards.count)
  p "It's a draw!"
end
