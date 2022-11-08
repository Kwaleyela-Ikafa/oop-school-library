require './student'

module CreateStudent
  def create_student
    puts 'create student'
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter student name: '
    name = gets.chomp
    print 'Has parents permission [Y/N]: '
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'n'
      student = Student.new(age, @class, name, parent_permission: false)
      @people << student
      puts 'Student does not have parent permission, cannot rent books'
    when 'y'
      student = Student.new(age, @class, name, parent_permission: true)
      @people << student
      puts "Student #{name}, created successfully"
    else
      puts 'choose between y/n'
    end
  end
end
