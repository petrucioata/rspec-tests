require 'rspec'

describe "equality matchers tests" do
  let(:a) { "random text" }
  let(:b) { "random text" }

  it { expect(a).not_to equal(b) } # check for the object_id equality
  it { expect(a).to eql(b) }
  it { expect(a).to be == b }

  it { expect(a).not_to be(b) } # same as a.equal?(b)
  it { expect(a).to eq(b) } # a == b

  it { expect(7).not_to equal(7.0) }
  it { expect(7).not_to eql(7.0) }
  it { expect(7).to eq(7) }
  it { expect(7).to be == 7.0 }
end
