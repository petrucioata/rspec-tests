class YieldClass
  def self.yield_once_with(*args)
    yield *args
  end

  def self.yield_twice_with(*args)
    2.times { yield *args }
  end

  def self.raw_yield
    yield
  end

  def self.dont_yield
  end
end
