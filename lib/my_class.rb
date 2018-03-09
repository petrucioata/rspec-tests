class MyClass
  def build(name, options = {})
  end

  def greetings(message = 'Hello', *people_list)
    "#{message} #{people_list.map(&:capitalize).join(' ')}"
  end

  def helooo(person)
    "Hey #{person}"
  end

  def inspect
    'my_object'
  end

  def find(name='id', limit: 1_000, offset: 0)
    []
  end
end
