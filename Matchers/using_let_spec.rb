require 'rspec'
require_relative '../address_validator'

describe AddressValidator do
  let(:address) { { street: street, city: city } }
  let(:street) { '123 Random Street' }
  let(:city) { 'OneCity' }

  it 'returns false for incomplete address' do
    expect(AddressValidator.valid?(address)).to be_falsy
  end

  it 'returns an array of missing required parts' do
    expect(AddressValidator.missing_parts(address)).to match_array([:county, :postal_code, :country])
  end

  context 'invalid characters in value' do
    let(:city) { 'One$%^&*City' }

    it 'returns keys with invalid values' do
      expect(AddressValidator.invalid_parts(address)).to eq([:city])
    end
  end

  context 'address contains invalid characters' do
    let(:address) { "%123% F1rs& Street, Seco*@ T@wn" }
    it { expect(AddressValidator.valid?(address)).to be_falsy }
  end

  context 'when address is complete' do
    let(:address) do
      {
        street: 'A Correct Street',
        city: 'OneCity',
        county: 'Another Region',
        country: 'Dreamland',
        postal_code: '98765'
      }
    end
    it { expect(AddressValidator.valid?(address)).to be_truthy }
  end
end
