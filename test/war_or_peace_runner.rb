require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
# --------------------------------

# create 52 cards (std deck)
card1 = Card.new(:heart, 'Jack', 11)
card2 = Card.new(:heart, '10', 10)
card3 = Card.new(:heart, '9', 9)
card4 = Card.new(:diamond, 'Jack', 11)
card5 = Card.new(:heart, '8', 8)
card6 = Card.new(:diamond, 'Queen', 12)
card7 = Card.new(:heart, '3', 3)
card8 = Card.new(:diamond, '2', 2)
# put those cards into two decks at random
deck1 = Deck.new([card1, card2, card5, card8])
deck2 = Deck.new([card3, card4, card6, card7])
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
turn_count = 0
until (player1.deck.cards.count == 0 || player2.deck.cards.count == 0) || turn_count == 100
  turn = Turn.new(player1, player2)
  winner = turn.winner
  turn.start
  turn_count += 1
  p "Turn #{turn_count}: #{winner.name} won #{turn.spoils_of_war.count} cards"
end

# --------------------
# # Win/draw statement, end of game.
# if player1.deck.cards.count == 0
#   p "#{player2.name} has won the game!"
# elsif player2.deck.cards.count == 0
#   p "#{player1.name} has won the game!"
# elsif turn_count == 1000000 || (player1.deck.cards.count == player2.deck.cards.count)
#   p "It's a draw!"
# end
