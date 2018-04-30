require 'rspec'
require 'yield_class'

describe 'yield matchers' do

  describe 'yield_control matcher' do
    it { expect { |arg| YieldClass.yield_once_with(1, &arg) }.to yield_control }

    it { expect { |arg| YieldClass.dont_yield(&arg).not_to  yield_control } }

    it { expect { |arg| YieldClass.yield_twice_with(1, &arg) }.to yield_control.twice }
    it { expect { |arg| YieldClass.yield_twice_with(1, &arg) }.to yield_control.exactly(2).times }
    it { expect { |arg| YieldClass.yield_twice_with(1, &arg) }.to yield_control.at_least(1) }
    it { expect { |arg| YieldClass.yield_twice_with(1, &arg) }.to yield_control.at_most(3).times }
  end

  describe 'yield_with_args matcher' do
    it { expect { |arg| YieldClass.yield_once_with('foo', &arg) }.to yield_with_args }
    it { expect { |arg| YieldClass.yield_once_with('abc', &arg) }.to yield_with_args('abc') }
    # it { expect { |arg| YieldClass.yield_once_with('abc', &arg) }.to yield_with_args('foo') } - F
    it { expect { |arg| YieldClass.yield_once_with('xyz', &arg) }.to yield_with_args(String) }
    it { expect { |arg| YieldClass.yield_once_with('bar', &arg) }.to yield_with_args(/ar/) }

    it { expect { |arg| YieldClass.yield_once_with('foo', 'bar', &arg) }.to yield_with_args }
    it { expect { |arg| YieldClass.yield_once_with('foo', 'bar', &arg) }.to yield_with_args('foo', 'bar') }
    it { expect { |arg| YieldClass.yield_once_with('foo', 'bar', &arg) }.to yield_with_args(String, String) }
    it { expect { |arg| YieldClass.yield_once_with('foo', 'bar', &arg) }.to yield_with_args(/fo/, /ar/) }
    it { expect { |arg| YieldClass.yield_once_with('foo', 'bar', &arg) }.to yield_with_args(String, /ar/) }
    it { expect { |arg| YieldClass.yield_once_with('foo', 'bar', &arg) }.to yield_with_args('foo', /ar/) }

    it { expect { |arg| YieldClass.yield_once_with('foo', 123, &arg) }.not_to yield_with_args(Integer, String) }
    it { expect { |arg| YieldClass.yield_once_with('foo', 123, &arg) }.not_to yield_with_args('foo', /23/) }
  end
end
