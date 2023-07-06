require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'
require 'pry'

all_cards = CardGenerator.new.all_the_cards
split_cards = CardGenerator.new.split_cards

deck1 = Deck.new(split_cards[0]) 
deck2 = Deck.new(split_cards[1])

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

game = Game.new(player1, player2)

p "Welcome to War! (or Peace) This game will be played with 52 cards."

p "The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
p "------------------------------------------------------------------"

input = gets.chomp!

until input == "GO" 
  puts "Please enter 'GO' to start"
  input = gets.chomp!
end 

game.start 