class Person
  def initialize(name = "unknown", age, parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_reader :name
  attr_reader :age

  attr_writer :name
  attr_writer :age

  def is_of_age?
    if @age >= 18
        true
    else
        false
    end
  end

  def can_use_services?
    if @age >= 18 || @parent_permission == true
        true
    else
        false
    end
  end
end