require 'rspec'

describe 'type matchers' do
  describe 'kind of' do
    # actual class
    it { expect(7).to be_kind_of(Fixnum) }
    it { expect("abcd").to be_a_kind_of(String) }
    it { expect(:a).to be_a(Symbol) }

    # super class
    it { expect(7.13).to be_kind_of(Numeric) }
    it { expect(:b).to be_a_kind_of(Object) }
    it { expect(15).to be_a(Integer) }
    it { expect(15).to be_an(Object) }
  end

  describe 'instance of' do
    it { expect("abc").to be_instance_of(String) }
    it { expect(777).to be_an_instance_of(Fixnum) }
    it { expect(:z).to be_instance_of(Symbol) }
    it { expect(Array.new).to be_an_instance_of(Array) }
  end
end
