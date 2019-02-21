require "minitest"
require "minitest/spec"
require "minitest/autorun"
require "minitest/reporters"
require "minitest/pride"

require_relative "../lib/blackjack_score"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Blackjack Score" do
  it "can calculate the score for a pair of number cards" do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 7
  end

  it "facecards have values calculated correctly" do
    # Arrange
    facecards = ["King", "Queen", "Jack"]

    # Act
    score = 0
    facecards.each do |card|
      score = blackjack_score([card, 6])
    end

    # Assert
    expect(score).must_equal 16
  end

  it "calculates aces as 11 where it does not go over 21" do
    # Arrange
    hand = [1, 5]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 16
  end

  it "calculates aces as 1, if an 11 would cause the score to go over 21" do
    # Arrange
    hand = [1, 9, 7]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 17
  end

  it "raises an ArgumentError for invalid cards" do
    hand = [2, "Joker"]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError
  end

  it "raises an ArgumentError for more than 5 cards in the hand" do
    hand = [2, 9, 7, 2, 3, 3]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError
  end
end
