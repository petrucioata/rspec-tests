require 'rspec'

describe 'first rspec test' do
  it 'returns true' do
    expect('hello rspec').to eq('hello rspec')
  end

  it 'fails' do
    # expect('bau').to eq('hello')
  end
end
