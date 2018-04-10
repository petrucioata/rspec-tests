require 'rspec'

describe 'end_with matcher' do
  let(:content) { "some random text" }
  context 'string usage' do
    it { expect('this is a test').to end_with('test') }
    it { expect("test #{content}").to end_with 'text' }
    it { expect(content).to end_with 'text' }

    it { expect("other random 'text'").not_to end_with 'text' }
  end

  context 'array usage' do
    it { expect(%w{a s d f}).to end_with('f') }
    it { expect(%i(q w e r t y)).to end_with(%i(r t y))}
    it { expect([1, 3, 5, 7, 9]).to end_with(9) }
    it { expect([1, 3, 5, 7, 9]).to end_with 5, 7, 9 }

    it { expect([0, 1, 0, 1, 1]).not_to end_with 1, 1, 2 }
  end
end
