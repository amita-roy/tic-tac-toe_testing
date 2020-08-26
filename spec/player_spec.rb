require_relative '../lib/player.rb'

describe Player do
  let(:player) { described_class.new('Remo', 'X') }

  context 'class player' do
    it 'is an instance of player class' do
      expect(player).to be_instance_of(Player)
    end

    it 'has name attribute' do
      expect(player).to have_attributes(name: 'Remo')
    end

    it 'has name attribute' do
      expect(player).to have_attributes(sign: 'X')
    end

    it 'checks if name and sign both are instance of String' do
      expect(player.name).to be_instance_of(String)
      expect(player.sign).to be_instance_of(String)
    end
  end
end
