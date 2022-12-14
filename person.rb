require './nameable'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :id, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  def can_use_services?
    @age >= 18 || @parent_permission == true
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
