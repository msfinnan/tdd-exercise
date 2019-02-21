# blackjack_score.rb

VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "King", "Queen", "Jack"]
FACE_CARDS = ["King", "Queen", "Jack"]

def blackjack_score(hand)
  score = 0

  if hand.length > 5
    raise ArgumentError, "Hand must be 5 or less"
  end

  hand.each do |card|
    if !VALID_CARDS.include?(card)
      raise ArgumentError, "This hand includes invalid cards"
    end
    if FACE_CARDS.include?(card)
      score += 10
    else
      score += card
    end
  end
  if score < 11 && hand.include?(1)
    score += 10
  end
  return score
end
