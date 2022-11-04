require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown')
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  # rubocop:disable Lint/DuplicateMethods
  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  # rubocop:enable Lint/DuplicateMethods
  def play_hooky
    '¯\(ツ)/¯'
  end
end
