require 'rspec'

describe 'be_within matcher' do
  context 'floating point values' do
    it { expect(16.5).to be_within(0.5).of(17) }
    it { expect(16.5).to be_within(0.5).of(17.0) }
    it { expect(16.5).to be_within(0.5).of(16.0) }
    it { expect(16.5).to be_within(0.5).of(16.01) }
    it { expect(16.5).to be_within(0.5).of(16.9) }

    it { expect(27.3).not_to be_within(0.5).of(26.7) }
    it { expect(27.3).not_to be_within(0.5).of(27.9) }
  end
end
