require 'rspec'

describe 'match matcher spec' do
  context 'when string' do
    let (:a_string) { "one string test" }

    it { expect(:a_string).to match(/str/) }
    it { expect(:a_string).not_to match(/ste/) }
  end

  context 'when regular expression' do
    it { expect(/foo/).to match("food") }
    it { expect(/foo/).not_to match("string") }
  end
end
