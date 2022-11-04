require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name = 'Unknown', parent_permission: true)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
