require 'rspec'

describe 'include matcher' do
  context 'when string' do
    let(:a_string) { "one test string" }

    it { expect(a_string).to include('t') }
    it { expect(a_string).to include('on', 'est', 'ing') }

    it { expect(a_string).not_to include('z') }
    it { expect(a_string).not_to include('ones', 'tesq') }
  end

  context 'when array' do
    let(:vowels) { %w<a e i o u> }
    let(:digits) { (0..9).to_a.select(&:odd?) }

    it { expect(vowels).to include('i') }
    it { expect(vowels).to include('a', 'u') }
    it { expect(vowels).to include(a_kind_of(Object)) }
    it { expect(vowels).to include(a_kind_of(String)) }
    it { expect(vowels).not_to include('b') }

    it { expect(digits).to include(be_odd) }
    it { expect(digits).to include(be_odd.and be < 10) }
    it { expect(digits).to include(1, 3, 5) }
    it { expect(digits).not_to include(be_even.or be > 9) }
    it { expect(digits).not_to include(4, 6) }
    it { expect(digits).not_to include(a_kind_of(Symbol)) }
  end

  context 'when hash' do
    let(:languages) do
      {
        c: 'Dennis Ritchie',
        python: 'Guido Van Rossum',
        d: 'Andrei Alexandrescu',
        ruby: 'Yukihiro Matsumoto'
      }
    end

    it { expect(languages).to include(:ruby, :c, :d) } # keys
    it { expect(languages).to include(ruby: 'Yukihiro Matsumoto') } #pair
    it { expect(languages).to include(python: 'Guido Van Rossum', c: 'Dennis Ritchie') } # pairs
    it { expect(languages).not_to include(:java, :elixir) } # other keys
    it { expect(languages).not_to include(ruby: 'Dennis Ritchie') } # wrong pair
  end
end
