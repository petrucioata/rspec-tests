require 'rspec'
require 'person'

describe 'have_attributes matcher' do
  let(:john) { Person.new('John', 25) }
  let(:jasmine) { Person.new('Jasmine', 23) }
  let(:people) { [ john, jasmine ] }

  it { expect(john).to have_attributes(name: "John") }
  it { expect(people).to all(have_attributes(name: a_string_starting_with("J"))) }
  it { expect(jasmine).to have_attributes(age: 23) }
  it { expect(people).to all(have_attributes(age: (a_value > 20))) }
  it { expect(jasmine).to have_attributes(name: "Jasmine", age: 23) }
  it { expect(john).to have_attributes(name: a_string_starting_with("J"), age: (a_value > 24) ) }

  it { expect(john).not_to have_attributes(name: "Bob") }
  it { expect(jasmine).not_to have_attributes(age: 10) }
  it { expect(jasmine).not_to have_attributes(age: (a_value < 20)) }

  # fails if any of the attributes don't match
  it { expect(john).not_to have_attributes(name: 'Jim', age: 32) }
  it { expect(john).not_to have_attributes(name: 'Jasmine', age: 26) }
end
