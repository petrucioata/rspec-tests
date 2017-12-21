require 'rspec'
require_relative '../address_validator'

describe AddressValidator do
  it 'returns false for incomplete address' do
    address = { street: '123 Random Street', city: 'OneCity' }
    expect(AddressValidator.valid?(address)).to be_falsy
  end

  it 'missing_parts returns an array of missing required parts' do
    address = { street: '123 Random Street', city: 'OneCity' }
    expect(AddressValidator.missing_parts(address)).to match_array([:county, :postal_code, :country])
  end
end
