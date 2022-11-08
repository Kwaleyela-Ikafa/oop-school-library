require './book'

module CreateBook
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
end
