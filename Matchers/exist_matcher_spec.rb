require 'rspec'
require 'planet'

describe 'exist matcher' do
  let(:earth) { Planet.new }
  let(:jupiter) { Planet.new('Jupiter') }
  let(:planetx) { Planet.new('PlanetX') }
  let(:ra) { Planet.new('Ra') }

  it { expect(earth).to exist }
  it { expect(jupiter).to exist }
  it { expect(planetx).to exist }

  it { expect(ra).not_to exist }
end
