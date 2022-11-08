require './rental'

module CreateRental
  def create_rental
    puts 'Select book by ID: '
    @books.each_with_index do |book, index|
      puts "ID: #{index + 1}, Title: #{book.title}, Author: #{book.author}"
    end
    book_id = gets.chomp.to_i
    puts 'Book selected'

    puts 'Select person by ID: '
    @people.each_with_index do |person, index|
      puts "ID:#{index + 1}, Name: #{person.name}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    puts 'Person selected'

    print 'Date (yyyy-mm-dd): '
    date = gets.chomp.to_s
    puts 'Date of renting book is added'
    @rentals << Rental.new(date, @people[person_id - 1], @books[book_id - 1])
    puts 'Rental book created successfully'
  end
end
