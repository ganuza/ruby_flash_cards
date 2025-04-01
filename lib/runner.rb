require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# Create some cards
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

# Create a deck with the cards
deck = Deck.new([card_1, card_2, card_3])

# Create a round with the deck
round = Round.new(deck)

# Start an interactive Pry session
require 'pry'; binding.pry

# This line won't execute until after you exit Pry
puts "Thanks for playing!"

