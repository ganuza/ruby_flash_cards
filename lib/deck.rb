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

  def cards_in_category(category)
    result = []
    @cards.each do |card|
      if card.category == category
        result << card
      end
    end
    result
  end

    
end