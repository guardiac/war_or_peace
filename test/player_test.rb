require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)

    @player = Player.new('Clarisa', @deck)
  end

  def test_it_exists

    assert_instance_of Player, @player
  end

  def test_it_has_name

    assert_equal 'Clarisa', @player.name
  end

  def test_it_has_a_deck

    assert_equal @deck, @player.deck
  end

  def test_it_knows_if_it_lost

    assert_equal false, @player.has_lost?

    @deck.remove_card
    assert_equal false, @player.has_lost?

    @deck.remove_card
    assert_equal false, @player.has_lost?

    @deck.remove_card
    assert_equal true, @player.has_lost?
  end
end
