require './person'
require './book'
require './student'
require './classroom'
require './teacher'
require './rental'

require_relative './display_books'
require_relative './display_people'
require_relative './display_rental'
require_relative './create_book'
require_relative './create_rental'
require_relative './create_person'

class App
  include CreateBook
  include CreateRental
  include CreatePerson
  include DisplayBooks
  include DisplayPeople
  include DisplayRental

  def initialize
    @books = []
    @people = []
    @rentals = []
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
