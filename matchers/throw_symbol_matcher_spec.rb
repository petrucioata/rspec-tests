require 'rspec'

describe 'throw_symbol matcher' do
  let(:simple_hash) {
    { foo: 12, bar: 10 }
  }
  describe 'basic example - only throw a symbol' do
    it { expect { throw :baz }.to throw_symbol }
    it { expect { throw :baz, 123 }.to throw_symbol }

    it { expect { throw simple_hash.keys.sample }.to throw_symbol }
    it { expect { throw simple_hash.keys.first, simple_hash[:foo] }.to throw_symbol }

    it { expect { throw simple_hash[:bar].not_to throw_symbol } }
    it { expect { simple_hash.values.sum }.not_to throw_symbol }
  end

  describe 'a certain symbol is thrown' do
    it { expect { throw :baz }.to throw_symbol(:baz) }
    it { expect { throw :baz, 123 }.to throw_symbol(:baz) }

    it { expect { throw simple_hash.keys.last }.to throw_symbol(:bar) }
    it { expect { throw simple_hash.keys.first, simple_hash[:foo] }.to throw_symbol(:foo) }

    it { expect { throw simple_hash[:bar].not_to throw_symbol(:zoo) } }
    it { expect { simple_hash.values.sum }.not_to throw_symbol(:foo) }
  end

  describe 'a certain symbol and value are thrown' do
    it { expect { throw :baz, 123 }.to throw_symbol(:baz, 123) }
    it { expect { throw simple_hash.keys.first, simple_hash[:foo] }.to throw_symbol(:foo, 12) }

    it { expect { throw simple_hash.keys.first, simple_hash[:foo] }.not_to throw_symbol(:foo, 10) }
    it { expect { throw simple_hash.keys.first, simple_hash[:foo] }.not_to throw_symbol(:bar, 12) }
  end
end
