# Deals a bridge hand as a 2D array, with luck

@deck = []

def make_deck
  # Creates a bridge deck with 52 cards in the 4 suits, represented by hashes (suit's initial), (card rank)
  suits = [:C, :D, :H, :S]
  suits.each do |suit|
    1..13.times do |rank|
      rank += 2
      @deck.push({suit => rank})
    end
  end
  @deck
end


def hand_deal
  # separates 13 [suit, rank] elements from the deck and returns a 2-dimensional array 
  # with those elements together, removing them from the deck
  hand = []
  13.times do
    num = rand(@deck.length)
    hand.push @deck[num]
    @deck.delete_at(num)
  end
  return hand
end

make_deck
p hand_deal
puts ""
p @deck

# def sort_suits(hand)
#   # takes in an unsorted hand and returns a 2D array with each member representing a suit, in bridge order
#   clubs = []
#   diamonds = []
#   hearts = []
#   spades = []
#   hand.each do |card|
#     case card[0]
#     when "S"
#       spades.push(card[1])
#     when "H"
#       hearts.push(card[1])
#     when "D"
#       diamonds.push(card[1])
#     when "C"
#       clubs.push(card[1])
#     end
#   end
#   sorted_hand = [spades, hearts, diamonds, clubs]
# end


# def sort_ranks(hand)
#   # sorts the cards from top to bottom, while they're still represented numerically
#   hand.each do |suit|
#     suit.sort!.reverse!
#   end
# end

# def bridgify (sorted_hand)
#   # changes the cards in a hand to single-character strings representing the actual bridge card names
#   # and returns an array of <= 4 sub-arrays representing suits
#   suit_counter = 0
#   clubs = []
#   diamonds = []
#   hearts = []
#   spades = []
#   bridgified_hand = [spades, hearts, diamonds, clubs]
  
#   sorted_hand.each do |suit|
#     suit.each do |card|
#       case card
#       when 14
#         bridge_card = "A"
#       when 13
#         bridge_card = "K"
#       when 12
#         bridge_card = "Q"
#       when 11
#         bridge_card = "J"
#       when 10
#         bridge_card = "T"
#       else
#         bridge_card = card.to_s
#       end
#       bridgified_hand[suit_counter].push bridge_card
#     end
#     suit_counter += 1
#   end
#   bridgified_hand
# end

# make_deck
# hand = bridgify(sort_ranks(sort_suits(hand_deal)))

# p hand
# puts ""
# p @deck

=begin
deck = make_deck
hand, rest_deck = hand_deal(deck)
bridge_hand = bridgify(sort_hand(hand))
end_deck = bridgify(sort_hand(rest_deck))

def restricted_hand_deal(deck_arr)
  # separates 13 non-random elements from an array and returns an N+1-dimensional array 
  # with those elements together + the remaining elements of the array as they were
  rest_deck = deck_arr
  hand = []
  13.times do
    num = rand(rest_deck.length)
    hand.push rest_deck[num]
    rest_deck.delete_at(num)
  end
  return hand, rest_deck
end
=end