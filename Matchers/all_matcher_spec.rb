require 'rspec'

class String
  def vowel?
    %q[aeiou].include?(self)
  end
end

describe 'all matcher' do
  describe 'simple matcher' do
    it { expect([2, 4, 6, 8, 20]).to all(be_even) }
    it { expect([1, 3, 5, 7, 17]).to all(be_odd) }
    it { expect([1, 3, 5, 7, 11]).to all(be < 15) }
    it { expect([0, 0, 0, 0, 0]).to all(be_zero) }
    it { expect(['a', 'e', 'i', 'o', 'u']).to all(be_vowel) }
    it { expect([1, 2, 3, 4, 5, 6]).to all(be_a_kind_of(Numeric)) }
    it { expect([:a, :b, :c, :d]).to all(be_an_instance_of(Symbol)) }
  end

  describe 'compound matcher' do
    it { expect([1, 3, 5, 7, 9]).to all(be_even.or be < 10) }
    it { expect([1, 3, 5, 7, 9]).to all(be_odd.and be < 10) }
    it { expect([1.1, 3.3, 5.3, 7.7, 9.999]).to all(be_a(Float).and be < 10) }
    it { expect(['a', 'e', 'i', 'd']).to all(be_vowel.or be < 'z') }
    it { expect([1, 3, 5, 7, 9]).to all(be_an(Integer).and be < 10) }
    it { expect([:a, :b, :c, :d]).to all(be_an_instance_of(Symbol).or be_a_kind_of(Object)) }
  end
end
