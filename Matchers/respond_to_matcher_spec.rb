require 'rspec'

describe 'respond_to matcher' do
  context 'basic usage - a string and an array' do
    let(:a_string) { "just a test" }
    let(:an_array) { %w(a b c d) }

    it { expect(a_string).to respond_to(:upcase) }
    it { expect(a_string).to respond_to(:length, :size) }
    it { expect(an_array).to respond_to(:sample) }
    it { expect(an_array).to respond_to(:length, :size, :count) }

    it { expect(a_string).not_to respond_to(:sample) }
    it { expect(an_array).not_to respond_to(:chars) }
    it { expect(a_string).not_to respond_to(:to_a, :sample) }

    # both will fail because String contains only size method
    # it { expect(a_string).not_to respond_to(:sample, :size) }
    # it { expect(a_string).to respond_to(:sample, :size) }
  end
end
