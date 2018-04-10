require 'rspec'

describe 'raise_error matcher' do
  describe 'calling a missing method' do
    context 'when any error is expected' do
      it { expect{ Object.new.method_name }.to raise_error }
      it { expect{ Object.new.method_name }.to raise_exception }
    end

    context 'when a specific error is expected' do
      it { expect{ Object.new.method_name }.to raise_error(NameError) }
    end
  end

  describe 'matching error message' do
    context 'with string' do
      it 'matches the error message' do
        expect { raise StandardError, 'custom error message' }.
          to raise_error('custom error message')
      end
    end

    context 'with a regular expression' do
      it 'matches the error message' do
        expect { raise StandardError, 'custom error message' }.
          to raise_error(/custom/)
      end
    end

    context "with 'with_message'" do
      it 'matches the error message' do
        expect { raise StandardError, 'custom error message' }.
          to raise_error.with_message(/custom/)
      end
    end

    context 'with match class' do
      context 'with string' do
        it 'matches the error message' do
          expect { raise StandardError, 'this message exactly'}.
            to raise_error(StandardError, 'this message exactly')
        end
      end

      context 'with regular expression' do
        it 'matches the error message' do
          expect { raise StandardError, "my message" }.
            to raise_error(StandardError, /my mess/)
        end
      end
    end
  end

  context 'set expectation on error object passed to block' do
    it 'raises NameError' do
      expect { Object.new.foo }.to raise_error { |error|
        expect(error).to be_a(NameError)
      }
    end
  end

  context 'expect no error at all' do
    it 'does not raise' do
      expect { Object.new.to_s }.not_to raise_error
    end
  end
end

