require 'rspec'

class Integer
  def multiple_of?(x)
    (self % x).zero?
  end

  private
  def seven?
    self == 7
  end
end

describe 'predicate specs' do
  describe 0 do
    it { is_expected.to be_zero }
  end

  describe [] do
    it { is_expected.to be_empty }
  end

  describe [1, "abx", 7] do
    it { is_expected.to_not be_empty }
  end

  describe Hash.new(123)  do
    it { is_expected.to be_empty }
  end

  describe Hash(a: 'a', b: 'b') do
    it { is_expected.to_not be_empty }
    it { is_expected.to have_key(:a) }
    it { is_expected.to_not have_key('a') }
    it { is_expected.to have_value('b') }
    it { is_expected.to_not have_value('z') }
  end

  describe 15 do
    it { is_expected.to be_multiple_of(5) }
    it { is_expected.to_not be_multiple_of(7) }
  end

  describe "private methods" do
    # it { expect(7).to be_seven } fail because is a private method
  end
end
