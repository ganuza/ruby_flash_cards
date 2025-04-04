class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.length]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    return turn # You don't have to be explicit with the return, like I've done here
  end

  def number_correct
    count = 0
    @turns.each do |turn|
      if turn.correct?
        count += 1
      end
    end
    count
  end

  def number_correct_by_category(category)
    count = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct? == true
        count += 1
      end
    end
    count
  end

  def percent_correct
    number_correct.to_f / @turns.count * 100 # to_f converts the integer to a float
  end

  def percent_correct_by_category(category)
    turn_by_category_count = 0
    @turns.each do |turn|
      if turn.card.category == category
        turn_by_category_count += 1
      end
    end
    if turn_by_category_count == 0
      return 0.0
    else
      return number_correct_by_category(category).to_f / turn_by_category_count * 100
    end
  end

end