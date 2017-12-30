require 'rspec'

describe 'comparison matchers' do
  describe 'numeric comparison matcher' do
    it { expect(9).to be < 10 }
    it { expect(7).to be > 5 }
    it { expect(8).to be <= 9 }
    it { expect(13).to be >= 13 }
    it { expect(7).to be == 7 }
  end

  describe 'string comparison matchers' do
    it { expect('reD').to be < 'red' }
    it { expect('red').to be > 'Red' }
    it { expect('apple').to be <= 'banana' }
    it { expect('abcdf').to be >= 'abcde' }
  end
end
