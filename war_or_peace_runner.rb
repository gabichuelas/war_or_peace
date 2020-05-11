require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/create_suit_method'

# create 52 cards (std deck)
hearts = create_suit(:hearts)
diamonds = create_suit(:diamonds)
spades = create_suit(:spades)
clubs = create_suit(:clubs)

deck_of_52 =
(hearts << diamonds << spades << clubs).flatten

# put those cards into two decks at random
deck_of_52.shuffle!

deck_1 = []
26.times do
  deck_1 << deck_of_52.shift
end
deck_2 = deck_of_52

deck1 = Deck.new(deck_1)
deck2 = Deck.new(deck_2)

# create two players with latter decks
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

# -------------------
p "Welcome to War! (or Peace)"
p "This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

# User input loop to start game -----------------------
user = gets.upcase.chomp!
until user.match(/GO/)
  p "Type 'GO' to start the game!"
  user = gets.upcase.chomp!
end

# Game play loop -----------------------
turn_count = 0
until (player1.deck.cards.count == 0 || player2.deck.cards.count == 0) || turn_count == 1000000
  turn = Turn.new(player1, player2)
  winner = turn.winner
  turn.start
  turn_count += 1
  if winner.class == Player
    if turn.type == :war
      p "Turn #{turn_count}: WAR - #{winner.name} won #{turn.spoils_of_war.count} cards"
    else
      p "Turn #{turn_count}: #{winner.name} won #{turn.spoils_of_war.count} cards"
    end
  else
    p "Turn #{turn_count}: *mutually assured destruction* - #{turn.spoils_of_war.count} cards removed from play"
  end
end

# Win/draw statement -----------------------
if player1.deck.cards.count == 0
  p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
elsif player2.deck.cards.count == 0
  p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
elsif turn_count == 1000000 || (player1.deck.cards.count == player2.deck.cards.count)
  p "---- DRAW ----"
end
