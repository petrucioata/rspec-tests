require 'rspec'

describe 'satisfy matcher' do
  it { expect('just test').to satisfy{|string| string.size == 9} }
  it { expect('A').not_to satisfy{|char| char.to_i == 65} }

  it { expect(10).to satisfy{ 5 + 5 } }
  it { expect(12).to satisfy{ 7.*(3).-(9) } }
  it { expect(7).not_to satisfy{ |v| v > 8 } }
end
