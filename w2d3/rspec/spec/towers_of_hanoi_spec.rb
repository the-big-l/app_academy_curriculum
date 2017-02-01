require 'towers_of_hanoi'

describe "Towers of Hanoi" do
  let(:towers) {TowersOfHanoi.new(3)}

  describe '#initialize' do
    it "initializes with three arrays" do
      expect(towers.stack[0]).to be_an(Array)
      expect(towers.stack[1]).to be_an(Array)
      expect(towers.stack[2]).to be_an(Array)
    end

    it "the first stack has a length of three" do
      expect(towers.stack[0].length).to eq(3)
    end
    it "the other two arrays are empty" do
      expect(towers.stack[1]).to be_empty
      expect(towers.stack[2]).to be_empty
    end
  end
  
  describe '#play' do
    it "asks user for a move"
    it "calls the move method"
    it "passes in user input to move method"
    it "checks for game over after every move"
  end
  describe '#move' do
    it "checks if move is valid"
    it "moves the disks"
  end
  describe '#won?' do
    context "checks if game is over" do
      it "returns true when game is over"
      it "returns false when game is not over"
    end
  end
end
