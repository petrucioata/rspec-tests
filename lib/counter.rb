class Counter
  def self.increment
    @count ||= 0
    @count += 1
  end

  def self.count
    @count || 0
  end
end
