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

#########################################################
# Start an interactive Pry session
# require 'pry'; binding.pry  <-- uncomment this to debug
#########################################################

def start(round)
  puts "Welcome! You're playing with #{round.deck.cards.count} cards."
  puts "--------------------------------------------------------"

  while round.turns.count < round.deck.cards.count
    current_card = round.current_card
    puts "This is card #{round.turns.count + 1} out of #{round.deck.cards.count}."
    puts "Question: #{current_card.question}"

    guess = gets.chomp

    turn = round.take_turn(guess)

    puts turn.feedback
    puts ""
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} guesses out of #{round.turns.count} for a total score of #{round.percent_correct}%."

  categories = []
  round.deck.cards.each do |card|
    if !categories.include?(card.category)
      categories << card.category
    end
  end

  categories.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category)} % correct"
  end
end

start(round)