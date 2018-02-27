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

  context 'when the arguments are specified' do
    it { expect(777).to respond_to(:zero?).with(0).arguments }
    it { expect(777).to respond_to(:between?).with(2).arguments }
    it { expect(999).not_to respond_to(:upto).with(3).arguments }

    it { expect("string").to respond_to(:size).with(0).arguments }
    it { expect("string").to respond_to(:include?).with(1).arguments }
    it { expect("test").not_to respond_to(:sample).with(10).arguments }
    it { expect("test").not_to respond_to(:class).with(10).arguments }

    it { expect(Hash.new).to respond_to(:keys).with(0).arguments }
    it { expect(Hash.new).to respond_to(:has_value?).with(1).arguments }
    it { expect(Hash.new).not_to respond_to(:key).with(0).arguments }
  end
end
