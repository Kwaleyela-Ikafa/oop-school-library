module DisplayPeople
  def list_people
    puts 'Database is empty, Add a person.' if @people.empty?
    @people.each_with_index do |person, index|
      puts "#{index + 1}) [#{person.class}] Age: #{person.age}, Name: #{person.name}
            id: #{person.id}"
    end
  end
end
