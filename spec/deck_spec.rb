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
end