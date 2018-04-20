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
end
