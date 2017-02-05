require 'problem_set'

describe "Array methods" do
  describe "#my_uniq" do
    it "doesn't remove unnecessary items" do
      arr = [1, 2, 3]
      expect(arr.my_uniq).to eq(arr)
    end

    it "removes duplicates" do
       arr = [1, 2, 1, 3, 3]
       expect(arr.my_uniq).to eq([1, 2, 3])
    end

    it "doesn't modify original array" do
      arr = [1, 2, 3]
      arr.my_uniq

      expect(arr).to be(arr)
    end
  end

  describe '#two_sum' do
    let(:array) { [[-1, 0, 2, -2, 1]] } # best way?

    it "output an array" do
      expect(array.two_sum).to be_an(Array)
    end

    it "it only finds pairs that add to zero" do
      expect(
        array.two_sum.all? do |pair|
          pair.inject { |sum, i| sum += array[i] }.zero?
        end
      ).to be true
    end

    it "doesn't find the same pair twice" do
      expect(array.two_sum).to eq(array.two_sum.uniq)
    end

    it "doesn't match the same index with itself" do
      expect(
        array.two_sum.none? { |pair| pair[0] == pair[1] }
      ).to be true
    end

    it "checks the array in ascending order" do
      array = [1, -1 , -1, 0]
      expect(array.two_sum).to start_with([0,1])
      expect(array.two_sum).to end_with([0,2])
    end
  end

  describe '#my_transpose' do
    it "checks if the array is multi-dimensional" do
      array = [1, 2, 3]
      expect {array.my_transpose}.to raise_error("Invalid array")
    end

    it "transposes a 2x2 matrix" do
      array = [[1,2], [3,4]]
      expect(array.my_transpose).to eq([[1,3], [2,4]])
    end
    it "transposes a 3x3 matrix" do
      array = [[0, 1, 2],
               [3, 4, 5],
               [6, 7, 8]]

      solution = [[0, 3, 6],
                  [1, 4, 7],
                  [2, 5, 8]]

      expect(array.my_transpose).to eq(solution)
    end
  end

  describe "#stock_picker" do
    let(:stocks) { [25, 10, 9, 15, 6, 20] }

    it "lower value has to come before the higher value" do
      result = stocks.stock_picker
      expect(result.first < result.last).to be true
    end

    it "finds the most profitable pair" do
      expect(stocks.stock_picker).to eq([4, 5])
    end
  end
end
