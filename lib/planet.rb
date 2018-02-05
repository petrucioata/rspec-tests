class Planet
  attr_reader :name

  def initialize(name = 'Earth')
    @name = name
  end

  def exists?
    %w{Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune PlanetX}.include?(name)
  end
end
