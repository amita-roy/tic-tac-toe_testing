require_relative '../lib/game.rb'

describe Game do
  let(:game) { described_class.new }

  context 'game class' do
    it 'is an instance of Game class' do
      expect(game).to be_instance_of(Game)
    end

    it 'has winner method' do
      expect(game).to receive(:winner?).with([1, 4, 7])
      game.winner?([1, 4, 7])
    end
  end

  context '#winner?' do
    def winning_combination
      [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ]
    end

    it 'returns true or false' do
      expect(game.winner?([1, 4, 7])).to be true
      expect(game.winner?([1, 2, 5])).to be false
    end

    it 'checks if winning_combination includes array_of_indexes' do
      expect(winning_combination).to include([1, 4, 7])
      expect(winning_combination.include?([2, 3, 5])).to be false
    end
  end
end
