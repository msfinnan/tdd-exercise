# blackjack_score.rb

VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "King", "Queen", "Jack"]

def blackjack_score(hand)
  score = hand.reduce(:+)
end

# You will write a method called: blackjack_score which take an array of card values and returns the blackjack score. The card values can be any of the following, number values 1-9, "King", "Queen", "Jack". If the array contains an invalid card value or the total exceeds 21, raise an ArgumentError. For example blackjack_score([1, 5, 3]) will return 19. You should also raise an error if the hand contains more than 5 cards.
