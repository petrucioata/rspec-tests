require 'rspec'

describe 'start_with matcher'  do

  describe 'test start with string' do
    it { is_expected.to start_with('te') }
    it { is_expected.to start_with('test start') }

    it { is_expected.not_to start_with('string') }
    it { is_expected.not_to start_with('test start while') }
  end

  describe [10, 12, 23, 44, 57] do
    it { is_expected.to start_with(10) }
    it { is_expected.to start_with(10, 12, 23) }

    it { is_expected.not_to start_with('10') }
    it { is_expected.not_to start_with(20) }
    it { is_expected.not_to start_with(10, 11) }
  end

  describe %w<testing with words> do
    it { is_expected.to start_with('testing') }
    it { is_expected.to start_with("testing") }
    it { is_expected.to start_with(%w/testing/) }

    it { is_expected.not_to start_with('test') }
    it { is_expected.not_to start_with(%x<test>) }
    it { is_expected.not_to start_with('with') }
  end
end
