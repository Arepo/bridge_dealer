# Deals a bridge hand as a 2D array, with luck

@deck = []

def make_deck
  # Creates a bridge deck with 52 cards in the 4 suits, represented by the sub-array (suit's initial), (card rank)
  suits = ["C", "D", "H", "S"]
  suits.each do |suit|
    1..13.times do |rank|
      rank += 2
      @deck.push [suit, rank]
    end
  end
  @deck
end


def hand_deal
  # separates 13 random elements from an array and returns an N+1-dimensional array 
  # with those elements together + the remaining elements of the array as they were
  hand = []
  13.times do
    num = rand(@deck.length)
    hand.push @deck[num]
    @deck.delete_at(num)
  end
  return hand
end



def sort_hand(hand)
  # takes in an unsorted hand and returns a 2D array with each member representing a suit, in bridge order
  clubs = []
  diamonds = []
  hearts = []
  spades = []
  hand.each do |card|
    case card[0]
    when "S"
      spades.push(card[1])
    when "H"
      hearts.push(card[1])
    when "D"
      diamonds.push(card[1])
    when "C"
      clubs.push(card[1])
    end
  end
  sorted_hand = [spades, hearts, diamonds, clubs]
  sorted_hand.each do |suit|
    suit.sort!.reverse!
  end
  sorted_hand
end

def bridgify (sorted_hand_2arr)
  # changes the cards in a hand to single-character strings representing the actual bridge card names
  # and returns an array of <= 4 sub-arrays representing suits
  suit_counter = 0
  clubs = []
  diamonds = []
  hearts = []
  spades = []
  bridgified_hand = [spades, hearts, diamonds, clubs]
  
  sorted_hand_2arr.each do |suit|
    suit.each do |card|
      case card
      when 14
        bridge_card = "A"
      when 13
        bridge_card = "K"
      when 12
        bridge_card = "Q"
      when 11
        bridge_card = "J"
      when 10
        bridge_card = "T"
      else
        bridge_card = card.to_s
      end
      bridgified_hand[suit_counter].push bridge_card
    end
    suit_counter += 1
  end
  bridgified_hand
end

make_deck

hand = hand_deal

p bridgify(sort_hand(hand))


# def restricted_hand_deal(deck_arr)
#   # separates 13 non-random elements from an array and returns an N+1-dimensional array 
#   # with those elements together + the remaining elements of the array as they were
#   rest_deck = deck_arr
#   hand = []
#   13.times do
#     num = rand(rest_deck.length)
#     hand.push rest_deck[num]
#     rest_deck.delete_at(num)
#   end
#   return hand, rest_deck
# end