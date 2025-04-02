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

end