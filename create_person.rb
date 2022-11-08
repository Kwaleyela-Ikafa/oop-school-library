require './create_student'
require './create_teacher'

module CreatePerson
  include CreateStudent
  include CreateTeacher

  def create_person
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp.to_i

    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid Input try again'
    end
  end
end
