require 'card'

describe Card do
  let(:face_card) { Card.new(:club, 13) }
  let(:ace_card) { Card.new(:heart, 1) }
  let(:number_card) { Card.new(:spade, 7) }

  describe "#initialize" do
    it "initialize with a suit" do
      expect(face_card.suit).to eq(:club)
      expect(ace_card.suit).to eq(:heart)
      expect(number_card.suit).to eq(:spade)
    end

    it "initialize with a value" do
      expect(face_card.value).to eq(13)
      expect(ace_card.value).to eq(1)
      expect(number_card.value).to eq(7)
    end
  end

  describe "#to_s" do
    it "displays a face card" do
      expect(face_card.to_s).to eq('CK')
    end

    it "displays an ace" do
      expect(ace_card.to_s).to eq('HA')
    end

    it "displays a number" do
      expect(number_card.to_s).to eq('S7')
    end
  end
end
