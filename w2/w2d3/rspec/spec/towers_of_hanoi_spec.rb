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

  # describe '#play' do
  #   let(:$stdin) { double("user") }
  #   user_input = '1, 2'
  #   allow(:$stdin).to receive(:gets).and_return(user_input)
  #   allow(towers).to receive(:won?).and_return(true)
  #
  #   it "asks user for a move" do
  #     expect($stdin).to receive(:gets)
  #     towers.play
  #   end
  #
  #   it "calls the move method" do
  #     expect(towers).to receive(:move)
  #     towers.play
  #   end
  #   it "passes in user input to move method" do
  #     expect(towers).to receive(:move).with(user_input)
  #     towers.play
  #   end
  #   it "checks for game over after every move" do
  #     expect(towers).to receive(:won?)
  #     towers.play
  #   end
  #
  #   allow(towers).to receive(:won?).and_return(false)
  # end

  describe '#move' do

    it "raise error if to stack is smaller" do
      towers.stack = [[3], [2], [1]]
      expect {towers.move([0, 1])}.to raise_error("Invalid move")
    end

    it 'raises an error if from stack is empty' do
      expect {towers.move([1, 2]) }.to raise_error("Empty 'from' stack")
    end

    it "moves the disks" do
      towers.move([0, 1])
      expect(towers.stack[0]).to eq([3, 2])
      expect(towers.stack[1]).to eq([1])
    end
  end

  describe '#won?' do
    context "checks if game is over" do
      it "returns true when game is over" do
        towers.stack = [[], [], [3,2,1]]
        expect(towers.won?).to be true
      end

      it "returns true when game is over on a diferent stack" do
        towers.stack = [[], [3,2,1], []]
        expect(towers.won?).to be true
      end

      it "returns false when game is not over" do
        expect(towers.won?).to be false
        towers.stack = [[3],[2],[1]]
        expect(towers.won?).to be false
      end

    end
  end
end
