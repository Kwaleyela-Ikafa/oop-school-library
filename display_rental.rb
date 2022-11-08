module DisplayRental
  def list_rentals
    puts 'Select person by ID'
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
    print 'Enter ID: '
    id = gets.chomp.to_i
    rental = @rentals.select { |rent| rent.person.id == id }

    if rental.empty?
      puts 'Sorry, there is no rental with that id'
    else
      puts 'Rentals:'
      @rentals.each do |rented|
        puts "Date: #{rented.date}, Book: #{rented.book.title}' by #{rented.book.author}" if rented.person.id == id
      end
    end
  end
end
