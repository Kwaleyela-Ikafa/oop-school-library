module DisplayBooks
  def list_books
    puts 'Database is empty, Add a book.' if @books.empty?
    @books.each_with_index { |book, index|
      puts "#{index + 1}) [Book] Title: #{book.title}, Author: #{book.author}"
    }
  end
end
