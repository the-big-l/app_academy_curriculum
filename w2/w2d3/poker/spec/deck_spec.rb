require 'deck'

describe Deck do
  let(:card_1) { double("card", :to_s => "HA") }
  let(:card_2) { double("card", :to_s => "CA") }
  let(:card_3) { double("card", :to_s => "DA") }
  let(:card_4) { double("card", :to_s => "SA") }
  let(:cards) { [card_4, card_3, card_2, card_1] }

  subject(:deck) { Deck.new(cards) }

  describe '#initialize' do
    it "creates a deck in order (S, D, C, H)" do
      expect(deck.take.to_s).to eq('HA')
      expect(deck.take.to_s).to eq('CA')
      expect(deck.take.to_s).to eq('DA')
      expect(deck.take.to_s).to eq('SA')
    end
  end

  describe '#shuffle!' do
    it "shuffles the deck" do
      expect(deck.take.to_s).to eq('HA')
      deck.shuffle!
      expect(deck.take.to_s).to_not eq('CA')
      expect(deck.take.to_s).to_not eq('DA')
    end
  end

  describe '#take' do
    it "takes a Card object from the deck" do
      expect(deck.take.to_s).to eq('HA')
    end

    it "removes the card from the deck" do
      cards.size.times { deck.take }
      expect(deck).to be_empty
    end
  end

  describe "#empty?" do
    it "checks if the deck is empty" do
      cards.size.times { deck.take }
      expect(deck).to be_empty
    end
  end
end
