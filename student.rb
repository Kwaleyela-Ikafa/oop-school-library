require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  # rubocop:disable Lint/UnusedMethodArgument
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: true)
    @classroom = classroom
  end
  # rubocop:enable Lint/UnusedMethodArgument

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
