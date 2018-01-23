require 'rspec'

describe 'contain_exactly matcher' do
  describe 'positive requirement' do
    it { expect([1, 3, 2]).to contain_exactly(1, 2, 3) }
    it { expect([1, 3, 2]).to match_array([2, 1, 3]) }
  end

  describe 'negative requirement' do
    it { expect(%i(a b c)).not_to contain_exactly(:a, :b, :d, :c) }
    it { expect(%w(a s d)).not_to match_array(['a', 'c']) }
  end
end
