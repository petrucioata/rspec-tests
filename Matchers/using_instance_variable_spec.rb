require 'rspec'
require_relative '../address_validator'

describe AddressValidator do
  before do
    @address = { street: '123 Random Street', city: 'OneCity' }
  end

  it 'returns false for incomplete address' do
    expect(AddressValidator.valid?(@address)).to be_falsy
  end

  it 'returns an array of missing required parts' do
    expect(AddressValidator.missing_parts(@address)).to match_array([:county, :postal_code, :country])
  end

  context 'invalid characters in value' do
    before do
      @address = { street: '123 Random Street', city: 'One$%^&*City' }
    end

    it 'returns keys with invalid values' do
      expect(AddressValidator.invalid_parts(@address)).to eq([:city])
    end
  end
end
