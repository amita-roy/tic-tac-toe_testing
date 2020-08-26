require_relative '../lib/utils.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

describe Utils do
  include Utils
  let(:game) { Game.new }
  let(:board) { Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:result) { validate_selection(4, [1, 'X', 3, 'O', 5, 'X', 7, 8, 9]) }

  describe '#validate_name' do
    let(:error1) { 'The length of the input should be between 3-16 letters' }
    let(:error2) { 'Only String type accepted for the input' }
    let(:error3) { 'Only alphabet letters accepted (no numbers or special characters)' }

    it 'allows game class to have validate_name method with argument' do
      allow(game).to receive(:validate_name).with('Remo').and_return('Remo')
    end

    context 'with invalid input' do
      it 'checks if name length less than 3' do
        expect(validate_name('ss')).to eq(error1)
      end

      it 'checks if name input is a number' do
        expect(validate_name(22)).to eq(error2)
      end

      it 'checks if name input strings is consists of numbers' do
        expect(validate_name('2224444')).to eq(error3)
      end
    end

    context 'with valid input' do
      it 'checks the return result is an instance of String' do
        expect(validate_name('Remo')).to be_instance_of(String)
      end

      it 'checks if the name strings have letters' do
        expect(validate_name('Remo')).to match(/[a-zA-z]/)
      end

      it 'name strings have length of 3 or greater' do
        expect(validate_name('Remo').length).to be > 3
      end

      it 'checks if result string doesn\'t have any white space' do
        expect(validate_name('   Remo    ')).to eq('Remo')
      end
    end
  end

  describe '#validate_selection' do
    let(:selection_error1) { 'The position has already been taken, please select another number' }
    let(:selection_error2) { 'Use numbers between 1 to 9' }

    it 'allows board class to have validate_selection method with arguments' do
      allow(board).to receive(:validate_selection).with(2, board.display_board).and_return(2)
    end
  end
end
