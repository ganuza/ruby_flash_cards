class Deck
  attr_reader :cards

  def initialize(cards = [])
    @cards = Array(cards)
  end

  def add_card(card)
    @cards << card
  end

  def count
    @cards.length
  end
end