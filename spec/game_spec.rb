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
end
