require 'hand'

describe Hand do
  let(:card_1) { double("card", :value => 2, :suit => :heart)}
  let(:card_2) { double("card", :value => 2, :suit => :spade)}
  let(:card_3) { double("card", :value => 3, :suit => :diamond) }
  let(:card_4) { double("card", :value => 3, :suit => :heart) }
  let(:card_5) { double("card", :value => 3, :suit => :club) }
  let(:array) {[card_1, card_2, card_3, card_4, card_5]}

  subject(:main_hand) { Hand.new(array) }

  describe '#initialize' do
    it "takes in a hand"
  end

  describe '#take' do
    it "raises an error if card is not in hand" do
      expect {main_hand.take(:heart, 4)}.to raise_error('Not Available')
    end

    it "returns the selected card" do
      expect(main_hand.take(:heart, 2)).to be(card_1)
    end

    it "removes the selected card from hand" do
      main_hand.take(:heart, 2)
      expect(main_hand.stack.size).to eq(4)
    end

  end

  describe '#receive' do
    it "adds the passed in card to hand"
      
  end

  describe 'hand logic' do
    describe "#high_hand" do
      it "returns the highest hand"
    end

    describe "#high_card_in__high_hand" do
      it "returns the highest card within the highest hand"

      it "checks full house"
    end

    describe "#high_card_in_hand" do
      it "returns the highest card in hand"
    end

  end
end
