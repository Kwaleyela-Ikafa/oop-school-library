require './person'
require './book'
require './student'
require './classroom'
require './teacher'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'Database is empty, Add a book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    puts 'Database is empty, Add a person.' if @people.empty?
    @people.each do |person|
      puts "[#{person.class.name}] Age: #{person.age}, Name: #{person.name}
        id: #{person.id}"
    end
  end

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
      Student.new(age, name, parent_permission: false)
      puts 'Student does not have parent permission, cannot rent books'
    when 'y'
      student = Student.new(age, name, parent_permission: true)
      @people << student
      puts "Student #{name}, created successfully"
    end
  end

  def create_teacher
    puts 'Create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    print 'Enter teacher name: '
    name = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people << teacher
    puts "Teacher #{name}, created successfully"
  end

  def create_book
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book #{title} created successfully."
  end

  def create_rental
    puts 'Enter the number of a book you want to rent from the list: '
    list_books
    book_id = gets.chomp.to_i
    puts 'Book selected'
    puts 'Select a person from the list by the number: '
    list_people
    person_id = gets.chomp.to_i
    puts 'Person selected'
    print 'Date: '
    date = gets.chomp
    puts 'Date of renting book is added'
    @rentals.push(Rental.new(date, @people[person_id - 1], @books[book_id - 1]))
    puts 'Rental book created successfully'
  end

  def list_rentals
    print 'To see person rentals enter the person ID: '
    id = gets.chomp.to_i

    puts 'Rented Books:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author} to #{rental.person.name}"
      end
    end
  end

  def main_menu
    puts 'Main menu'
    puts 'Please choose an option by entering a number:
            1 - List all Books
            2 - List all People
            3 - Create a person
            4 - Create a book
            5 - Create a rental
            6 - List all rentals for a given person id
            7 - Exit Library'
    puts 'Waiting for Selection...'
  end

  def menu
    main_menu
    selected = gets.chomp.to_i
    case selected
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    when 7
      puts 'Hope to see you again'
      exit
    else
      puts 'Not a valid choice'
    end
  end
end
