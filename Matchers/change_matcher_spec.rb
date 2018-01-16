require 'rspec'
require 'counter'

describe 'change matcher' do
  it { expect{ Counter.increment }.to change{ Counter.count }.from(0).to(1) }
  it { expect{ Counter.increment }.to change{ Counter.count }.by (1) }
end
