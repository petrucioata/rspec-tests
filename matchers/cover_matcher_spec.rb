require 'rspec'

describe 'cover matcher' do
  context 'check one element' do
    it { expect(1..7).to cover(1) }
    it { expect(1..7).to cover(7) }
    it { expect(1..7).to cover(4) }

    it { expect(1...7).to cover(1) }
    it { expect(1...7).to cover(3) }

    it { expect(1...7).not_to cover(7) } # [1;7)
    it { expect(1...7).not_to cover(0) }
    it { expect(1...7).not_to cover(9) }
  end

  context 'check multiple elements' do
    it { expect('a'..'f').to cover('c', 'a', 'e') }
    it { expect('m'..'z').to cover('p', 't', 'r', 'u') }

    it { expect(0...10).to cover(1, 7, 9) }
    it { expect(0...10).to cover(9, 7) }

    it { expect(0...10).not_to cover(10, -1) }

    # all elements need to be included or not
    # it { expect(0..10).to cover(3, 7, 12) }
    # it { expect(0..10).not_to cover(3, 7, 12) }
  end
end
