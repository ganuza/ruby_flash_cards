require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    cards = [card_1]
    deck = Deck.new(cards)


    expect(deck).to be_instance_of(Deck)
    expect(deck.cards).to eq([card_1])
  end

  it 'can be initialized with multiple cards' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.cards).to include(card_1, card_2, card_3)
  end

  it 'can count how many cards are in the deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.count).to eq(3)
  end

  it 'can filter cards by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    stem_cards = deck.cards_in_category(:STEM)
    expect(stem_cards).to eq([card_2, card_3])

    geography_cards = deck.cards_in_category(:Geography)
    expect(geography_cards).to eq([card_1])

    pop_culture_cards = deck.cards_in_category(:Pop_Culture)
    expect(pop_culture_cards).to eq([])
  end

end