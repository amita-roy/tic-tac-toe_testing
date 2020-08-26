require_relative '../lib/board.rb'

describe Board do
  let(:board) { described_class.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:updated_board) { [1, 2, 'X', 4, 'O', 6, 'X', 8, 9] }

  context 'class board' do
    it 'is an instance of board class' do
      expect(board).to be_instance_of(Board)
    end

    it 'has display_board attribute' do
      expect(board).to have_attributes(display_board: [1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
    it 'responds to built in ruby methods' do
      expect(board.display_board).to respond_to(:each_with_index)
    end

    it 'checks if it receive update_board method with 2 arguments' do
      expect(board).to receive(:update_board).with(2, 'X')
      board.update_board(2, 'X')
    end

    it 'checks if it receive display method' do
      expect(board).to receive(:display)
      board.display
    end

    it 'compares the default board with updated board' do
      expect(board.display_board).not_to eq(updated_board)
    end
  end

  context 'display_board' do
    it 'has a length of 9' do
      expect(board.display_board.length).to eq(9)
    end
  end
end
