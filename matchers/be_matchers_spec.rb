require 'rspec'

describe 'be matchers' do
  context 'be truthy' do
    it { expect(true).to be_truthy }
    it { expect('some string').to be_truthy }
    it { expect(1967).to be_truthy }
    it { expect(false).not_to be_truthy }
    it { expect(nil).not_to be_truthy }
  end

  context 'be falsey' do
    it { expect(false).to be_falsey }
    it { expect(nil).to be_falsey }
    it { expect(true).not_to be_falsey }
    it { expect('other string').not_to be_falsey }
  end

  context 'be nil' do
    it { expect(nil).to be_nil }
    it { expect(false).not_to be_nil }
    it { expect(true).not_to be_nil }
  end
end
